# --- High-Level Blueprint (Auto-Generated) ---

import models.cloudwatchlogs_aws_upbound_io.v1beta1.cloudwatchlogs_aws_upbound_io_v1beta1_Group as group_schema

schema GroupBlueprint(group_schema.Group):
    """This Blueprint simplifies the creation of a Group resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : group_schema.GroupspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : group_schema.GroupspecWriteconnectionsecrettoref
    _kmsKeyId? : str
    _kmsKeyIdRef? : group_schema.GroupspecforproviderKmskeyidref
    _kmsKeyIdSelector? : group_schema.GroupspecforproviderKmskeyidselector
    _logGroupClass? : str
    _region : str
    _retentionInDays? : float
    _skipDestroy? : bool
    _tags? : {str:str}

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
            kmsKeyId = _kmsKeyId
            kmsKeyIdRef = _kmsKeyIdRef
            kmsKeyIdSelector = _kmsKeyIdSelector
            logGroupClass = _logGroupClass
            region = _region
            retentionInDays = _retentionInDays
            skipDestroy = _skipDestroy
            tags = _tags
        }
        providerConfigRef.name = _providerConfig
    }
