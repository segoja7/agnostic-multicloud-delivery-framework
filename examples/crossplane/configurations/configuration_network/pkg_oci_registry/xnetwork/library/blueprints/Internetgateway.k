# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_InternetGateway as internetgateway_schema

schema InternetgatewayBlueprint(internetgateway_schema.Internetgateway):
    """This Blueprint simplifies the creation of a Internetgateway resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : internetgateway_schema.InternetgatewayspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : internetgateway_schema.InternetgatewayspecWriteconnectionsecrettoref
    _region : str
    _tags? : {str:str}
    _vpcId? : str
    _vpcIdRef? : internetgateway_schema.InternetgatewayspecforproviderVpcidref
    _vpcIdSelector? : internetgateway_schema.InternetgatewayspecforproviderVpcidselector

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
            tags = _tags
            vpcId = _vpcId
            vpcIdRef = _vpcIdRef
            vpcIdSelector = _vpcIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
