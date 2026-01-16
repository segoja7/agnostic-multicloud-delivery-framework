# --- High-Level Blueprint (Auto-Generated) ---

import models.iam_aws_upbound_io.v1beta1.iam_aws_upbound_io_v1beta1_RolePolicyAttachment as rolepolicyattachment_schema

schema RolepolicyattachmentBlueprint(rolepolicyattachment_schema.Rolepolicyattachment):
    """This Blueprint simplifies the creation of a Rolepolicyattachment resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : rolepolicyattachment_schema.RolepolicyattachmentspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : rolepolicyattachment_schema.RolepolicyattachmentspecWriteconnectionsecrettoref
    _policyArn? : str
    _policyArnRef? : rolepolicyattachment_schema.RolepolicyattachmentspecforproviderPolicyarnref
    _policyArnSelector? : rolepolicyattachment_schema.RolepolicyattachmentspecforproviderPolicyarnselector
    _role? : str
    _roleRef? : rolepolicyattachment_schema.RolepolicyattachmentspecforproviderRoleref
    _roleSelector? : rolepolicyattachment_schema.RolepolicyattachmentspecforproviderRoleselector

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
            policyArn = _policyArn
            policyArnRef = _policyArnRef
            policyArnSelector = _policyArnSelector
            role = _role
            roleRef = _roleRef
            roleSelector = _roleSelector
        }
        providerConfigRef.name = _providerConfig
    }
