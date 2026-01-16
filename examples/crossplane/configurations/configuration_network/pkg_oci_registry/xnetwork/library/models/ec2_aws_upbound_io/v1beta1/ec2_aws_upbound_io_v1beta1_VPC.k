"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Vpc:
    """
    VPC is the Schema for the VPCs API. Provides a VPC resource.

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
    spec : VpcSpec, required
        VPCSpec defines the desired state of VPC
    status : VpcStatus, optional
        VPCStatus defines the observed state of VPC.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "VPC"
    metadata? : any
    spec : VpcSpec
    status? : VpcStatus

schema VpcSpec:
    """
    VPCSpec defines the desired state of VPC

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
    forProvider : VpcspecForprovider, required
        No description available.
    initProvider : VpcspecInitprovider, optional
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
    providerConfigRef : VpcspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : VpcspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : VpcspecForprovider
    initProvider? : VpcspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : VpcspecProviderconfigref
    writeConnectionSecretToRef? : VpcspecWriteconnectionsecrettoref

schema VpcspecForprovider:
    """
    VpcspecForprovider schema.

    Attributes
    ----------
    assignGeneratedIpv6CidrBlock : bool, optional
        Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id
    cidrBlock : str, optional
        The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length.
    enableDnsHostnames : bool, optional
        A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.
    enableDnsSupport : bool, optional
        A boolean flag to enable/disable DNS support in the VPC. Defaults to true.
    enableNetworkAddressUsageMetrics : bool, optional
        Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false.
    instanceTenancy : str, optional
        A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee.
    ipv4IpamPoolId : str, optional
        The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization.
    ipv4IpamPoolIdRef : VpcspecforproviderIpv4Ipampoolidref, optional
        Reference to a VPCIpamPool in ec2 to populate ipv4IpamPoolId.
    ipv4IpamPoolIdSelector : VpcspecforproviderIpv4Ipampoolidselector, optional
        Selector for a VPCIpamPool in ec2 to populate ipv4IpamPoolId.
    ipv4NetmaskLength : float, optional
        The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id.
    ipv6CidrBlock : str, optional
        IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length.
    ipv6CidrBlockNetworkBorderGroup : str, optional
        By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones.
    ipv6IpamPoolId : str, optional
        IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block.
    ipv6NetmaskLength : float, optional
        Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values are from 44 to 60 in increments of 4.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    assignGeneratedIpv6CidrBlock? : bool
    cidrBlock? : str
    enableDnsHostnames? : bool
    enableDnsSupport? : bool
    enableNetworkAddressUsageMetrics? : bool
    instanceTenancy? : str
    ipv4IpamPoolId? : str
    ipv4IpamPoolIdRef? : VpcspecforproviderIpv4Ipampoolidref
    ipv4IpamPoolIdSelector? : VpcspecforproviderIpv4Ipampoolidselector
    ipv4NetmaskLength? : float
    ipv6CidrBlock? : str
    ipv6CidrBlockNetworkBorderGroup? : str
    ipv6IpamPoolId? : str
    ipv6NetmaskLength? : float
    region : str
    tags? : {str:str}

schema VpcspecforproviderIpv4Ipampoolidref:
    """
    Reference to a VPCIpamPool in ec2 to populate ipv4IpamPoolId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : Vpcspecforprovideripv4IpampoolidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : Vpcspecforprovideripv4IpampoolidrefPolicy

schema Vpcspecforprovideripv4IpampoolidrefPolicy:
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

schema VpcspecforproviderIpv4Ipampoolidselector:
    """
    Selector for a VPCIpamPool in ec2 to populate ipv4IpamPoolId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : Vpcspecforprovideripv4IpampoolidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : Vpcspecforprovideripv4IpampoolidselectorPolicy

schema Vpcspecforprovideripv4IpampoolidselectorPolicy:
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

schema VpcspecInitprovider:
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
    assignGeneratedIpv6CidrBlock : bool, optional
        Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id
    cidrBlock : str, optional
        The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length.
    enableDnsHostnames : bool, optional
        A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.
    enableDnsSupport : bool, optional
        A boolean flag to enable/disable DNS support in the VPC. Defaults to true.
    enableNetworkAddressUsageMetrics : bool, optional
        Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false.
    instanceTenancy : str, optional
        A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee.
    ipv4IpamPoolId : str, optional
        The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization.
    ipv4IpamPoolIdRef : VpcspecinitproviderIpv4Ipampoolidref, optional
        Reference to a VPCIpamPool in ec2 to populate ipv4IpamPoolId.
    ipv4IpamPoolIdSelector : VpcspecinitproviderIpv4Ipampoolidselector, optional
        Selector for a VPCIpamPool in ec2 to populate ipv4IpamPoolId.
    ipv4NetmaskLength : float, optional
        The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id.
    ipv6CidrBlock : str, optional
        IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length.
    ipv6CidrBlockNetworkBorderGroup : str, optional
        By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones.
    ipv6IpamPoolId : str, optional
        IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block.
    ipv6NetmaskLength : float, optional
        Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values are from 44 to 60 in increments of 4.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    assignGeneratedIpv6CidrBlock? : bool
    cidrBlock? : str
    enableDnsHostnames? : bool
    enableDnsSupport? : bool
    enableNetworkAddressUsageMetrics? : bool
    instanceTenancy? : str
    ipv4IpamPoolId? : str
    ipv4IpamPoolIdRef? : VpcspecinitproviderIpv4Ipampoolidref
    ipv4IpamPoolIdSelector? : VpcspecinitproviderIpv4Ipampoolidselector
    ipv4NetmaskLength? : float
    ipv6CidrBlock? : str
    ipv6CidrBlockNetworkBorderGroup? : str
    ipv6IpamPoolId? : str
    ipv6NetmaskLength? : float
    tags? : {str:str}

schema VpcspecinitproviderIpv4Ipampoolidref:
    """
    Reference to a VPCIpamPool in ec2 to populate ipv4IpamPoolId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : Vpcspecinitprovideripv4IpampoolidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : Vpcspecinitprovideripv4IpampoolidrefPolicy

schema Vpcspecinitprovideripv4IpampoolidrefPolicy:
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

schema VpcspecinitproviderIpv4Ipampoolidselector:
    """
    Selector for a VPCIpamPool in ec2 to populate ipv4IpamPoolId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : Vpcspecinitprovideripv4IpampoolidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : Vpcspecinitprovideripv4IpampoolidselectorPolicy

schema Vpcspecinitprovideripv4IpampoolidselectorPolicy:
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

schema VpcspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcspecproviderconfigrefPolicy

schema VpcspecproviderconfigrefPolicy:
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

schema VpcspecWriteconnectionsecrettoref:
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

schema VpcStatus:
    """
    VPCStatus defines the observed state of VPC.

    Attributes
    ----------
    atProvider : VpcstatusAtprovider, optional
        No description available.
    conditions : [VpcstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : VpcstatusAtprovider
    conditions? : [VpcstatusConditionsitem]
    observedGeneration? : int

schema VpcstatusAtprovider:
    """
    VpcstatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        Amazon Resource Name (ARN) of VPC
    assignGeneratedIpv6CidrBlock : bool, optional
        Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id
    cidrBlock : str, optional
        The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length.
    defaultNetworkAclId : str, optional
        The ID of the network ACL created by default on VPC creation
    defaultRouteTableId : str, optional
        The ID of the route table created by default on VPC creation
    defaultSecurityGroupId : str, optional
        The ID of the security group created by default on VPC creation
    dhcpOptionsId : str, optional
        DHCP options id of the desired VPC.
    enableDnsHostnames : bool, optional
        A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.
    enableDnsSupport : bool, optional
        A boolean flag to enable/disable DNS support in the VPC. Defaults to true.
    enableNetworkAddressUsageMetrics : bool, optional
        Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false.
    id : str, optional
        The ID of the VPC
    instanceTenancy : str, optional
        A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee.
    ipv4IpamPoolId : str, optional
        The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization.
    ipv4NetmaskLength : float, optional
        The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id.
    ipv6AssociationId : str, optional
        The association ID for the IPv6 CIDR block.
    ipv6CidrBlock : str, optional
        IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length.
    ipv6CidrBlockNetworkBorderGroup : str, optional
        By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones.
    ipv6IpamPoolId : str, optional
        IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block.
    ipv6NetmaskLength : float, optional
        Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values are from 44 to 60 in increments of 4.
    mainRouteTableId : str, optional
        The ID of the main route table associated with
        this VPC. Note that you can change a VPC's main route table by using an
        aws_main_route_table_association.
    ownerId : str, optional
        The ID of the AWS account that owns the VPC.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    """
    arn? : str
    assignGeneratedIpv6CidrBlock? : bool
    cidrBlock? : str
    defaultNetworkAclId? : str
    defaultRouteTableId? : str
    defaultSecurityGroupId? : str
    dhcpOptionsId? : str
    enableDnsHostnames? : bool
    enableDnsSupport? : bool
    enableNetworkAddressUsageMetrics? : bool
    id? : str
    instanceTenancy? : str
    ipv4IpamPoolId? : str
    ipv4NetmaskLength? : float
    ipv6AssociationId? : str
    ipv6CidrBlock? : str
    ipv6CidrBlockNetworkBorderGroup? : str
    ipv6IpamPoolId? : str
    ipv6NetmaskLength? : float
    mainRouteTableId? : str
    ownerId? : str
    region? : str
    tags? : {str:str}
    tagsAll? : {str:str}

schema VpcstatusConditionsitem:
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