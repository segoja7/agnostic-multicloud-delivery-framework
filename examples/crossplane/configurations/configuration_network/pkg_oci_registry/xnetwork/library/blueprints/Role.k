# --- High-Level Blueprint (Auto-Generated) ---

import models.iam_aws_upbound_io.v1beta1.iam_aws_upbound_io_v1beta1_Role as role_schema

schema RoleBlueprint(role_schema.Role):
    """This Blueprint simplifies the creation of a Role resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : role_schema.RolespecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : role_schema.RolespecWriteconnectionsecrettoref
    _assumeRolePolicy? : str
    _description? : str
    _forceDetachPolicies? : bool
    _inlinePolicy? : [role_schema.RolespecforproviderInlinepolicyitem]
    _managedPolicyArns? : [str]
    _managedPolicyArnsRefs? : [role_schema.RolespecforproviderManagedpolicyarnsrefsitem]
    _managedPolicyArnsSelector? : role_schema.RolespecforproviderManagedpolicyarnsselector
    _maxSessionDuration? : float
    _path? : str
    _permissionsBoundary? : str
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
            assumeRolePolicy = _assumeRolePolicy
            description = _description
            forceDetachPolicies = _forceDetachPolicies
            inlinePolicy = _inlinePolicy
            managedPolicyArns = _managedPolicyArns
            managedPolicyArnsRefs = _managedPolicyArnsRefs
            managedPolicyArnsSelector = _managedPolicyArnsSelector
            maxSessionDuration = _maxSessionDuration
            path = _path
            permissionsBoundary = _permissionsBoundary
            tags = _tags
        }
        providerConfigRef.name = _providerConfig
    }
