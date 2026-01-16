"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Route:
    """
    Route is the Schema for the Routes API. Provides a resource to create a routing entry in a VPC routing table.

    Attributes
    ----------
    apiVersion : str, optional
        APIVersion defines the versioned schema of this representation of an object.
        Servers should convert recognized schemas to the latest internal value, and
        may reject unrecognized values.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, optional
        Kind is a string value representing the REST resource this object represents.
        Servers may infer this from the endpoint the client submits requests to.
        Cannot be updated.
        In CamelCase.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : any, optional
        No description available.
    spec : RouteSpec, required
        RouteSpec defines the desired state of Route
    status : RouteStatus, optional
        RouteStatus defines the observed state of Route.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "Route"
    metadata? : any
    spec : RouteSpec
    status? : RouteStatus

schema RouteSpec:
    """
    RouteSpec defines the desired state of Route

    Attributes
    ----------
    deletionPolicy : "Orphan" | "Delete", optional
        DeletionPolicy specifies what will happen to the underlying external
        when this managed resource is deleted - either "Delete" or "Orphan" the
        external resource.
        This field is planned to be deprecated in favor of the ManagementPolicies
        field in a future release. Currently, both could be set independently and
        non-default values would be honored if the feature flag is enabled.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
    forProvider : RoutespecForprovider, required
        No description available.
    initProvider : RoutespecInitprovider, optional
        THIS IS A BETA FIELD. It will be honored
        unless the Management Policies feature flag is disabled.
        InitProvider holds the same fields as ForProvider, with the exception
        of Identifier and other resource reference fields. The fields that are
        in InitProvider are merged into ForProvider when the resource is created.
        The same fields are also added to the terraform ignore_changes hook, to
        avoid updating them after creation. This is useful for fields that are
        required on creation, but we do not desire to update them after creation,
        for example because of an external controller is managing them, like an
        autoscaler.
    managementPolicies : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"], optional
        THIS IS A BETA FIELD. It is on by default but can be opted out
        through a Crossplane feature flag.
        ManagementPolicies specify the array of actions Crossplane is allowed to
        take on the managed and external resources.
        This field is planned to replace the DeletionPolicy field in a future
        release. Currently, both could be set independently and non-default
        values would be honored if the feature flag is enabled. If both are
        custom, the DeletionPolicy field will be ignored.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
        and this one: https://github.com/crossplane/crossplane/blob/444267e84783136daa93568b364a5f01228cacbe/design/one-pager-ignore-changes.md
    providerConfigRef : RoutespecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : RoutespecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : RoutespecForprovider
    initProvider? : RoutespecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : RoutespecProviderconfigref
    writeConnectionSecretToRef? : RoutespecWriteconnectionsecrettoref

schema RoutespecForprovider:
    """
    RoutespecForprovider schema.

    Attributes
    ----------
    carrierGatewayId : str, optional
        Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone.
    coreNetworkArn : str, optional
        The Amazon Resource Name (ARN) of a core network.
    destinationCidrBlock : str, optional
        The destination CIDR block.
    destinationIpv6CidrBlock : str, optional
        The destination IPv6 CIDR block.
    destinationPrefixListId : str, optional
        The ID of a managed prefix list destination.
    destinationPrefixListIdRef : RoutespecforproviderDestinationprefixlistidref, optional
        Reference to a ManagedPrefixList in ec2 to populate destinationPrefixListId.
    destinationPrefixListIdSelector : RoutespecforproviderDestinationprefixlistidselector, optional
        Selector for a ManagedPrefixList in ec2 to populate destinationPrefixListId.
    egressOnlyGatewayId : str, optional
        Identifier of a VPC Egress Only Internet Gateway.
    egressOnlyGatewayIdRef : RoutespecforproviderEgressonlygatewayidref, optional
        Reference to a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.
    egressOnlyGatewayIdSelector : RoutespecforproviderEgressonlygatewayidselector, optional
        Selector for a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.
    gatewayId : str, optional
        Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route.
    gatewayIdRef : RoutespecforproviderGatewayidref, optional
        Reference to a InternetGateway to populate gatewayId.
    gatewayIdSelector : RoutespecforproviderGatewayidselector, optional
        Selector for a InternetGateway to populate gatewayId.
    instanceId : str, optional
        Identifier of an EC2 instance.
    instanceIdRef : RoutespecforproviderInstanceidref, optional
        Reference to a Instance to populate instanceId.
    instanceIdSelector : RoutespecforproviderInstanceidselector, optional
        Selector for a Instance to populate instanceId.
    localGatewayId : str, optional
        Identifier of a Outpost local gateway.
    natGatewayId : str, optional
        Identifier of a VPC NAT gateway.
    natGatewayIdRef : RoutespecforproviderNatgatewayidref, optional
        Reference to a NATGateway to populate natGatewayId.
    natGatewayIdSelector : RoutespecforproviderNatgatewayidselector, optional
        Selector for a NATGateway to populate natGatewayId.
    networkInterfaceId : str, optional
        Identifier of an EC2 network interface.
    networkInterfaceIdRef : RoutespecforproviderNetworkinterfaceidref, optional
        Reference to a NetworkInterface to populate networkInterfaceId.
    networkInterfaceIdSelector : RoutespecforproviderNetworkinterfaceidselector, optional
        Selector for a NetworkInterface to populate networkInterfaceId.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    routeTableId : str, optional
        The ID of the routing table.
    routeTableIdRef : RoutespecforproviderRoutetableidref, optional
        Reference to a RouteTable to populate routeTableId.
    routeTableIdSelector : RoutespecforproviderRoutetableidselector, optional
        Selector for a RouteTable to populate routeTableId.
    transitGatewayId : str, optional
        Identifier of an EC2 Transit Gateway.
    transitGatewayIdRef : RoutespecforproviderTransitgatewayidref, optional
        Reference to a TransitGateway to populate transitGatewayId.
    transitGatewayIdSelector : RoutespecforproviderTransitgatewayidselector, optional
        Selector for a TransitGateway to populate transitGatewayId.
    vpcEndpointId : str, optional
        Identifier of a VPC Endpoint.
    vpcEndpointIdRef : RoutespecforproviderVpcendpointidref, optional
        Reference to a VPCEndpoint to populate vpcEndpointId.
    vpcEndpointIdSelector : RoutespecforproviderVpcendpointidselector, optional
        Selector for a VPCEndpoint to populate vpcEndpointId.
    vpcPeeringConnectionId : str, optional
        Identifier of a VPC peering connection.
    vpcPeeringConnectionIdRef : RoutespecforproviderVpcpeeringconnectionidref, optional
        Reference to a VPCPeeringConnection to populate vpcPeeringConnectionId.
    vpcPeeringConnectionIdSelector : RoutespecforproviderVpcpeeringconnectionidselector, optional
        Selector for a VPCPeeringConnection to populate vpcPeeringConnectionId.
    """
    carrierGatewayId? : str
    coreNetworkArn? : str
    destinationCidrBlock? : str
    destinationIpv6CidrBlock? : str
    destinationPrefixListId? : str
    destinationPrefixListIdRef? : RoutespecforproviderDestinationprefixlistidref
    destinationPrefixListIdSelector? : RoutespecforproviderDestinationprefixlistidselector
    egressOnlyGatewayId? : str
    egressOnlyGatewayIdRef? : RoutespecforproviderEgressonlygatewayidref
    egressOnlyGatewayIdSelector? : RoutespecforproviderEgressonlygatewayidselector
    gatewayId? : str
    gatewayIdRef? : RoutespecforproviderGatewayidref
    gatewayIdSelector? : RoutespecforproviderGatewayidselector
    instanceId? : str
    instanceIdRef? : RoutespecforproviderInstanceidref
    instanceIdSelector? : RoutespecforproviderInstanceidselector
    localGatewayId? : str
    natGatewayId? : str
    natGatewayIdRef? : RoutespecforproviderNatgatewayidref
    natGatewayIdSelector? : RoutespecforproviderNatgatewayidselector
    networkInterfaceId? : str
    networkInterfaceIdRef? : RoutespecforproviderNetworkinterfaceidref
    networkInterfaceIdSelector? : RoutespecforproviderNetworkinterfaceidselector
    region : str
    routeTableId? : str
    routeTableIdRef? : RoutespecforproviderRoutetableidref
    routeTableIdSelector? : RoutespecforproviderRoutetableidselector
    transitGatewayId? : str
    transitGatewayIdRef? : RoutespecforproviderTransitgatewayidref
    transitGatewayIdSelector? : RoutespecforproviderTransitgatewayidselector
    vpcEndpointId? : str
    vpcEndpointIdRef? : RoutespecforproviderVpcendpointidref
    vpcEndpointIdSelector? : RoutespecforproviderVpcendpointidselector
    vpcPeeringConnectionId? : str
    vpcPeeringConnectionIdRef? : RoutespecforproviderVpcpeeringconnectionidref
    vpcPeeringConnectionIdSelector? : RoutespecforproviderVpcpeeringconnectionidselector

schema RoutespecforproviderDestinationprefixlistidref:
    """
    Reference to a ManagedPrefixList in ec2 to populate destinationPrefixListId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforproviderdestinationprefixlistidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforproviderdestinationprefixlistidrefPolicy

schema RoutespecforproviderdestinationprefixlistidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderDestinationprefixlistidselector:
    """
    Selector for a ManagedPrefixList in ec2 to populate destinationPrefixListId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforproviderdestinationprefixlistidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforproviderdestinationprefixlistidselectorPolicy

schema RoutespecforproviderdestinationprefixlistidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderEgressonlygatewayidref:
    """
    Reference to a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforprovideregressonlygatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforprovideregressonlygatewayidrefPolicy

schema RoutespecforprovideregressonlygatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderEgressonlygatewayidselector:
    """
    Selector for a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforprovideregressonlygatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforprovideregressonlygatewayidselectorPolicy

schema RoutespecforprovideregressonlygatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderGatewayidref:
    """
    Reference to a InternetGateway to populate gatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforprovidergatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforprovidergatewayidrefPolicy

schema RoutespecforprovidergatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderGatewayidselector:
    """
    Selector for a InternetGateway to populate gatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforprovidergatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforprovidergatewayidselectorPolicy

schema RoutespecforprovidergatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderInstanceidref:
    """
    Reference to a Instance to populate instanceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforproviderinstanceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforproviderinstanceidrefPolicy

schema RoutespecforproviderinstanceidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderInstanceidselector:
    """
    Selector for a Instance to populate instanceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforproviderinstanceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforproviderinstanceidselectorPolicy

schema RoutespecforproviderinstanceidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderNatgatewayidref:
    """
    Reference to a NATGateway to populate natGatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforprovidernatgatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforprovidernatgatewayidrefPolicy

schema RoutespecforprovidernatgatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderNatgatewayidselector:
    """
    Selector for a NATGateway to populate natGatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforprovidernatgatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforprovidernatgatewayidselectorPolicy

schema RoutespecforprovidernatgatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderNetworkinterfaceidref:
    """
    Reference to a NetworkInterface to populate networkInterfaceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforprovidernetworkinterfaceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforprovidernetworkinterfaceidrefPolicy

schema RoutespecforprovidernetworkinterfaceidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderNetworkinterfaceidselector:
    """
    Selector for a NetworkInterface to populate networkInterfaceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforprovidernetworkinterfaceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforprovidernetworkinterfaceidselectorPolicy

schema RoutespecforprovidernetworkinterfaceidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderRoutetableidref:
    """
    Reference to a RouteTable to populate routeTableId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforproviderroutetableidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforproviderroutetableidrefPolicy

schema RoutespecforproviderroutetableidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderRoutetableidselector:
    """
    Selector for a RouteTable to populate routeTableId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforproviderroutetableidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforproviderroutetableidselectorPolicy

schema RoutespecforproviderroutetableidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderTransitgatewayidref:
    """
    Reference to a TransitGateway to populate transitGatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforprovidertransitgatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforprovidertransitgatewayidrefPolicy

schema RoutespecforprovidertransitgatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderTransitgatewayidselector:
    """
    Selector for a TransitGateway to populate transitGatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforprovidertransitgatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforprovidertransitgatewayidselectorPolicy

schema RoutespecforprovidertransitgatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderVpcendpointidref:
    """
    Reference to a VPCEndpoint to populate vpcEndpointId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforprovidervpcendpointidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforprovidervpcendpointidrefPolicy

schema RoutespecforprovidervpcendpointidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderVpcendpointidselector:
    """
    Selector for a VPCEndpoint to populate vpcEndpointId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforprovidervpcendpointidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforprovidervpcendpointidselectorPolicy

schema RoutespecforprovidervpcendpointidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderVpcpeeringconnectionidref:
    """
    Reference to a VPCPeeringConnection to populate vpcPeeringConnectionId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecforprovidervpcpeeringconnectionidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecforprovidervpcpeeringconnectionidrefPolicy

schema RoutespecforprovidervpcpeeringconnectionidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecforproviderVpcpeeringconnectionidselector:
    """
    Selector for a VPCPeeringConnection to populate vpcPeeringConnectionId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecforprovidervpcpeeringconnectionidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecforprovidervpcpeeringconnectionidselectorPolicy

schema RoutespecforprovidervpcpeeringconnectionidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecInitprovider:
    """
    THIS IS A BETA FIELD. It will be honored
    unless the Management Policies feature flag is disabled.
    InitProvider holds the same fields as ForProvider, with the exception
    of Identifier and other resource reference fields. The fields that are
    in InitProvider are merged into ForProvider when the resource is created.
    The same fields are also added to the terraform ignore_changes hook, to
    avoid updating them after creation. This is useful for fields that are
    required on creation, but we do not desire to update them after creation,
    for example because of an external controller is managing them, like an
    autoscaler.

    Attributes
    ----------
    carrierGatewayId : str, optional
        Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone.
    coreNetworkArn : str, optional
        The Amazon Resource Name (ARN) of a core network.
    destinationCidrBlock : str, optional
        The destination CIDR block.
    destinationIpv6CidrBlock : str, optional
        The destination IPv6 CIDR block.
    destinationPrefixListId : str, optional
        The ID of a managed prefix list destination.
    destinationPrefixListIdRef : RoutespecinitproviderDestinationprefixlistidref, optional
        Reference to a ManagedPrefixList in ec2 to populate destinationPrefixListId.
    destinationPrefixListIdSelector : RoutespecinitproviderDestinationprefixlistidselector, optional
        Selector for a ManagedPrefixList in ec2 to populate destinationPrefixListId.
    egressOnlyGatewayId : str, optional
        Identifier of a VPC Egress Only Internet Gateway.
    egressOnlyGatewayIdRef : RoutespecinitproviderEgressonlygatewayidref, optional
        Reference to a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.
    egressOnlyGatewayIdSelector : RoutespecinitproviderEgressonlygatewayidselector, optional
        Selector for a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.
    gatewayId : str, optional
        Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route.
    gatewayIdRef : RoutespecinitproviderGatewayidref, optional
        Reference to a InternetGateway to populate gatewayId.
    gatewayIdSelector : RoutespecinitproviderGatewayidselector, optional
        Selector for a InternetGateway to populate gatewayId.
    instanceId : str, optional
        Identifier of an EC2 instance.
    instanceIdRef : RoutespecinitproviderInstanceidref, optional
        Reference to a Instance to populate instanceId.
    instanceIdSelector : RoutespecinitproviderInstanceidselector, optional
        Selector for a Instance to populate instanceId.
    localGatewayId : str, optional
        Identifier of a Outpost local gateway.
    natGatewayId : str, optional
        Identifier of a VPC NAT gateway.
    natGatewayIdRef : RoutespecinitproviderNatgatewayidref, optional
        Reference to a NATGateway to populate natGatewayId.
    natGatewayIdSelector : RoutespecinitproviderNatgatewayidselector, optional
        Selector for a NATGateway to populate natGatewayId.
    networkInterfaceId : str, optional
        Identifier of an EC2 network interface.
    networkInterfaceIdRef : RoutespecinitproviderNetworkinterfaceidref, optional
        Reference to a NetworkInterface to populate networkInterfaceId.
    networkInterfaceIdSelector : RoutespecinitproviderNetworkinterfaceidselector, optional
        Selector for a NetworkInterface to populate networkInterfaceId.
    routeTableId : str, optional
        The ID of the routing table.
    routeTableIdRef : RoutespecinitproviderRoutetableidref, optional
        Reference to a RouteTable to populate routeTableId.
    routeTableIdSelector : RoutespecinitproviderRoutetableidselector, optional
        Selector for a RouteTable to populate routeTableId.
    transitGatewayId : str, optional
        Identifier of an EC2 Transit Gateway.
    transitGatewayIdRef : RoutespecinitproviderTransitgatewayidref, optional
        Reference to a TransitGateway to populate transitGatewayId.
    transitGatewayIdSelector : RoutespecinitproviderTransitgatewayidselector, optional
        Selector for a TransitGateway to populate transitGatewayId.
    vpcEndpointId : str, optional
        Identifier of a VPC Endpoint.
    vpcEndpointIdRef : RoutespecinitproviderVpcendpointidref, optional
        Reference to a VPCEndpoint to populate vpcEndpointId.
    vpcEndpointIdSelector : RoutespecinitproviderVpcendpointidselector, optional
        Selector for a VPCEndpoint to populate vpcEndpointId.
    vpcPeeringConnectionId : str, optional
        Identifier of a VPC peering connection.
    vpcPeeringConnectionIdRef : RoutespecinitproviderVpcpeeringconnectionidref, optional
        Reference to a VPCPeeringConnection to populate vpcPeeringConnectionId.
    vpcPeeringConnectionIdSelector : RoutespecinitproviderVpcpeeringconnectionidselector, optional
        Selector for a VPCPeeringConnection to populate vpcPeeringConnectionId.
    """
    carrierGatewayId? : str
    coreNetworkArn? : str
    destinationCidrBlock? : str
    destinationIpv6CidrBlock? : str
    destinationPrefixListId? : str
    destinationPrefixListIdRef? : RoutespecinitproviderDestinationprefixlistidref
    destinationPrefixListIdSelector? : RoutespecinitproviderDestinationprefixlistidselector
    egressOnlyGatewayId? : str
    egressOnlyGatewayIdRef? : RoutespecinitproviderEgressonlygatewayidref
    egressOnlyGatewayIdSelector? : RoutespecinitproviderEgressonlygatewayidselector
    gatewayId? : str
    gatewayIdRef? : RoutespecinitproviderGatewayidref
    gatewayIdSelector? : RoutespecinitproviderGatewayidselector
    instanceId? : str
    instanceIdRef? : RoutespecinitproviderInstanceidref
    instanceIdSelector? : RoutespecinitproviderInstanceidselector
    localGatewayId? : str
    natGatewayId? : str
    natGatewayIdRef? : RoutespecinitproviderNatgatewayidref
    natGatewayIdSelector? : RoutespecinitproviderNatgatewayidselector
    networkInterfaceId? : str
    networkInterfaceIdRef? : RoutespecinitproviderNetworkinterfaceidref
    networkInterfaceIdSelector? : RoutespecinitproviderNetworkinterfaceidselector
    routeTableId? : str
    routeTableIdRef? : RoutespecinitproviderRoutetableidref
    routeTableIdSelector? : RoutespecinitproviderRoutetableidselector
    transitGatewayId? : str
    transitGatewayIdRef? : RoutespecinitproviderTransitgatewayidref
    transitGatewayIdSelector? : RoutespecinitproviderTransitgatewayidselector
    vpcEndpointId? : str
    vpcEndpointIdRef? : RoutespecinitproviderVpcendpointidref
    vpcEndpointIdSelector? : RoutespecinitproviderVpcendpointidselector
    vpcPeeringConnectionId? : str
    vpcPeeringConnectionIdRef? : RoutespecinitproviderVpcpeeringconnectionidref
    vpcPeeringConnectionIdSelector? : RoutespecinitproviderVpcpeeringconnectionidselector

schema RoutespecinitproviderDestinationprefixlistidref:
    """
    Reference to a ManagedPrefixList in ec2 to populate destinationPrefixListId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitproviderdestinationprefixlistidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitproviderdestinationprefixlistidrefPolicy

schema RoutespecinitproviderdestinationprefixlistidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderDestinationprefixlistidselector:
    """
    Selector for a ManagedPrefixList in ec2 to populate destinationPrefixListId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitproviderdestinationprefixlistidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitproviderdestinationprefixlistidselectorPolicy

schema RoutespecinitproviderdestinationprefixlistidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderEgressonlygatewayidref:
    """
    Reference to a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitprovideregressonlygatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitprovideregressonlygatewayidrefPolicy

schema RoutespecinitprovideregressonlygatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderEgressonlygatewayidselector:
    """
    Selector for a EgressOnlyInternetGateway in ec2 to populate egressOnlyGatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitprovideregressonlygatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitprovideregressonlygatewayidselectorPolicy

schema RoutespecinitprovideregressonlygatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderGatewayidref:
    """
    Reference to a InternetGateway to populate gatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitprovidergatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitprovidergatewayidrefPolicy

schema RoutespecinitprovidergatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderGatewayidselector:
    """
    Selector for a InternetGateway to populate gatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitprovidergatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitprovidergatewayidselectorPolicy

schema RoutespecinitprovidergatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderInstanceidref:
    """
    Reference to a Instance to populate instanceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitproviderinstanceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitproviderinstanceidrefPolicy

schema RoutespecinitproviderinstanceidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderInstanceidselector:
    """
    Selector for a Instance to populate instanceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitproviderinstanceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitproviderinstanceidselectorPolicy

schema RoutespecinitproviderinstanceidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderNatgatewayidref:
    """
    Reference to a NATGateway to populate natGatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitprovidernatgatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitprovidernatgatewayidrefPolicy

schema RoutespecinitprovidernatgatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderNatgatewayidselector:
    """
    Selector for a NATGateway to populate natGatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitprovidernatgatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitprovidernatgatewayidselectorPolicy

schema RoutespecinitprovidernatgatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderNetworkinterfaceidref:
    """
    Reference to a NetworkInterface to populate networkInterfaceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitprovidernetworkinterfaceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitprovidernetworkinterfaceidrefPolicy

schema RoutespecinitprovidernetworkinterfaceidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderNetworkinterfaceidselector:
    """
    Selector for a NetworkInterface to populate networkInterfaceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitprovidernetworkinterfaceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitprovidernetworkinterfaceidselectorPolicy

schema RoutespecinitprovidernetworkinterfaceidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderRoutetableidref:
    """
    Reference to a RouteTable to populate routeTableId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitproviderroutetableidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitproviderroutetableidrefPolicy

schema RoutespecinitproviderroutetableidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderRoutetableidselector:
    """
    Selector for a RouteTable to populate routeTableId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitproviderroutetableidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitproviderroutetableidselectorPolicy

schema RoutespecinitproviderroutetableidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderTransitgatewayidref:
    """
    Reference to a TransitGateway to populate transitGatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitprovidertransitgatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitprovidertransitgatewayidrefPolicy

schema RoutespecinitprovidertransitgatewayidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderTransitgatewayidselector:
    """
    Selector for a TransitGateway to populate transitGatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitprovidertransitgatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitprovidertransitgatewayidselectorPolicy

schema RoutespecinitprovidertransitgatewayidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderVpcendpointidref:
    """
    Reference to a VPCEndpoint to populate vpcEndpointId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitprovidervpcendpointidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitprovidervpcendpointidrefPolicy

schema RoutespecinitprovidervpcendpointidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderVpcendpointidselector:
    """
    Selector for a VPCEndpoint to populate vpcEndpointId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitprovidervpcendpointidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitprovidervpcendpointidselectorPolicy

schema RoutespecinitprovidervpcendpointidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderVpcpeeringconnectionidref:
    """
    Reference to a VPCPeeringConnection to populate vpcPeeringConnectionId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecinitprovidervpcpeeringconnectionidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecinitprovidervpcpeeringconnectionidrefPolicy

schema RoutespecinitprovidervpcpeeringconnectionidrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecinitproviderVpcpeeringconnectionidselector:
    """
    Selector for a VPCPeeringConnection to populate vpcPeeringConnectionId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutespecinitprovidervpcpeeringconnectionidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutespecinitprovidervpcpeeringconnectionidselectorPolicy

schema RoutespecinitprovidervpcpeeringconnectionidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutespecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutespecproviderconfigrefPolicy

schema RoutespecproviderconfigrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RoutespecWriteconnectionsecrettoref:
    """
    WriteConnectionSecretToReference specifies the namespace and name of a
    Secret to which any connection details for this managed resource should
    be written. Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    name : str
    namespace : str

schema RouteStatus:
    """
    RouteStatus defines the observed state of Route.

    Attributes
    ----------
    atProvider : RoutestatusAtprovider, optional
        No description available.
    conditions : [RoutestatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : RoutestatusAtprovider
    conditions? : [RoutestatusConditionsitem]
    observedGeneration? : int

schema RoutestatusAtprovider:
    """
    RoutestatusAtprovider schema.

    Attributes
    ----------
    carrierGatewayId : str, optional
        Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone.
    coreNetworkArn : str, optional
        The Amazon Resource Name (ARN) of a core network.
    destinationCidrBlock : str, optional
        The destination CIDR block.
    destinationIpv6CidrBlock : str, optional
        The destination IPv6 CIDR block.
    destinationPrefixListId : str, optional
        The ID of a managed prefix list destination.
    egressOnlyGatewayId : str, optional
        Identifier of a VPC Egress Only Internet Gateway.
    gatewayId : str, optional
        Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route.
    id : str, optional
        Route identifier computed from the routing table identifier and route destination.
    instanceId : str, optional
        Identifier of an EC2 instance.
    instanceOwnerId : str, optional
        The AWS account ID of the owner of the EC2 instance.
    localGatewayId : str, optional
        Identifier of a Outpost local gateway.
    natGatewayId : str, optional
        Identifier of a VPC NAT gateway.
    networkInterfaceId : str, optional
        Identifier of an EC2 network interface.
    origin : str, optional
        How the route was created - CreateRouteTable, CreateRoute or EnableVgwRoutePropagation.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    routeTableId : str, optional
        The ID of the routing table.
    state : str, optional
        The state of the route - active or blackhole.
    transitGatewayId : str, optional
        Identifier of an EC2 Transit Gateway.
    vpcEndpointId : str, optional
        Identifier of a VPC Endpoint.
    vpcPeeringConnectionId : str, optional
        Identifier of a VPC peering connection.
    """
    carrierGatewayId? : str
    coreNetworkArn? : str
    destinationCidrBlock? : str
    destinationIpv6CidrBlock? : str
    destinationPrefixListId? : str
    egressOnlyGatewayId? : str
    gatewayId? : str
    id? : str
    instanceId? : str
    instanceOwnerId? : str
    localGatewayId? : str
    natGatewayId? : str
    networkInterfaceId? : str
    origin? : str
    region? : str
    routeTableId? : str
    state? : str
    transitGatewayId? : str
    vpcEndpointId? : str
    vpcPeeringConnectionId? : str

schema RoutestatusConditionsitem:
    """
    A Condition that may apply to a resource.

    Attributes
    ----------
    lastTransitionTime : str, required
        LastTransitionTime is the last time this condition transitioned from one
        status to another.
    message : str, optional
        A Message containing details about this condition's last transition from
        one status to another, if any.
    observedGeneration : int, optional
        ObservedGeneration represents the .metadata.generation that the condition was set based upon.
        For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
        with respect to the current state of the instance.
    reason : str, required
        A Reason for this condition's last transition from one status to another.
    status : str, required
        Status of this condition; is it currently True, False, or Unknown?
    type : str, required
        Type of this condition. At most one of each condition type may apply to
        a resource at any point in time.
    """
    lastTransitionTime : str
    message? : str
    observedGeneration? : int
    reason : str
    status : str
    type : str