"""
Kyverno Policy to KCL Check Translator

Translates Kyverno ClusterPolicy YAML to KCL validation checks.
Supports pattern matching, deny conditions, and structural validation.
"""

import yaml
from typing import List, Dict, Any, Optional
from pathlib import Path


class KyvernoTranslator:
    """Translates Kyverno policies to KCL checks"""
    
    def __init__(self):
        self.supported_patterns = ['pattern', 'deny']
    
    def translate_policy(
        self, 
        policy_path: str, 
        target_kind: str, 
        mode: str = "hard"
    ) -> Optional[Dict[str, Any]]:
        """
        Translate a Kyverno policy to KCL checks
        
        Args:
            policy_path: Path to Kyverno policy YAML
            target_kind: Target CRD kind (e.g., "Deployment")
            mode: "hard" (only if applies) or "soft" (try to adapt)
            
        Returns:
            Dict with 'checks' list and 'metadata', or None if not applicable
        """
        policy = self._load_policy(policy_path)
        
        if not policy:
            return None
            
        # Safety check: Verify it is a valid Policy/ClusterPolicy with a spec
        if policy.get('kind') not in ['ClusterPolicy', 'Policy'] or 'spec' not in policy:
            return None
        
        # Check if policy applies to target
        applies = self._policy_applies_to_kind(policy, target_kind)
        
        if mode == "hard" and not applies:
            return {
                'applies': False,
                'reason': f"Policy does not apply to {target_kind}",
                'applicable_kinds': self._get_applicable_kinds(policy)
            }
        
        # Extract checks from all rules
        all_checks = []
        metadata = {
            'policy_name': policy['metadata']['name'],
            'source': policy_path,
            'mode': mode
        }
        
        for rule in policy['spec'].get('rules', []):
            checks = self._translate_rule(rule, target_kind, mode)
            all_checks.extend(checks)
        
        return {
            'applies': True,
            'checks': all_checks,
            'metadata': metadata
        }
    
    def _load_policy(self, policy_path: str) -> Optional[Dict]:
        """Load Kyverno policy from YAML file"""
        try:
            with open(policy_path, 'r') as f:
                return yaml.safe_load(f)
        except Exception as e:
            print(f"Error loading policy {policy_path}: {e}")
            return None
    
    def _policy_applies_to_kind(self, policy: Dict, target_kind: str) -> bool:
        """Check if policy applies to the target kind"""
        # Extract target kind and apiGroup from the full CRD name
        parts = target_kind.split('.')
        
        extracted_target_kind_from_crd = target_kind
        if parts and '.' in target_kind:
            # Inline singularization: remove 's' if it ends with 's' and not 'ss'
            word = parts[0]
            if word.endswith('s') and not word.endswith('ss'):
                singular = word[:-1]
            else:
                singular = word
            extracted_target_kind_from_crd = singular.capitalize()
            
        extracted_target_api_group_from_crd = ".".join(parts[1:]) if '.' in target_kind else ""
        
        # print(f"DEBUG: Checking policy against: Kind={extracted_target_kind_from_crd}, Group={extracted_target_api_group_from_crd}")

        for rule in policy['spec'].get('rules', []):
            match_section = rule.get('match', {})
            
            # Check 'any' matches
            for match_rule in match_section.get('any', []):
                resources = match_rule.get('resources', {})
                kinds = resources.get('kinds', [])
                api_groups = resources.get('apiGroups', [])
                
                if self._check_kind_and_group_match(extracted_target_kind_from_crd, extracted_target_api_group_from_crd, kinds, api_groups):
                    return True
            
            # Check 'all' matches
            for match_rule in match_section.get('all', []):
                resources = match_rule.get('resources', {})
                kinds = resources.get('kinds', [])
                api_groups = resources.get('apiGroups', [])
                
                if self._check_kind_and_group_match(extracted_target_kind_from_crd, extracted_target_api_group_from_crd, kinds, api_groups):
                    return True
        
        return False

    def _check_kind_and_group_match(self, target_kind: str, target_api_group: str, policy_kinds: List[str], policy_api_groups: List[str]) -> bool:
        """Helper to match target kind and apiGroup against policy definitions"""
        
        # Debug: print(f"DEBUG MATCH: TargetKind={target_kind}, TargetGroup={target_api_group} vs PolicyKinds={policy_kinds}, PolicyGroups={policy_api_groups}")
        
        # Check kind
        kind_match = False
        if not policy_kinds: # If policy has no kinds, it applies to all
            kind_match = True
        else:
            for policy_kind in policy_kinds:
                # 1. Exact match
                if target_kind == policy_kind:
                    kind_match = True
                    break
                # 2. Case insensitive match
                if target_kind.lower() == policy_kind.lower():
                    kind_match = True
                    break
                # 3. Containment match (robust fallback for Backup vs backups.velero.io)
                if policy_kind.lower() in target_kind.lower():
                    kind_match = True
                    break
                # 4. Pod special case
                if policy_kind == 'Pod' and target_kind in ['Deployment', 'StatefulSet', 'DaemonSet', 'Job', 'CronJob', 'ReplicaSet']:
                    kind_match = True
                    break

        if not kind_match:
            return False

        # Check apiGroup
        group_match = False
        if not policy_api_groups: # If policy has no apiGroups, it applies to all groups
            group_match = True
        elif target_api_group in policy_api_groups:
            group_match = True
            
        return kind_match and group_match
    
    def _get_applicable_kinds(self, policy: Dict) -> List[str]:
        """Extract all kinds that the policy applies to"""
        kinds = set()
        
        for rule in policy['spec'].get('rules', []):
            match_section = rule.get('match', {})
            
            for match_rule in match_section.get('any', []):
                kinds.update(match_rule.get('resources', {}).get('kinds', []))
            
            for match_rule in match_section.get('all', []):
                kinds.update(match_rule.get('resources', {}).get('kinds', []))
        
        return sorted(list(kinds))
    
    def _translate_rule(self, rule: Dict, target_kind: str, mode: str) -> List[str]:
        """Translate a single Kyverno rule to KCL checks"""
        validate = rule.get('validate', {})
        message = validate.get('message', 'Validation failed')
        checks = []
        
        # Handle pattern validation
        if 'pattern' in validate:
            checks.extend(
                self._translate_pattern(validate['pattern'], message)
            )
        
        # Handle foreach validation
        if 'foreach' in validate:
            checks.extend(
                self._translate_foreach(validate['foreach'], message)
            )
        
        # Handle deny conditions
        if 'deny' in validate:
            checks.extend(
                self._translate_deny(validate['deny'], message)
            )
        
        return checks
    
    def _clean_kyverno_pattern(self, pattern: Dict) -> Dict:
        """Remove Kyverno pattern operators like =(...) from keys"""
        if not isinstance(pattern, dict):
            return pattern
        
        cleaned = {}
        for key, value in pattern.items():
            # Remove =(...) wrapper
            clean_key = key.lstrip('=(').rstrip(')')
            
            if isinstance(value, dict):
                cleaned[clean_key] = self._clean_kyverno_pattern(value)
            elif isinstance(value, list):
                cleaned[clean_key] = [
                    self._clean_kyverno_pattern(item) if isinstance(item, dict) else item
                    for item in value
                ]
            else:
                cleaned[clean_key] = value
        
        return cleaned
    
    def _translate_pattern(self, pattern: Dict, message: str) -> List[str]:
        """Translate Kyverno pattern to KCL checks"""
        checks = []
        
        # Clean Kyverno operators first
        pattern = self._clean_kyverno_pattern(pattern)
        
        # Metadata labels
        if 'metadata' in pattern and 'labels' in pattern['metadata']:
            for label, value in pattern['metadata']['labels'].items():
                if value == "?*":  # Required label
                    checks.append(
                        f'"{label}" in _labels, "{message}"'
                    )
        
        # Metadata annotations
        if 'metadata' in pattern and 'annotations' in pattern['metadata']:
            for annotation, value in pattern['metadata']['annotations'].items():
                if value == "?*":  # Required annotation
                    checks.append(
                        f'"{annotation}" in _annotations, "{message}"'
                    )
        
        # Container image restrictions
        if 'spec' in pattern:
            checks.extend(self._translate_spec_pattern(pattern['spec'], message))
        
        return checks
    
    def _translate_spec_pattern(self, spec: Dict, message: str) -> List[str]:
        """Translate spec-level patterns"""
        checks = []
        
        # Handle Deployment/StatefulSet/DaemonSet template
        if 'template' in spec and 'spec' in spec['template']:
            pod_spec = spec['template']['spec']
            
            # Container validations
            if 'containers' in pod_spec:
                for container_pattern in pod_spec['containers']:
                    checks.extend(
                        self._translate_container_pattern(container_pattern, message)
                    )
        
        # Handle direct Pod spec (no template)
        elif 'containers' in spec:
            for container_pattern in spec['containers']:
                checks.extend(
                    self._translate_container_pattern(container_pattern, message)
                )
        
        # Handle replicas
        if 'replicas' in spec:
            replicas_pattern = spec['replicas']
            if isinstance(replicas_pattern, str):
                checks.append(
                    f'_replicas {replicas_pattern}, "{message}"'
                )
        
        return checks
    
    def _translate_container_pattern(self, container: Dict, message: str) -> List[str]:
            """Translate container-level patterns"""
            checks = []
            
            # Image restrictions
            if 'image' in container:
                image_pattern = container['image']
                
                # Negation pattern (e.g., "!*:latest")
                if image_pattern.startswith("!"):
                    forbidden = image_pattern[1:]
                    if forbidden == "*:latest":
                        checks.append(
                            'all container in _template.spec.containers { '
                            'not container.image.endswith(":latest") '
                            f'}}, "{message}"'
                        )
                    else:
                        # Generic negation
                        checks.append(
                            f'all container in _template.spec.containers {{ '
                            f'not container.image.matches("{forbidden}") '
                            f'}}, "{message}"'
                        )
                
                # Positive pattern (e.g., "registry.company.com/*")
                elif "*" in image_pattern:
                    prefix = image_pattern.replace("*", "")
                    checks.append(
                        f'all container in _template.spec.containers {{ '
                        f'container.image.startswith("{prefix}") '
                        f'}}, "{message}"'
                        )
            
            # Security Context
            if 'securityContext' in container:
                sec_ctx = container['securityContext']
                
                # Handle privileged
                if 'privileged' in sec_ctx:
                    expected = sec_ctx['privileged']
                    if expected == "false" or expected is False:
                        checks.append(
                            f'all container in _containers {{ '
                            f'not (container?.securityContext?.privileged == True) '
                            f'}}, "{message}"'
                        )
                
                # Handle runAsNonRoot
                if 'runAsNonRoot' in sec_ctx:
                    expected = sec_ctx['runAsNonRoot']
                    if expected == "true" or expected is True:
                        checks.append(
                            f'all container in _containers {{ '
                            f'container?.securityContext?.runAsNonRoot == True '
                            f'}}, "{message}"'
                        )
                
                # Handle allowPrivilegeEscalation
                if 'allowPrivilegeEscalation' in sec_ctx:
                    expected = sec_ctx['allowPrivilegeEscalation']
                    if expected == "false" or expected is False:
                        checks.append(
                            f'all container in _containers {{ '
                            f'not (container?.securityContext?.allowPrivilegeEscalation == True) '
                            f'}}, "{message}"'
                        )
                
                # Handle capabilities
                if 'capabilities' in sec_ctx:
                    caps = sec_ctx['capabilities']
                    if 'drop' in caps:
                        required_drops = caps['drop']
                        if isinstance(required_drops, list):
                            for cap in required_drops:
                                checks.append(
                                    f'all container in _containers {{ '
                                    f'"{cap}" in (container?.securityContext?.capabilities?.drop or []) '
                                    f'}}, "{message}"'
                                )
            
            # Resource limits
            if 'resources' in container:
                resources = container['resources']
                
                if 'limits' in resources:
                    for resource, value in resources['limits'].items():
                        if value == "?*":  # Required
                            checks.append(
                                f'all container in _template.spec.containers {{ '
                                f'"{resource}" in container.resources.limits '
                                f'}}, "{message}"'
                            )
            
            return checks    
    def _translate_deny(self, deny: Dict, message: str) -> List[str]:
        """Translate Kyverno deny conditions to KCL checks"""
        checks = []
        
        conditions = deny.get('conditions', {})
        
        # Handle 'any' conditions (OR logic)
        for condition in conditions.get('any', []):
            check = self._translate_expression_condition(condition, message) # Use new helper
            if check:
                checks.append(f"not ({check}), \"{message}\"") # Deny means the condition must NOT be true
        
        return checks
    
    def _translate_expression_condition(self, condition: Dict, message: str) -> Optional[str]:
        """Translate a single deny condition with expression"""
        key = condition.get('key', '')
        operator = condition.get('operator', '')
        value = condition.get('value', '')
        
        # Kyverno expressions in 'key' (e.g., "{{ contains(element, '*') }}")
        if key.startswith('{{') and key.endswith('}}'):
            expression_body = key[2:-2].strip()
            
            # Simple 'contains(element, *)' for now
            if expression_body.startswith('contains(element,') and expression_body.endswith(')'):
                part = expression_body[len('contains(element,'):-1].strip()
                if part == "''*'": # Kyverno might output it like this
                    return f"'*' in element"
                elif part == "'*'" :
                    return f"'*' in element"
                else:
                    return f"{part} in element" # For other contains
            
        # Simple key-value checks (fallback for non-expression conditions)
        if operator == 'Equals':
            return f'({key} == "{value}")'
        elif operator == 'NotEquals':
            return f'({key} != "{value}")'
        
        return None

    def _translate_foreach(self, foreach_list: List[Dict], message: str) -> List[str]:
        """Translate Kyverno foreach to KCL checks"""
        checks = []
        
        for foreach_item in foreach_list:
            list_path = foreach_item.get('list', '')
            deny_conditions = foreach_item.get('deny', {}).get('conditions', {}).get('any', [])
            
            # Translate list path to KCL
            kcl_list_path = ""
            if list_path == "request.object.spec.hosts":
                kcl_list_path = "_hosts"
            elif 'containers' in list_path: # Generic container path for Deployment like resources
                kcl_list_path = "_template.spec.containers"
            # Add more specific paths as needed
            
            if kcl_list_path and deny_conditions:
                # Assuming one 'any' condition for now, which is common for foreach+deny
                for condition in deny_conditions:
                    kcl_condition = self._translate_expression_condition(condition, message)
                    if kcl_condition:
                        # For 'foreach' with 'deny', if the condition is TRUE for ANY element, then DENY
                        # So, in KCL, the overall check should be: NOT (ANY element matches the deny condition)
                        # Example: not (any element in _hosts { element.contains('*') })
                        checks.append(
                            f"not (any element in {kcl_list_path} {{ {kcl_condition} }}), \"{message}\""
                        )
        
        return checks
    
    def _translate_container_foreach(self, pattern: Dict, message: str, container_type: str = 'containers') -> List[str]:
        """Translate foreach over containers"""
        checks = []
        
        # Image validation
        if 'image' in pattern:
            image_pattern = pattern['image']
            
            # Negation (e.g., "!*:latest")
            if image_pattern.startswith("!"):
                forbidden = image_pattern[1:]
                if forbidden == "*:latest":
                    checks.append(
                        f'all container in _template.spec.containers {{ '
                        f'not container.image.endswith(":latest") '
                        f'}}, "{message}"'
                    )
                elif "*" in forbidden:
                    # Wildcard pattern (e.g., "*tiller*")
                    pattern_clean = forbidden.replace("*", "")
                    checks.append(
                        f'all container in _template.spec.containers {{ '
                        f'"{pattern_clean}" not in container.image '
                        f'}}, "{message}"'
                    )
                else:
                    checks.append(
                        f'all container in _template.spec.containers {{ '
                        f'container.image != "{forbidden}" '
                        f'}}, "{message}"'
                    )
            
            # Required pattern (e.g., "*:*" means tag required)
            elif image_pattern == "*:*":
                checks.append(
                    f'all container in _template.spec.containers {{ '
                    f'":" in container.image '
                    f'}}, "{message}"'
                )
            
            # Positive pattern (e.g., "registry.company.com/*")
            elif "*" in image_pattern:
                prefix = image_pattern.replace("*", "")
                checks.append(
                    f'all container in _template.spec.containers {{ '
                    f'container.image.startswith("{prefix}") '
                    f'}}, "{message}"'
                )
        
        # Resource limits
        if 'resources' in pattern:
            resources = pattern['resources']
            
            if 'limits' in resources:
                for resource, value in resources['limits'].items():
                    if value == "?*":  # Required
                        checks.append(
                            f'all container in _template.spec.containers {{ '
                            f'"{resource}" in container.get("resources", {{}}).get("limits", {{}}) '
                            f'}}, "{message}"'
                        )
        
        # Security context
        if 'securityContext' in pattern:
            sec_ctx = pattern['securityContext']
            
            for key, value in sec_ctx.items():
                if isinstance(value, bool):
                    checks.append(
                        f'all container in _template.spec.containers {{ '
                        f'container.get("securityContext", {{}}).get("{key}", False) == {str(value).lower()} '
                        f'}}, "{message}"'
                    )
        
        return checks


def format_checks_for_schema(checks: List[str], indent: int = 4, mode: str = "hard") -> str:
    """
    Format KCL checks for insertion into a schema
    
    Args:
        checks: List of KCL check strings
        indent: Number of spaces for indentation
        mode: "hard" (active), "soft" (commented), or "none"
        
    Returns:
        Formatted check block
    """
    if not checks or mode == "none":
        return ""
    
    indent_str = " " * indent
    
    if mode == "hard":
        # Active checks (enforced)
        formatted = "\n" + indent_str + "check:\n"
        for check in checks:
            formatted += indent_str + "    " + check + "\n"
    
    elif mode == "soft":
        # Commented checks (suggestions)
        formatted = "\n" + indent_str + "# Suggested policies (uncomment to enable):\n"
        formatted += indent_str + "# check:\n"
        for check in checks:
            formatted += indent_str + "#     " + check + "\n"
    
    return formatted


def generate_policy_module(checks: List[str], metadata: Dict[str, Any], crd_kind: str) -> str:
    """
    Generate a separate policy module file
    
    Args:
        checks: List of KCL check strings
        metadata: Policy metadata
        crd_kind: Target CRD kind
        
    Returns:
        KCL policy module code
    """
    policy_name = metadata.get('policy_name', 'UnknownPolicy')
    source = metadata.get('source', 'unknown')
    
    # Convert policy name to schema name
    schema_name = ''.join(word.capitalize() for word in policy_name.replace('-', '_').split('_'))
    
    code = f'''"""
Kyverno Policy: {policy_name}
Source: {source}
Applies to: {crd_kind}

Auto-generated by AMDF from Kyverno policy library.
"""

schema {schema_name}:
    """
    Policy mixin for {crd_kind}
    
    Usage:
        import library.policies.{crd_kind.lower()}_policies
        
        resource = {crd_kind}Blueprint {{
            # ... configuration ...
        }}
        
        mixin [{crd_kind.lower()}_policies.{schema_name}] for resource
    """
    
    check:
'''
    
    for check in checks:
        code += f"        {check}\n"
    
    return code
