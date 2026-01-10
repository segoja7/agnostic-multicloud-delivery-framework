"""
AMDF Utility Functions
"""

import re
import subprocess
from pathlib import Path
from typing import List, Optional

from ..config import config
from ..exceptions import KubectlError


def to_pascal_case(name: str) -> str:
    """Convert string to PascalCase"""
    return name.replace("_", " ").title().replace(" ", "")


def to_snake_case(name: str) -> str:
    """Convert string to snake_case"""
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()


def run_kubectl_command(args: List[str], context: Optional[str] = None) -> str:
    """Run kubectl command and return output"""
    command = ["kubectl"]
    
    if context:
        command.extend(["--context", context])
    
    command.extend(args)
    
    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout
    except subprocess.CalledProcessError as e:
        raise KubectlError(f"kubectl command failed: {e.stderr}")
    except FileNotFoundError:
        raise KubectlError("kubectl not found. Please install kubectl.")


def run_kcl_command(args: List[str], cwd: Optional[str] = None) -> str:
    """Run KCL command and return output"""
    command = ["kcl"] + args
    
    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=True,
            cwd=cwd
        )
        return result.stdout
    except subprocess.CalledProcessError as e:
        raise KubectlError(f"kcl command failed: {e.stderr}")
    except FileNotFoundError:
        raise KubectlError("kcl not found. Please install KCL.")


def ensure_directory(path: Path) -> None:
    """Ensure directory exists"""
    path.mkdir(parents=True, exist_ok=True)


def init_kcl_module_if_needed(base_dir: str) -> bool:
    """Initialize KCL module if it doesn't exist"""
    library_dir = Path(base_dir) / config.library_dir
    kcl_mod_file = library_dir / "kcl.mod"
    
    if kcl_mod_file.exists():
        return True
    
    ensure_directory(library_dir)
    
    try:
        run_kcl_command(["mod", "init", config.library_dir], cwd=base_dir)
        return True
    except Exception:
        return False
