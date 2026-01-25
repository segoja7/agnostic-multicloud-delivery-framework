"""
Agnostic Multi-cloud Delivery Framework (AMDF)
A unified framework for generating KCL schemas from Kubernetes CRDs
"""

try:
    from importlib.metadata import version
    __version__ = version("amdf")
except:
    import tomllib
    from pathlib import Path
    pyproject = Path(__file__).parent.parent.parent / "pyproject.toml"
    with open(pyproject, "rb") as f:
        __version__ = tomllib.load(f)["project"]["version"]

__author__ = "AMDF Team"
__description__ = "Agnostic Multi-cloud Delivery Framework"
