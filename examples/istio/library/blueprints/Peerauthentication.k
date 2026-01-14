# --- High-Level Blueprint (Auto-Generated) ---

import models.security_istio_io.v1.security_istio_io_v1_PeerAuthentication as peerauthentication_schema

schema PeerauthenticationBlueprint(peerauthentication_schema.Peerauthentication):
    """This Blueprint simplifies the creation of a Peerauthentication resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _mtls? : peerauthentication_schema.PeerauthenticationspecMtls
    _portLevelMtls? : {str:peerauthentication_schema.PeerauthenticationspecPortlevelmtlsvalue}
    _selector? : peerauthentication_schema.PeerauthenticationspecSelector

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        mtls = _mtls
        portLevelMtls = _portLevelMtls
        selector = _selector
    }
