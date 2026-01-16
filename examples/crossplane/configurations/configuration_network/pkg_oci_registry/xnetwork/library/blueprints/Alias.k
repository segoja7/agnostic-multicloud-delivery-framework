# --- High-Level Blueprint (Auto-Generated) ---

import models.kms_aws_upbound_io.v1beta1.kms_aws_upbound_io_v1beta1_Alias as alias_schema

schema AliasBlueprint(alias_schema.Alias):
    """This Blueprint simplifies the creation of a Alias resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : alias_schema.AliasspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : alias_schema.AliasspecWriteconnectionsecrettoref
    _region : str
    _targetKeyId? : str
    _targetKeyIdRef? : alias_schema.AliasspecforproviderTargetkeyidref
    _targetKeyIdSelector? : alias_schema.AliasspecforproviderTargetkeyidselector

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        deletionPolicy = _deletionPolicy
        initProvider = _initProvider
        managementPolicies = _managementPolicies
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            region = _region
            targetKeyId = _targetKeyId
            targetKeyIdRef = _targetKeyIdRef
            targetKeyIdSelector = _targetKeyIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
