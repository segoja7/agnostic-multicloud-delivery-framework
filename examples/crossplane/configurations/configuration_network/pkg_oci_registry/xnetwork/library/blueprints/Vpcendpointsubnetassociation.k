# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_VPCEndpointSubnetAssociation as vpcendpointsubnetassociation_schema

schema VpcendpointsubnetassociationBlueprint(vpcendpointsubnetassociation_schema.Vpcendpointsubnetassociation):
    """This Blueprint simplifies the creation of a Vpcendpointsubnetassociation resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : vpcendpointsubnetassociation_schema.VpcendpointsubnetassociationspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : vpcendpointsubnetassociation_schema.VpcendpointsubnetassociationspecWriteconnectionsecrettoref
    _region : str
    _subnetId? : str
    _subnetIdRef? : vpcendpointsubnetassociation_schema.VpcendpointsubnetassociationspecforproviderSubnetidref
    _subnetIdSelector? : vpcendpointsubnetassociation_schema.VpcendpointsubnetassociationspecforproviderSubnetidselector
    _vpcEndpointId? : str
    _vpcEndpointIdRef? : vpcendpointsubnetassociation_schema.VpcendpointsubnetassociationspecforproviderVpcendpointidref
    _vpcEndpointIdSelector? : vpcendpointsubnetassociation_schema.VpcendpointsubnetassociationspecforproviderVpcendpointidselector

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
            subnetId = _subnetId
            subnetIdRef = _subnetIdRef
            subnetIdSelector = _subnetIdSelector
            vpcEndpointId = _vpcEndpointId
            vpcEndpointIdRef = _vpcEndpointIdRef
            vpcEndpointIdSelector = _vpcEndpointIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
