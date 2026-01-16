"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Vpcendpoint:
    """
    VPCEndpoint is the Schema for the VPCEndpoints API. Provides a VPC Endpoint resource.

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
    spec : VpcendpointSpec, required
        VPCEndpointSpec defines the desired state of VPCEndpoint
    status : VpcendpointStatus, optional
        VPCEndpointStatus defines the observed state of VPCEndpoint.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "VPCEndpoint"
    metadata? : any
    spec : VpcendpointSpec
    status? : VpcendpointStatus

schema VpcendpointSpec:
    """
    VPCEndpointSpec defines the desired state of VPCEndpoint

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
    forProvider : VpcendpointspecForprovider, required
        No description available.
    initProvider : VpcendpointspecInitprovider, optional
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
    providerConfigRef : VpcendpointspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : VpcendpointspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : VpcendpointspecForprovider
    initProvider? : VpcendpointspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : VpcendpointspecProviderconfigref
    writeConnectionSecretToRef? : VpcendpointspecWriteconnectionsecrettoref

schema VpcendpointspecForprovider:
    """
    VpcendpointspecForprovider schema.

    Attributes
    ----------
    autoAccept : bool, optional
        Accept the VPC endpoint (the VPC endpoint and service need to be in the same AWS account).
    dnsOptions : [VpcendpointspecforproviderDnsoptionsitem], optional
        The DNS options for the endpoint. See dns_options below.
    ipAddressType : str, optional
        The IP address type for the endpoint. Valid values are ipv4, dualstack, and ipv6.
    policy : str, optional
        A policy to attach to the endpoint that controls access to the service. This is a JSON formatted string. Defaults to full access. All Gateway and some Interface endpoints support policies - see the relevant AWS documentation for more details.
    privateDnsEnabled : bool, optional
        Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface. Most users will want this enabled to allow services within the VPC to automatically use the endpoint.
        Defaults to false.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    resourceConfigurationArn : str, optional
        The ARN of a Resource Configuration to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceName : str, optional
        The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> (the SageMaker AI Notebook service is an exception to this rule, the service name is in the form aws.sagemaker.<region>.notebook). Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceNameRef : VpcendpointspecforproviderServicenameref, optional
        Reference to a VPCEndpointService in ec2 to populate serviceName.
    serviceNameSelector : VpcendpointspecforproviderServicenameselector, optional
        Selector for a VPCEndpointService in ec2 to populate serviceName.
    serviceNetworkArn : str, optional
        The ARN of a Service Network to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceRegion : str, optional
        - The AWS region of the VPC Endpoint Service. If specified, the VPC endpoint will connect to the service in the provided region. Applicable for endpoints of type Interface.
    subnetConfiguration : [VpcendpointspecforproviderSubnetconfigurationitem], optional
        Subnet configuration for the endpoint, used to select specific IPv4 and/or IPv6 addresses to the endpoint. See subnet_configuration below.
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcEndpointType : str, optional
        The VPC endpoint type, Gateway, GatewayLoadBalancer,Interface, Resource or ServiceNetwork. Defaults to Gateway.
    vpcId : str, optional
        The ID of the VPC in which the endpoint will be used.
    vpcIdRef : VpcendpointspecforproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : VpcendpointspecforproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    autoAccept? : bool
    dnsOptions? : [VpcendpointspecforproviderDnsoptionsitem]
    ipAddressType? : str
    policy? : str
    privateDnsEnabled? : bool
    region : str
    resourceConfigurationArn? : str
    serviceName? : str
    serviceNameRef? : VpcendpointspecforproviderServicenameref
    serviceNameSelector? : VpcendpointspecforproviderServicenameselector
    serviceNetworkArn? : str
    serviceRegion? : str
    subnetConfiguration? : [VpcendpointspecforproviderSubnetconfigurationitem]
    tags? : {str:str}
    vpcEndpointType? : str
    vpcId? : str
    vpcIdRef? : VpcendpointspecforproviderVpcidref
    vpcIdSelector? : VpcendpointspecforproviderVpcidselector

schema VpcendpointspecforproviderDnsoptionsitem:
    """
    VpcendpointspecforproviderDnsoptionsitem schema.

    Attributes
    ----------
    dnsRecordIpType : str, optional
        The DNS records created for the endpoint. Valid values are ipv4, dualstack, service-defined, and ipv6.
    privateDnsOnlyForInboundResolverEndpoint : bool, optional
        Indicates whether to enable private DNS only for inbound endpoints. This option is available only for services that support both gateway and interface endpoints. It routes traffic that originates from the VPC to the gateway endpoint and traffic that originates from on-premises to the interface endpoint. Default is false. Can only be specified if private_dns_enabled is true.
    """
    dnsRecordIpType? : str
    privateDnsOnlyForInboundResolverEndpoint? : bool

schema VpcendpointspecforproviderServicenameref:
    """
    Reference to a VPCEndpointService in ec2 to populate serviceName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointspecforproviderservicenamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointspecforproviderservicenamerefPolicy

schema VpcendpointspecforproviderservicenamerefPolicy:
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

schema VpcendpointspecforproviderServicenameselector:
    """
    Selector for a VPCEndpointService in ec2 to populate serviceName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointspecforproviderservicenameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointspecforproviderservicenameselectorPolicy

schema VpcendpointspecforproviderservicenameselectorPolicy:
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

schema VpcendpointspecforproviderSubnetconfigurationitem:
    """
    VpcendpointspecforproviderSubnetconfigurationitem schema.

    Attributes
    ----------
    ipv4 : str, optional
        The IPv4 address to assign to the endpoint network interface in the subnet. You must provide an IPv4 address if the VPC endpoint supports IPv4.
    ipv6 : str, optional
        The IPv6 address to assign to the endpoint network interface in the subnet. You must provide an IPv6 address if the VPC endpoint supports IPv6.
    subnetId : str, optional
        The ID of the subnet. Must have a corresponding subnet in the subnet_ids argument.
    subnetIdRef : VpcendpointspecforprovidersubnetconfigurationitemSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : VpcendpointspecforprovidersubnetconfigurationitemSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    """
    ipv4? : str
    ipv6? : str
    subnetId? : str
    subnetIdRef? : VpcendpointspecforprovidersubnetconfigurationitemSubnetidref
    subnetIdSelector? : VpcendpointspecforprovidersubnetconfigurationitemSubnetidselector

schema VpcendpointspecforprovidersubnetconfigurationitemSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointspecforprovidersubnetconfigurationitemsubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointspecforprovidersubnetconfigurationitemsubnetidrefPolicy

schema VpcendpointspecforprovidersubnetconfigurationitemsubnetidrefPolicy:
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

schema VpcendpointspecforprovidersubnetconfigurationitemSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointspecforprovidersubnetconfigurationitemsubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointspecforprovidersubnetconfigurationitemsubnetidselectorPolicy

schema VpcendpointspecforprovidersubnetconfigurationitemsubnetidselectorPolicy:
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

schema VpcendpointspecforproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointspecforprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointspecforprovidervpcidrefPolicy

schema VpcendpointspecforprovidervpcidrefPolicy:
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

schema VpcendpointspecforproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointspecforprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointspecforprovidervpcidselectorPolicy

schema VpcendpointspecforprovidervpcidselectorPolicy:
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

schema VpcendpointspecInitprovider:
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
    autoAccept : bool, optional
        Accept the VPC endpoint (the VPC endpoint and service need to be in the same AWS account).
    dnsOptions : [VpcendpointspecinitproviderDnsoptionsitem], optional
        The DNS options for the endpoint. See dns_options below.
    ipAddressType : str, optional
        The IP address type for the endpoint. Valid values are ipv4, dualstack, and ipv6.
    policy : str, optional
        A policy to attach to the endpoint that controls access to the service. This is a JSON formatted string. Defaults to full access. All Gateway and some Interface endpoints support policies - see the relevant AWS documentation for more details.
    privateDnsEnabled : bool, optional
        Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface. Most users will want this enabled to allow services within the VPC to automatically use the endpoint.
        Defaults to false.
    resourceConfigurationArn : str, optional
        The ARN of a Resource Configuration to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceName : str, optional
        The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> (the SageMaker AI Notebook service is an exception to this rule, the service name is in the form aws.sagemaker.<region>.notebook). Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceNameRef : VpcendpointspecinitproviderServicenameref, optional
        Reference to a VPCEndpointService in ec2 to populate serviceName.
    serviceNameSelector : VpcendpointspecinitproviderServicenameselector, optional
        Selector for a VPCEndpointService in ec2 to populate serviceName.
    serviceNetworkArn : str, optional
        The ARN of a Service Network to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceRegion : str, optional
        - The AWS region of the VPC Endpoint Service. If specified, the VPC endpoint will connect to the service in the provided region. Applicable for endpoints of type Interface.
    subnetConfiguration : [VpcendpointspecinitproviderSubnetconfigurationitem], optional
        Subnet configuration for the endpoint, used to select specific IPv4 and/or IPv6 addresses to the endpoint. See subnet_configuration below.
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcEndpointType : str, optional
        The VPC endpoint type, Gateway, GatewayLoadBalancer,Interface, Resource or ServiceNetwork. Defaults to Gateway.
    vpcId : str, optional
        The ID of the VPC in which the endpoint will be used.
    vpcIdRef : VpcendpointspecinitproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : VpcendpointspecinitproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    autoAccept? : bool
    dnsOptions? : [VpcendpointspecinitproviderDnsoptionsitem]
    ipAddressType? : str
    policy? : str
    privateDnsEnabled? : bool
    resourceConfigurationArn? : str
    serviceName? : str
    serviceNameRef? : VpcendpointspecinitproviderServicenameref
    serviceNameSelector? : VpcendpointspecinitproviderServicenameselector
    serviceNetworkArn? : str
    serviceRegion? : str
    subnetConfiguration? : [VpcendpointspecinitproviderSubnetconfigurationitem]
    tags? : {str:str}
    vpcEndpointType? : str
    vpcId? : str
    vpcIdRef? : VpcendpointspecinitproviderVpcidref
    vpcIdSelector? : VpcendpointspecinitproviderVpcidselector

schema VpcendpointspecinitproviderDnsoptionsitem:
    """
    VpcendpointspecinitproviderDnsoptionsitem schema.

    Attributes
    ----------
    dnsRecordIpType : str, optional
        The DNS records created for the endpoint. Valid values are ipv4, dualstack, service-defined, and ipv6.
    privateDnsOnlyForInboundResolverEndpoint : bool, optional
        Indicates whether to enable private DNS only for inbound endpoints. This option is available only for services that support both gateway and interface endpoints. It routes traffic that originates from the VPC to the gateway endpoint and traffic that originates from on-premises to the interface endpoint. Default is false. Can only be specified if private_dns_enabled is true.
    """
    dnsRecordIpType? : str
    privateDnsOnlyForInboundResolverEndpoint? : bool

schema VpcendpointspecinitproviderServicenameref:
    """
    Reference to a VPCEndpointService in ec2 to populate serviceName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointspecinitproviderservicenamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointspecinitproviderservicenamerefPolicy

schema VpcendpointspecinitproviderservicenamerefPolicy:
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

schema VpcendpointspecinitproviderServicenameselector:
    """
    Selector for a VPCEndpointService in ec2 to populate serviceName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointspecinitproviderservicenameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointspecinitproviderservicenameselectorPolicy

schema VpcendpointspecinitproviderservicenameselectorPolicy:
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

schema VpcendpointspecinitproviderSubnetconfigurationitem:
    """
    VpcendpointspecinitproviderSubnetconfigurationitem schema.

    Attributes
    ----------
    ipv4 : str, optional
        The IPv4 address to assign to the endpoint network interface in the subnet. You must provide an IPv4 address if the VPC endpoint supports IPv4.
    ipv6 : str, optional
        The IPv6 address to assign to the endpoint network interface in the subnet. You must provide an IPv6 address if the VPC endpoint supports IPv6.
    subnetId : str, optional
        The ID of the subnet. Must have a corresponding subnet in the subnet_ids argument.
    subnetIdRef : VpcendpointspecinitprovidersubnetconfigurationitemSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : VpcendpointspecinitprovidersubnetconfigurationitemSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    """
    ipv4? : str
    ipv6? : str
    subnetId? : str
    subnetIdRef? : VpcendpointspecinitprovidersubnetconfigurationitemSubnetidref
    subnetIdSelector? : VpcendpointspecinitprovidersubnetconfigurationitemSubnetidselector

schema VpcendpointspecinitprovidersubnetconfigurationitemSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointspecinitprovidersubnetconfigurationitemsubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointspecinitprovidersubnetconfigurationitemsubnetidrefPolicy

schema VpcendpointspecinitprovidersubnetconfigurationitemsubnetidrefPolicy:
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

schema VpcendpointspecinitprovidersubnetconfigurationitemSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointspecinitprovidersubnetconfigurationitemsubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointspecinitprovidersubnetconfigurationitemsubnetidselectorPolicy

schema VpcendpointspecinitprovidersubnetconfigurationitemsubnetidselectorPolicy:
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

schema VpcendpointspecinitproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointspecinitprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointspecinitprovidervpcidrefPolicy

schema VpcendpointspecinitprovidervpcidrefPolicy:
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

schema VpcendpointspecinitproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointspecinitprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointspecinitprovidervpcidselectorPolicy

schema VpcendpointspecinitprovidervpcidselectorPolicy:
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

schema VpcendpointspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointspecproviderconfigrefPolicy

schema VpcendpointspecproviderconfigrefPolicy:
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

schema VpcendpointspecWriteconnectionsecrettoref:
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

schema VpcendpointStatus:
    """
    VPCEndpointStatus defines the observed state of VPCEndpoint.

    Attributes
    ----------
    atProvider : VpcendpointstatusAtprovider, optional
        No description available.
    conditions : [VpcendpointstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : VpcendpointstatusAtprovider
    conditions? : [VpcendpointstatusConditionsitem]
    observedGeneration? : int

schema VpcendpointstatusAtprovider:
    """
    VpcendpointstatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        The Amazon Resource Name (ARN) of the VPC endpoint.
    autoAccept : bool, optional
        Accept the VPC endpoint (the VPC endpoint and service need to be in the same AWS account).
    cidrBlocks : [str], optional
        The list of CIDR blocks for the exposed AWS service. Applicable for endpoints of type Gateway.
    dnsEntry : [VpcendpointstatusatproviderDnsentryitem], optional
        The DNS entries for the VPC Endpoint. Applicable for endpoints of type Interface. DNS blocks are documented below.
    dnsOptions : [VpcendpointstatusatproviderDnsoptionsitem], optional
        The DNS options for the endpoint. See dns_options below.
    id : str, optional
        The ID of the VPC endpoint.
    ipAddressType : str, optional
        The IP address type for the endpoint. Valid values are ipv4, dualstack, and ipv6.
    networkInterfaceIds : [str], optional
        One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface.
    ownerId : str, optional
        The ID of the AWS account that owns the VPC endpoint.
    policy : str, optional
        A policy to attach to the endpoint that controls access to the service. This is a JSON formatted string. Defaults to full access. All Gateway and some Interface endpoints support policies - see the relevant AWS documentation for more details.
    prefixListId : str, optional
        The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway.
    privateDnsEnabled : bool, optional
        Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface. Most users will want this enabled to allow services within the VPC to automatically use the endpoint.
        Defaults to false.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    requesterManaged : bool, optional
        Whether or not the VPC Endpoint is being managed by its service - true or false.
    resourceConfigurationArn : str, optional
        The ARN of a Resource Configuration to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    routeTableIds : [str], optional
        One or more route table IDs. Applicable for endpoints of type Gateway.
    securityGroupIds : [str], optional
        The ID of one or more security groups to associate with the network interface. Applicable for endpoints of type Interface.
        If no security groups are specified, the VPC's default security group is associated with the endpoint.
    serviceName : str, optional
        The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> (the SageMaker AI Notebook service is an exception to this rule, the service name is in the form aws.sagemaker.<region>.notebook). Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceNetworkArn : str, optional
        The ARN of a Service Network to connect this VPC Endpoint to. Exactly one of resource_configuration_arn, service_name or service_network_arn is required.
    serviceRegion : str, optional
        - The AWS region of the VPC Endpoint Service. If specified, the VPC endpoint will connect to the service in the provided region. Applicable for endpoints of type Interface.
    state : str, optional
        The state of the VPC endpoint.
    subnetConfiguration : [VpcendpointstatusatproviderSubnetconfigurationitem], optional
        Subnet configuration for the endpoint, used to select specific IPv4 and/or IPv6 addresses to the endpoint. See subnet_configuration below.
    subnetIds : [str], optional
        The ID of one or more subnets in which to create a network interface for the endpoint. Applicable for endpoints of type GatewayLoadBalancer and Interface. Interface type endpoints cannot function without being assigned to a subnet.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    vpcEndpointType : str, optional
        The VPC endpoint type, Gateway, GatewayLoadBalancer,Interface, Resource or ServiceNetwork. Defaults to Gateway.
    vpcId : str, optional
        The ID of the VPC in which the endpoint will be used.
    """
    arn? : str
    autoAccept? : bool
    cidrBlocks? : [str]
    dnsEntry? : [VpcendpointstatusatproviderDnsentryitem]
    dnsOptions? : [VpcendpointstatusatproviderDnsoptionsitem]
    id? : str
    ipAddressType? : str
    networkInterfaceIds? : [str]
    ownerId? : str
    policy? : str
    prefixListId? : str
    privateDnsEnabled? : bool
    region? : str
    requesterManaged? : bool
    resourceConfigurationArn? : str
    routeTableIds? : [str]
    securityGroupIds? : [str]
    serviceName? : str
    serviceNetworkArn? : str
    serviceRegion? : str
    state? : str
    subnetConfiguration? : [VpcendpointstatusatproviderSubnetconfigurationitem]
    subnetIds? : [str]
    tags? : {str:str}
    tagsAll? : {str:str}
    vpcEndpointType? : str
    vpcId? : str

schema VpcendpointstatusatproviderDnsentryitem:
    """
    VpcendpointstatusatproviderDnsentryitem schema.

    Attributes
    ----------
    dnsName : str, optional
        The DNS name.
    hostedZoneId : str, optional
        The ID of the private hosted zone.
    """
    dnsName? : str
    hostedZoneId? : str

schema VpcendpointstatusatproviderDnsoptionsitem:
    """
    VpcendpointstatusatproviderDnsoptionsitem schema.

    Attributes
    ----------
    dnsRecordIpType : str, optional
        The DNS records created for the endpoint. Valid values are ipv4, dualstack, service-defined, and ipv6.
    privateDnsOnlyForInboundResolverEndpoint : bool, optional
        Indicates whether to enable private DNS only for inbound endpoints. This option is available only for services that support both gateway and interface endpoints. It routes traffic that originates from the VPC to the gateway endpoint and traffic that originates from on-premises to the interface endpoint. Default is false. Can only be specified if private_dns_enabled is true.
    """
    dnsRecordIpType? : str
    privateDnsOnlyForInboundResolverEndpoint? : bool

schema VpcendpointstatusatproviderSubnetconfigurationitem:
    """
    VpcendpointstatusatproviderSubnetconfigurationitem schema.

    Attributes
    ----------
    ipv4 : str, optional
        The IPv4 address to assign to the endpoint network interface in the subnet. You must provide an IPv4 address if the VPC endpoint supports IPv4.
    ipv6 : str, optional
        The IPv6 address to assign to the endpoint network interface in the subnet. You must provide an IPv6 address if the VPC endpoint supports IPv6.
    subnetId : str, optional
        The ID of the subnet. Must have a corresponding subnet in the subnet_ids argument.
    """
    ipv4? : str
    ipv6? : str
    subnetId? : str

schema VpcendpointstatusConditionsitem:
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