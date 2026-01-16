# --- High-Level Blueprint (Auto-Generated) ---

import models.opentofu_upbound_io.v1beta1.opentofu_upbound_io_v1beta1_ProviderConfig as providerconfig_schema

schema ProviderconfigBlueprint(providerconfig_schema.Providerconfig):
    """This Blueprint simplifies the creation of a Providerconfig resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _backendFile? : str
    _configuration? : str
    _credentials? : [providerconfig_schema.ProviderconfigspecCredentialsitem]
    _pluginCache? : bool

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        backendFile = _backendFile
        configuration = _configuration
        credentials = _credentials
        pluginCache = _pluginCache
    }
