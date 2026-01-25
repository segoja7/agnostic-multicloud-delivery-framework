"""
Kyverno CLI integration for policy validation
"""
import subprocess
import shutil
from typing import Optional, Dict


class KyvernoValidator:
    """Validates Kubernetes manifests using Kyverno CLI"""
    
    def __init__(self):
        self.kyverno_cli = shutil.which("kyverno")
    
    def is_available(self) -> bool:
        """Check if Kyverno CLI is installed"""
        return self.kyverno_cli is not None
    
    def validate_manifest(
        self, 
        manifest_path: str, 
        use_cluster: bool = True,
        policy_path: Optional[str] = None,
        git_branch: str = "main"
    ) -> Dict:
        """
        Validate a Kubernetes manifest against Kyverno policies
        
        Args:
            manifest_path: Path to YAML manifest
            use_cluster: Validate against policies in cluster (default: True)
            policy_path: Path to policy file/directory or Git URL (optional, overrides use_cluster)
            git_branch: Git branch to use when policy_path is a Git URL (default: main)
        
        Returns:
            Dict with validation results
        """
        if not self.is_available():
            return {
                "success": False,
                "error": "kyverno_cli_not_found"
            }
        
        # Build command
        cmd = [self.kyverno_cli, "apply"]
        
        if policy_path:
            # Use specific policy (local path or URL)
            cmd.append(policy_path)
            
            # If it's a Git URL, add --git-branch
            if policy_path.startswith(("http://", "https://")):
                cmd.extend(["--git-branch", git_branch])
        elif use_cluster:
            # Validate against cluster policies
            cmd.append("--cluster")
        else:
            # No policy specified
            return {
                "success": False,
                "error": "no_policy_specified"
            }
        
        cmd.extend(["--resource", manifest_path])
        
        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=30
            )
            
            return {
                "success": result.returncode == 0,
                "stdout": result.stdout,
                "stderr": result.stderr,
                "returncode": result.returncode
            }
        
        except subprocess.TimeoutExpired:
            return {
                "success": False,
                "error": "timeout"
            }
        except Exception as e:
            return {
                "success": False,
                "error": str(e)
            }
