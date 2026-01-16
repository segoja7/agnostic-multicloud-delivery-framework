# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_RouteTableAssociation as routetableassociation_schema

schema RoutetableassociationBlueprint(routetableassociation_schema.Routetableassociation):
    """This Blueprint simplifies the creation of a Routetableassociation resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : routetableassociation_schema.RoutetableassociationspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : routetableassociation_schema.RoutetableassociationspecWriteconnectionsecrettoref
    _gatewayId? : str
    _gatewayIdRef? : routetableassociation_schema.RoutetableassociationspecforproviderGatewayidref
    _gatewayIdSelector? : routetableassociation_schema.RoutetableassociationspecforproviderGatewayidselector
    _region : str
    _routeTableId? : str
    _routeTableIdRef? : routetableassociation_schema.RoutetableassociationspecforproviderRoutetableidref
    _routeTableIdSelector? : routetableassociation_schema.RoutetableassociationspecforproviderRoutetableidselector
    _subnetId? : str
    _subnetIdRef? : routetableassociation_schema.RoutetableassociationspecforproviderSubnetidref
    _subnetIdSelector? : routetableassociation_schema.RoutetableassociationspecforproviderSubnetidselector

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
            gatewayId = _gatewayId
            gatewayIdRef = _gatewayIdRef
            gatewayIdSelector = _gatewayIdSelector
            region = _region
            routeTableId = _routeTableId
            routeTableIdRef = _routeTableIdRef
            routeTableIdSelector = _routeTableIdSelector
            subnetId = _subnetId
            subnetIdRef = _subnetIdRef
            subnetIdSelector = _subnetIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
