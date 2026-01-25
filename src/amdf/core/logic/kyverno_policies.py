"""
Kyverno Policy Management

Handles downloading and caching Kyverno policies from the official library.
"""

import os
import requests
from pathlib import Path
from typing import List, Dict, Optional


class KyvernoPolicyManager:
    """Manages Kyverno policy library"""
    
    KYVERNO_REPO = "https://api.github.com/repos/kyverno/policies/contents"
    KYVERNO_RAW = "https://raw.githubusercontent.com/kyverno/policies/main"
    
    def __init__(self, cache_dir: Optional[str] = None):
        """
        Initialize policy manager
        
        Args:
            cache_dir: Directory to cache policies (default: ~/.amdf/policies/kyverno)
        """
        if cache_dir:
            self.cache_dir = Path(cache_dir)
        else:
            self.cache_dir = Path.home() / ".amdf" / "policies" / "kyverno"
        
        self.cache_dir.mkdir(parents=True, exist_ok=True)
    
    def _list_policies_recursive(self, path: str, category: str, policies: List[Dict[str, str]], depth: int = 0, max_depth: int = 3):
        """
        Recursively list policies in a directory
        
        Args:
            path: Current path to explore
            category: Category name for metadata
            policies: List to append found policies
            depth: Current recursion depth
            max_depth: Maximum recursion depth
        """
        if depth > max_depth:
            return
        
        try:
            url = f"{self.KYVERNO_REPO}/{path}"
            response = requests.get(url)
            
            if response.status_code != 200:
                return
            
            items = response.json()
            has_policy_yaml = False
            subdirs = []
            
            # Check if this directory contains a policy.yaml or {name}.yaml
            for item in items:
                if item['type'] == 'file' and item['name'] in ['policy.yaml', f"{path.split('/')[-1]}.yaml"]:
                    has_policy_yaml = True
                    break
                elif item['type'] == 'dir':
                    subdirs.append(item['name'])
            
            # If this directory has a policy, add it
            if has_policy_yaml:
                policy_name = path.split('/')[-1]
                policies.append({
                    'name': policy_name,
                    'category': category,
                    'path': path
                })
            else:
                # Otherwise, recurse into subdirectories
                for subdir in subdirs:
                    self._list_policies_recursive(f"{path}/{subdir}", category, policies, depth + 1, max_depth)
        
        except Exception as e:
            print(f"Error fetching {path}: {e}")
    
    def list_available_policies(self, category: Optional[str] = None) -> List[Dict]:
        """
        List available policies from Kyverno library (recursive)
        
        Args:
            category: Filter by category (e.g., "best-practices", "pod-security")
            
        Returns:
            List of policy metadata dicts
        """
        categories = [
            "best-practices",
            "pod-security",
            "other"
        ]
        
        if category:
            categories = [category]
        
        policies = []
        
        for cat in categories:
            self._list_policies_recursive(cat, cat, policies)
        
        return policies
    
    def download_policy(self, policy_path: str) -> Optional[str]:
        """
        Download a specific policy from Kyverno library
        
        Args:
            policy_path: Path to policy (e.g., "best-practices/disallow-latest-tag")
            
        Returns:
            Local path to downloaded policy, or None if failed
        """
        # Policy YAML is typically named same as directory
        policy_name = policy_path.split('/')[-1]
        
        # Strategies for filenames to try
        filenames_to_try = [
            f"{policy_name}.yaml",
            "policy.yaml",
            "kustomization.yaml" # Sometimes useful to check
        ]
        
        for filename in filenames_to_try:
            url = f"{self.KYVERNO_RAW}/{policy_path}/{filename}"
            
            try:
                response = requests.get(url)
                
                if response.status_code == 200:
                    # Save to cache
                    # We always save it as {path_slug}.yaml to simplify loading later
                    local_path = self.cache_dir / policy_path.replace('/', '_')
                    local_path = local_path.with_suffix('.yaml')
                    
                    local_path.parent.mkdir(parents=True, exist_ok=True)
                    
                    with open(local_path, 'w') as f:
                        f.write(response.text)
                    
                    return str(local_path)
                elif response.status_code == 404:
                    continue # Try next filename
                else:
                    print(f"Failed to download {url}: {response.status_code}")
                    return None
            
            except Exception as e:
                print(f"Error downloading policy: {e}")
                return None
        
        print(f"Could not find policy YAML for {policy_path} (tried {filenames_to_try})")
        return None
    
    def get_policy(self, policy_name: str) -> Optional[str]:
        """
        Get a policy (from cache or download)
        
        Args:
            policy_name: Name of policy (e.g., "disallow-latest-tag")
            
        Returns:
            Local path to policy YAML
        """
        # Check cache first
        cached_files = list(self.cache_dir.glob(f"*{policy_name}*.yaml"))
        
        if cached_files:
            return str(cached_files[0])
        
        # Try to find and download
        policies = self.list_available_policies()
        
        for policy in policies:
            if policy['name'] == policy_name:
                return self.download_policy(policy['path'])
        
        print(f"Policy '{policy_name}' not found in Kyverno library")
        return None
    
    def detect_category_from_crd(self, crd_name: str) -> Optional[str]:
        """
        Detect Kyverno policy category based on CRD name
        
        Args:
            crd_name: CRD name (e.g., "virtualservices.networking.istio.io")
            
        Returns:
            Category name if detected, None otherwise
        """
        # Map of keywords to categories
        category_mappings = {
            'istio.io': 'istio',
            'argoproj.io': 'argo',
            'argo': 'argo',
            'velero.io': 'velero',
            'tekton.dev': 'tekton',
            'cert-manager.io': 'cert-manager',
            'flux': 'fluxcd',
            'linkerd.io': 'linkerd',
            'traefik': 'traefik',
            'karpenter': 'karpenter',
            'kubevirt': 'kubevirt',
            'consul': 'consul',
        }
        
        crd_lower = crd_name.lower()
        
        for keyword, category in category_mappings.items():
            if keyword in crd_lower:
                return category
        
        return None
    
    def sync_all_policies(self, categories: Optional[List[str]] = None):
        """
        Download all policies from specified categories
        
        Args:
            categories: List of categories to sync (default: all)
        """
        if not categories:
            categories = ["best-practices", "pod-security"]
        
        for category in categories:
            policies = self.list_available_policies(category)
            
            print(f"Syncing {len(policies)} policies from {category}...")
            
            for policy in policies:
                self.download_policy(policy['path'])
        
        print(f"Policies synced to {self.cache_dir}")
