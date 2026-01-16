# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_VPCEndpointSecurityGroupAssociation as vpcendpointsecuritygroupassociation_schema

schema VpcendpointsecuritygroupassociationBlueprint(vpcendpointsecuritygroupassociation_schema.Vpcendpointsecuritygroupassociation):
    """This Blueprint simplifies the creation of a Vpcendpointsecuritygroupassociation resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : vpcendpointsecuritygroupassociation_schema.VpcendpointsecuritygroupassociationspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : vpcendpointsecuritygroupassociation_schema.VpcendpointsecuritygroupassociationspecWriteconnectionsecrettoref
    _region : str
    _replaceDefaultAssociation? : bool
    _securityGroupId? : str
    _securityGroupIdRef? : vpcendpointsecuritygroupassociation_schema.VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidref
    _securityGroupIdSelector? : vpcendpointsecuritygroupassociation_schema.VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidselector
    _vpcEndpointId? : str
    _vpcEndpointIdRef? : vpcendpointsecuritygroupassociation_schema.VpcendpointsecuritygroupassociationspecforproviderVpcendpointidref
    _vpcEndpointIdSelector? : vpcendpointsecuritygroupassociation_schema.VpcendpointsecuritygroupassociationspecforproviderVpcendpointidselector

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
            replaceDefaultAssociation = _replaceDefaultAssociation
            securityGroupId = _securityGroupId
            securityGroupIdRef = _securityGroupIdRef
            securityGroupIdSelector = _securityGroupIdSelector
            vpcEndpointId = _vpcEndpointId
            vpcEndpointIdRef = _vpcEndpointIdRef
            vpcEndpointIdSelector = _vpcEndpointIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
