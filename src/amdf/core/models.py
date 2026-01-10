"""
AMDF Data Models
Shared Pydantic models between CLI and MCP interfaces
"""

from typing import List, Optional, Dict, Any
from pathlib import Path
from pydantic import BaseModel, Field


class CRDInfo(BaseModel):
    """Information about a Kubernetes CRD"""
    name: str
    group: str
    version: str
    kind: str
    plural: str
    scope: str


class GenerationRequest(BaseModel):
    """Request for schema generation"""
    crd_name: str
    context: Optional[str] = None
    base_dir: str = "."
    
    
class GenerationResult(BaseModel):
    """Result of schema generation"""
    schema_path: str
    blueprint_path: Optional[str] = None
    content: str
    success: bool = True
    error: Optional[str] = None


class BlueprintRequest(BaseModel):
    """Request for blueprint generation"""
    schema_content: str
    schema_path: Path
    output_dir: Optional[str] = None


class BlueprintResult(BaseModel):
    """Result of blueprint generation"""
    blueprint_path: str
    blueprint_name: str
    main_schema_name: str
    content: str
    success: bool = True
    error: Optional[str] = None


class ScaffoldRequest(BaseModel):
    """Request for project scaffolding"""
    project_type: str = Field(..., description="Type: consumer, publisher")
    registry_url: Optional[str] = None
    package_name: Optional[str] = None
    tag: str = "latest"
    output_dir: str = "."


class ScaffoldResult(BaseModel):
    """Result of project scaffolding"""
    project_path: str
    files_created: List[str]
    success: bool = True
    error: Optional[str] = None


class RegistryOperation(BaseModel):
    """Registry operation request"""
    operation: str = Field(..., description="push, pull, list")
    registry_url: str
    local_path: Optional[str] = None
    tag: str = "latest"
    force: bool = False
