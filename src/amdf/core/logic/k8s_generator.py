"""
Kubernetes Native Object Schema Generator
Generates KCL schemas from Kubernetes OpenAPI specifications
"""

import json
import textwrap
import urllib.request
from pathlib import Path
from typing import Dict, Any, Tuple

from .generator import to_pascal_case, init_kcl_module_if_needed

INDENT = "    "


class K8SNativeGenerator:
    """Generator for native Kubernetes object schemas"""
    
    def __init__(self, kind: str, k8s_version: str = "1.35.0"):
        self.kind = kind
        self.k8s_version = k8s_version
        self.openapi_spec = None
        self.schemas_to_generate = {}
        self.generated_schemas = set()
        
    def _load_openapi_spec(self):
        """Load Kubernetes OpenAPI specification"""
        if self.openapi_spec:
            return
            
        url = f"https://raw.githubusercontent.com/kubernetes/kubernetes/v{self.k8s_version}/api/openapi-spec/swagger.json"
        
        try:
            with urllib.request.urlopen(url) as response:
                self.openapi_spec = json.loads(response.read())
        except Exception as e:
            raise ValueError(f"Failed to load Kubernetes OpenAPI spec: {e}")
    
    def _find_definition_key(self) -> str:
        """Find the definition key for the given kind"""
        self._load_openapi_spec()
        
        definitions = self.openapi_spec.get("definitions", {})
        
        # Search for the kind in definitions
        for key in definitions.keys():
            if key.endswith(f".{self.kind}"):
                return key
        
        raise ValueError(f"Kind '{self.kind}' not found in Kubernetes v{self.k8s_version}")
    
    def _resolve_ref(self, ref: str) -> Dict[str, Any]:
        """Resolve a $ref to its definition"""
        if not ref.startswith("#/definitions/"):
            raise ValueError(f"Unsupported $ref format: {ref}")
        
        def_key = ref.replace("#/definitions/", "")
        definition = self.openapi_spec["definitions"].get(def_key)
        
        if not definition:
            raise ValueError(f"Definition not found: {def_key}")
        
        return definition
    
    def _resolve_schema(self, schema: Dict[str, Any]) -> Dict[str, Any]:
        """Recursively resolve all $ref in a schema"""
        if "$ref" in schema:
            return self._resolve_ref(schema["$ref"])
        
        resolved = schema.copy()
        
        if "properties" in resolved:
            resolved["properties"] = {
                k: self._resolve_schema(v) 
                for k, v in resolved["properties"].items()
            }
        
        if "items" in resolved:
            resolved["items"] = self._resolve_schema(resolved["items"])
        
        if "additionalProperties" in resolved and isinstance(resolved["additionalProperties"], dict):
            resolved["additionalProperties"] = self._resolve_schema(resolved["additionalProperties"])
        
        return resolved
    
    def _find_all_schemas(self, schema_name: str, schema_def: Dict[str, Any]):
        """Discover all schemas needed for generation"""
        if not schema_def or schema_name in self.schemas_to_generate:
            return

        self.schemas_to_generate[schema_name] = schema_def

        properties = schema_def.get("properties", {})
        for prop_name, prop_def in properties.items():
            prop_type = prop_def.get("type")

            if prop_type == "object" and "properties" in prop_def:
                nested_schema_name = to_pascal_case(f"{schema_name}_{prop_name}")
                self._find_all_schemas(nested_schema_name, prop_def)
            elif prop_type == "object" and "additionalProperties" in prop_def:
                additional_props = prop_def["additionalProperties"]
                if additional_props.get("type") == "object" and "properties" in additional_props:
                    nested_schema_name = to_pascal_case(f"{schema_name}_{prop_name}Value")
                    self._find_all_schemas(nested_schema_name, additional_props)
            elif prop_type == "array" and prop_def.get("items", {}).get("type") == "object":
                items_def = prop_def.get("items", {})
                if "properties" in items_def:
                    nested_schema_name = to_pascal_case(f"{schema_name}_{prop_name}Item")
                    self._find_all_schemas(nested_schema_name, items_def)
    
    def _get_kcl_type(self, prop_name: str, prop_def: Dict[str, Any], parent_schema_name: str) -> str:
        """Convert OpenAPI type to KCL type"""
        prop_type = prop_def.get("type")
        
        if prop_type == "string":
            if "enum" in prop_def:
                return " | ".join([f'"{e}"' for e in prop_def["enum"]])
            return "str"
        if prop_type == "boolean":
            return "bool"
        if prop_type == "integer":
            return "int"
        if prop_type == "number":
            return "float"
        if prop_type == "array":
            items = prop_def.get("items", {})
            item_type = self._get_kcl_type(f"{prop_name}Item", items, parent_schema_name)
            return f"[{item_type}]"
        if prop_type == "object":
            if "properties" in prop_def:
                return to_pascal_case(f"{parent_schema_name}_{prop_name}")
            if "additionalProperties" in prop_def:
                val_type = self._get_kcl_type(
                    f"{prop_name}Value", prop_def["additionalProperties"], parent_schema_name
                )
                return f"{{str:{val_type}}}"
        
        return "any"
    
    def _generate_docstring(self, schema_name: str, schema_def: Dict[str, Any]) -> str:
        """Generate docstring for schema"""
        description = textwrap.dedent(schema_def.get("description", f"{schema_name} schema.")).strip()
        # Escape ${...} to avoid KCL string interpolation in docstrings
        description = description.replace("${", "\\${")
        
        lines = ['"""', description]
        
        properties = schema_def.get("properties", {})
        if properties:
            lines.append("")
            lines.append("Attributes")
            lines.append("----------")
            for prop_name, prop_def in properties.items():
                prop_desc = prop_def.get("description", "No description available.")
                prop_desc = textwrap.dedent(prop_desc).strip().replace("\n", " ")
                # Escape ${...} in property descriptions too
                prop_desc = prop_desc.replace("${", "\\${")
                required = prop_name in schema_def.get("required", [])
                req_text = "" if required else ", optional"
                kcl_type = self._get_kcl_type(prop_name, prop_def, schema_name)
                lines.append(f"{prop_name} : {kcl_type}{req_text}")
                lines.append(f"    {prop_desc}")
        
        lines.append('"""')
        return "\n".join(lines)
    
    def _generate_single_schema(self, schema_name: str, schema_def: Dict[str, Any], 
                               is_root: bool = False, api_version: str = None) -> str:
        """Generate a single KCL schema"""
        if schema_name in self.generated_schemas:
            return ""

        docstring = self._generate_docstring(schema_name, schema_def)
        attributes = []
        properties = schema_def.get("properties", {})
        required_fields = schema_def.get("required", [])

        # For root schemas, always add Kubernetes standard fields first
        if is_root:
            attributes.append(f'apiVersion : str = "{api_version}"')
            attributes.append(f'kind : str = "{self.kind}"')

        for prop_name, prop_def in properties.items():
            # Skip if already added as root field
            if is_root and prop_name in ["apiVersion", "kind"]:
                continue
                
            kcl_type = self._get_kcl_type(prop_name, prop_def, schema_name)
            is_required = prop_name in required_fields
            attr_line = f"{prop_name}{ '' if is_required else '?'} : {kcl_type}"
            attributes.append(attr_line)

        schema_body = textwrap.indent("\n".join(attributes), INDENT)
        self.generated_schemas.add(schema_name)
        return "schema " + schema_name + ":\n" + textwrap.indent(docstring, INDENT) + "\n" + schema_body
    
    def generate(self, base_dir: str = "") -> Tuple[str, str]:
        """Generate KCL schema file"""
        self._load_openapi_spec()
        
        # Find and resolve the main definition
        def_key = self._find_definition_key()
        main_def = self.openapi_spec["definitions"][def_key]
        
        # Resolve all $ref recursively
        resolved_def = self._resolve_schema(main_def)
        
        # Extract API version from definition key (e.g., io.k8s.api.core.v1.Pod -> core/v1)
        parts = def_key.split(".")
        if len(parts) >= 5:
            group = parts[3] if parts[3] != "core" else ""
            version = parts[4]
            api_version = f"{group}/{version}" if group else version
        else:
            api_version = "v1"
        
        # Find all schemas
        self._find_all_schemas(self.kind, resolved_def)
        
        # Generate all schemas
        schema_names_ordered = list(self.schemas_to_generate.keys())
        all_kcl_code = []
        
        for i, schema_name in enumerate(schema_names_ordered):
            schema_def = self.schemas_to_generate[schema_name]
            is_root = (i == 0)
            all_kcl_code.append(self._generate_single_schema(
                schema_name, schema_def, is_root=is_root, api_version=api_version
            ))
        
        file_header = textwrap.dedent('''
            """
            This file was generated automatically from Kubernetes OpenAPI specification.
            DO NOT EDIT MANUALLY.
            """
        ''').strip()
        
        final_content = file_header + "\n\n" + "\n\n".join(all_kcl_code)
        
        # Initialize KCL module if needed
        init_kcl_module_if_needed(base_dir)
        
        # Save to file
        output_path = Path(base_dir) / "library" / "models" / "k8s" / api_version.replace("/", "_")
        output_path.mkdir(parents=True, exist_ok=True)
        
        file_path = output_path / f"k8s_{api_version.replace('/', '_')}_{self.kind}.k"
        
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(final_content)
        
        return str(file_path), final_content
