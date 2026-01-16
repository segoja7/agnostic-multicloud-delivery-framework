# --- High-Level Blueprint (Auto-Generated) ---

import models.kms_aws_upbound_io.v1beta1.kms_aws_upbound_io_v1beta1_Key as key_schema

schema KeyBlueprint(key_schema.Key):
    """This Blueprint simplifies the creation of a Key resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : key_schema.KeyspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : key_schema.KeyspecWriteconnectionsecrettoref
    _bypassPolicyLockoutSafetyCheck? : bool
    _customKeyStoreId? : str
    _customerMasterKeySpec? : str
    _deletionWindowInDays? : float
    _description? : str
    _enableKeyRotation? : bool
    _isEnabled? : bool
    _keyUsage? : str
    _multiRegion? : bool
    _policy? : str
    _region : str
    _rotationPeriodInDays? : float
    _tags? : {str:str}
    _xksKeyId? : str

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
            bypassPolicyLockoutSafetyCheck = _bypassPolicyLockoutSafetyCheck
            customKeyStoreId = _customKeyStoreId
            customerMasterKeySpec = _customerMasterKeySpec
            deletionWindowInDays = _deletionWindowInDays
            description = _description
            enableKeyRotation = _enableKeyRotation
            isEnabled = _isEnabled
            keyUsage = _keyUsage
            multiRegion = _multiRegion
            policy = _policy
            region = _region
            rotationPeriodInDays = _rotationPeriodInDays
            tags = _tags
            xksKeyId = _xksKeyId
        }
        providerConfigRef.name = _providerConfig
    }
