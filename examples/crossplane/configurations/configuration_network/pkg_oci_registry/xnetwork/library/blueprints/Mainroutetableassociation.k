# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_MainRouteTableAssociation as mainroutetableassociation_schema

schema MainroutetableassociationBlueprint(mainroutetableassociation_schema.Mainroutetableassociation):
    """This Blueprint simplifies the creation of a Mainroutetableassociation resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : mainroutetableassociation_schema.MainroutetableassociationspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : mainroutetableassociation_schema.MainroutetableassociationspecWriteconnectionsecrettoref
    _region : str
    _routeTableId? : str
    _routeTableIdRef? : mainroutetableassociation_schema.MainroutetableassociationspecforproviderRoutetableidref
    _routeTableIdSelector? : mainroutetableassociation_schema.MainroutetableassociationspecforproviderRoutetableidselector
    _vpcId? : str
    _vpcIdRef? : mainroutetableassociation_schema.MainroutetableassociationspecforproviderVpcidref
    _vpcIdSelector? : mainroutetableassociation_schema.MainroutetableassociationspecforproviderVpcidselector

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
            routeTableId = _routeTableId
            routeTableIdRef = _routeTableIdRef
            routeTableIdSelector = _routeTableIdSelector
            vpcId = _vpcId
            vpcIdRef = _vpcIdRef
            vpcIdSelector = _vpcIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
