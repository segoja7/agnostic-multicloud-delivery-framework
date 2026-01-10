"""
AMDF Custom Exceptions
"""


class AMDFError(Exception):
    """Base exception for AMDF operations"""
    pass


class CRDNotFoundError(AMDFError):
    """Raised when a CRD is not found in the cluster"""
    pass


class KubectlError(AMDFError):
    """Raised when kubectl operations fail"""
    pass


class KCLGenerationError(AMDFError):
    """Raised when KCL schema generation fails"""
    pass


class BlueprintGenerationError(AMDFError):
    """Raised when blueprint generation fails"""
    pass


class RegistryError(AMDFError):
    """Raised when OCI registry operations fail"""
    pass


class ValidationError(AMDFError):
    """Raised when validation fails"""
    pass
