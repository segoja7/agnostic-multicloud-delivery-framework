# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_Route as route_schema

schema RouteBlueprint(route_schema.Route):
    """This Blueprint simplifies the creation of a Route resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : route_schema.RoutespecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : route_schema.RoutespecWriteconnectionsecrettoref
    _carrierGatewayId? : str
    _coreNetworkArn? : str
    _destinationCidrBlock? : str
    _destinationIpv6CidrBlock? : str
    _destinationPrefixListId? : str
    _destinationPrefixListIdRef? : route_schema.RoutespecforproviderDestinationprefixlistidref
    _destinationPrefixListIdSelector? : route_schema.RoutespecforproviderDestinationprefixlistidselector
    _egressOnlyGatewayId? : str
    _egressOnlyGatewayIdRef? : route_schema.RoutespecforproviderEgressonlygatewayidref
    _egressOnlyGatewayIdSelector? : route_schema.RoutespecforproviderEgressonlygatewayidselector
    _gatewayId? : str
    _gatewayIdRef? : route_schema.RoutespecforproviderGatewayidref
    _gatewayIdSelector? : route_schema.RoutespecforproviderGatewayidselector
    _instanceId? : str
    _instanceIdRef? : route_schema.RoutespecforproviderInstanceidref
    _instanceIdSelector? : route_schema.RoutespecforproviderInstanceidselector
    _localGatewayId? : str
    _natGatewayId? : str
    _natGatewayIdRef? : route_schema.RoutespecforproviderNatgatewayidref
    _natGatewayIdSelector? : route_schema.RoutespecforproviderNatgatewayidselector
    _networkInterfaceId? : str
    _networkInterfaceIdRef? : route_schema.RoutespecforproviderNetworkinterfaceidref
    _networkInterfaceIdSelector? : route_schema.RoutespecforproviderNetworkinterfaceidselector
    _region : str
    _routeTableId? : str
    _routeTableIdRef? : route_schema.RoutespecforproviderRoutetableidref
    _routeTableIdSelector? : route_schema.RoutespecforproviderRoutetableidselector
    _transitGatewayId? : str
    _transitGatewayIdRef? : route_schema.RoutespecforproviderTransitgatewayidref
    _transitGatewayIdSelector? : route_schema.RoutespecforproviderTransitgatewayidselector
    _vpcEndpointId? : str
    _vpcEndpointIdRef? : route_schema.RoutespecforproviderVpcendpointidref
    _vpcEndpointIdSelector? : route_schema.RoutespecforproviderVpcendpointidselector
    _vpcPeeringConnectionId? : str
    _vpcPeeringConnectionIdRef? : route_schema.RoutespecforproviderVpcpeeringconnectionidref
    _vpcPeeringConnectionIdSelector? : route_schema.RoutespecforproviderVpcpeeringconnectionidselector

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
            carrierGatewayId = _carrierGatewayId
            coreNetworkArn = _coreNetworkArn
            destinationCidrBlock = _destinationCidrBlock
            destinationIpv6CidrBlock = _destinationIpv6CidrBlock
            destinationPrefixListId = _destinationPrefixListId
            destinationPrefixListIdRef = _destinationPrefixListIdRef
            destinationPrefixListIdSelector = _destinationPrefixListIdSelector
            egressOnlyGatewayId = _egressOnlyGatewayId
            egressOnlyGatewayIdRef = _egressOnlyGatewayIdRef
            egressOnlyGatewayIdSelector = _egressOnlyGatewayIdSelector
            gatewayId = _gatewayId
            gatewayIdRef = _gatewayIdRef
            gatewayIdSelector = _gatewayIdSelector
            instanceId = _instanceId
            instanceIdRef = _instanceIdRef
            instanceIdSelector = _instanceIdSelector
            localGatewayId = _localGatewayId
            natGatewayId = _natGatewayId
            natGatewayIdRef = _natGatewayIdRef
            natGatewayIdSelector = _natGatewayIdSelector
            networkInterfaceId = _networkInterfaceId
            networkInterfaceIdRef = _networkInterfaceIdRef
            networkInterfaceIdSelector = _networkInterfaceIdSelector
            region = _region
            routeTableId = _routeTableId
            routeTableIdRef = _routeTableIdRef
            routeTableIdSelector = _routeTableIdSelector
            transitGatewayId = _transitGatewayId
            transitGatewayIdRef = _transitGatewayIdRef
            transitGatewayIdSelector = _transitGatewayIdSelector
            vpcEndpointId = _vpcEndpointId
            vpcEndpointIdRef = _vpcEndpointIdRef
            vpcEndpointIdSelector = _vpcEndpointIdSelector
            vpcPeeringConnectionId = _vpcPeeringConnectionId
            vpcPeeringConnectionIdRef = _vpcPeeringConnectionIdRef
            vpcPeeringConnectionIdSelector = _vpcPeeringConnectionIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
