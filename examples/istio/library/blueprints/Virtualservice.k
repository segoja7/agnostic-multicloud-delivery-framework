# --- High-Level Blueprint (Auto-Generated) ---

import models.networking_istio_io.v1.networking_istio_io_v1_VirtualService as virtualservice_schema

schema VirtualserviceBlueprint(virtualservice_schema.Virtualservice):
    """This Blueprint simplifies the creation of a Virtualservice resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _exportTo? : [str]
    _gateways? : [str]
    _hosts? : [str]
    _http? : [virtualservice_schema.VirtualservicespecHttpitem]
    _tcp? : [virtualservice_schema.VirtualservicespecTcpitem]
    _tls? : [virtualservice_schema.VirtualservicespecTlsitem]

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        exportTo = _exportTo
        gateways = _gateways
        hosts = _hosts
        http = _http
        tcp = _tcp
        tls = _tls
    }
