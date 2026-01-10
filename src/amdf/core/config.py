"""
AMDF Configuration Management
"""

from pathlib import Path
from typing import Optional
from pydantic_settings import BaseSettings


class AMDFConfig(BaseSettings):
    """Configuration for AMDF operations"""
    
    # Directory structure
    library_dir: str = "library"
    models_dir: str = "models"
    blueprints_dir: str = "blueprints"
    
    # Kubernetes
    kubectl_context: Optional[str] = None
    
    # KCL
    kcl_indent: str = "    "
    
    # Output
    verbose: bool = False
    
    class Config:
        env_prefix = "AMDF_"
        case_sensitive = False


# Global config instance
config = AMDFConfig()
