# --- High-Level Blueprint (Auto-Generated) ---

import models.networking_istio_io.v1.networking_istio_io_v1_Gateway as gateway_schema

schema GatewayBlueprint(gateway_schema.Gateway):
    """This Blueprint simplifies the creation of a Gateway resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _selector? : {str:str}
    _servers? : [gateway_schema.GatewayspecServersitem]

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        selector = _selector
        servers = _servers
    }
