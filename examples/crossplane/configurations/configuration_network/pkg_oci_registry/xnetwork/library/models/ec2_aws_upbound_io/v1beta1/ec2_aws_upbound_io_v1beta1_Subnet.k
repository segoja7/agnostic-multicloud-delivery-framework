"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Subnet:
    """
    Subnet is the Schema for the Subnets API. Provides an VPC subnet resource.

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
    spec : SubnetSpec, required
        SubnetSpec defines the desired state of Subnet
    status : SubnetStatus, optional
        SubnetStatus defines the observed state of Subnet.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "Subnet"
    metadata? : any
    spec : SubnetSpec
    status? : SubnetStatus

schema SubnetSpec:
    """
    SubnetSpec defines the desired state of Subnet

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
    forProvider : SubnetspecForprovider, required
        No description available.
    initProvider : SubnetspecInitprovider, optional
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
    providerConfigRef : SubnetspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : SubnetspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : SubnetspecForprovider
    initProvider? : SubnetspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : SubnetspecProviderconfigref
    writeConnectionSecretToRef? : SubnetspecWriteconnectionsecrettoref

schema SubnetspecForprovider:
    """
    SubnetspecForprovider schema.

    Attributes
    ----------
    assignIpv6AddressOnCreation : bool, optional
        Specify true to indicate
        that network interfaces created in the specified subnet should be
        assigned an IPv6 address. Default is false
    availabilityZone : str, optional
        AZ for the subnet.
    availabilityZoneId : str, optional
        AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead.
    cidrBlock : str, optional
        The IPv4 CIDR block for the subnet.
    customerOwnedIpv4Pool : str, optional
        The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured.
    enableDns64 : bool, optional
        Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false.
    enableLniAtDeviceIndex : float, optional
        Indicates the device position for local network interfaces in this subnet. For example, 1 indicates local network interfaces in this subnet are the secondary network interface (eth1). A local network interface cannot be the primary network interface (eth0).
    enableResourceNameDnsARecordOnLaunch : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false.
    enableResourceNameDnsAaaaRecordOnLaunch : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false.
    ipv6CidrBlock : str, optional
        The IPv6 network range for the subnet,
        in CIDR notation. The subnet size must use a /64 prefix length.
    ipv6Native : bool, optional
        Indicates whether to create an IPv6-only subnet. Default: false.
    mapCustomerOwnedIpOnLaunch : bool, optional
        Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false.
    mapPublicIpOnLaunch : bool, optional
        Specify true to indicate
        that instances launched into the subnet should be assigned
        a public IP address. Default is false.
    outpostArn : str, optional
        The Amazon Resource Name (ARN) of the Outpost.
    privateDnsHostnameTypeOnLaunch : str, optional
        The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcId : str, optional
        The VPC ID.
    vpcIdRef : SubnetspecforproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : SubnetspecforproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    assignIpv6AddressOnCreation? : bool
    availabilityZone? : str
    availabilityZoneId? : str
    cidrBlock? : str
    customerOwnedIpv4Pool? : str
    enableDns64? : bool
    enableLniAtDeviceIndex? : float
    enableResourceNameDnsARecordOnLaunch? : bool
    enableResourceNameDnsAaaaRecordOnLaunch? : bool
    ipv6CidrBlock? : str
    ipv6Native? : bool
    mapCustomerOwnedIpOnLaunch? : bool
    mapPublicIpOnLaunch? : bool
    outpostArn? : str
    privateDnsHostnameTypeOnLaunch? : str
    region : str
    tags? : {str:str}
    vpcId? : str
    vpcIdRef? : SubnetspecforproviderVpcidref
    vpcIdSelector? : SubnetspecforproviderVpcidselector

schema SubnetspecforproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SubnetspecforprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SubnetspecforprovidervpcidrefPolicy

schema SubnetspecforprovidervpcidrefPolicy:
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

schema SubnetspecforproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SubnetspecforprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SubnetspecforprovidervpcidselectorPolicy

schema SubnetspecforprovidervpcidselectorPolicy:
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

schema SubnetspecInitprovider:
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
    assignIpv6AddressOnCreation : bool, optional
        Specify true to indicate
        that network interfaces created in the specified subnet should be
        assigned an IPv6 address. Default is false
    availabilityZone : str, optional
        AZ for the subnet.
    availabilityZoneId : str, optional
        AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead.
    cidrBlock : str, optional
        The IPv4 CIDR block for the subnet.
    customerOwnedIpv4Pool : str, optional
        The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured.
    enableDns64 : bool, optional
        Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false.
    enableLniAtDeviceIndex : float, optional
        Indicates the device position for local network interfaces in this subnet. For example, 1 indicates local network interfaces in this subnet are the secondary network interface (eth1). A local network interface cannot be the primary network interface (eth0).
    enableResourceNameDnsARecordOnLaunch : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false.
    enableResourceNameDnsAaaaRecordOnLaunch : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false.
    ipv6CidrBlock : str, optional
        The IPv6 network range for the subnet,
        in CIDR notation. The subnet size must use a /64 prefix length.
    ipv6Native : bool, optional
        Indicates whether to create an IPv6-only subnet. Default: false.
    mapCustomerOwnedIpOnLaunch : bool, optional
        Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false.
    mapPublicIpOnLaunch : bool, optional
        Specify true to indicate
        that instances launched into the subnet should be assigned
        a public IP address. Default is false.
    outpostArn : str, optional
        The Amazon Resource Name (ARN) of the Outpost.
    privateDnsHostnameTypeOnLaunch : str, optional
        The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name.
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcId : str, optional
        The VPC ID.
    vpcIdRef : SubnetspecinitproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : SubnetspecinitproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    assignIpv6AddressOnCreation? : bool
    availabilityZone? : str
    availabilityZoneId? : str
    cidrBlock? : str
    customerOwnedIpv4Pool? : str
    enableDns64? : bool
    enableLniAtDeviceIndex? : float
    enableResourceNameDnsARecordOnLaunch? : bool
    enableResourceNameDnsAaaaRecordOnLaunch? : bool
    ipv6CidrBlock? : str
    ipv6Native? : bool
    mapCustomerOwnedIpOnLaunch? : bool
    mapPublicIpOnLaunch? : bool
    outpostArn? : str
    privateDnsHostnameTypeOnLaunch? : str
    tags? : {str:str}
    vpcId? : str
    vpcIdRef? : SubnetspecinitproviderVpcidref
    vpcIdSelector? : SubnetspecinitproviderVpcidselector

schema SubnetspecinitproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SubnetspecinitprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SubnetspecinitprovidervpcidrefPolicy

schema SubnetspecinitprovidervpcidrefPolicy:
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

schema SubnetspecinitproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SubnetspecinitprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SubnetspecinitprovidervpcidselectorPolicy

schema SubnetspecinitprovidervpcidselectorPolicy:
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

schema SubnetspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SubnetspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SubnetspecproviderconfigrefPolicy

schema SubnetspecproviderconfigrefPolicy:
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

schema SubnetspecWriteconnectionsecrettoref:
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

schema SubnetStatus:
    """
    SubnetStatus defines the observed state of Subnet.

    Attributes
    ----------
    atProvider : SubnetstatusAtprovider, optional
        No description available.
    conditions : [SubnetstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : SubnetstatusAtprovider
    conditions? : [SubnetstatusConditionsitem]
    observedGeneration? : int

schema SubnetstatusAtprovider:
    """
    SubnetstatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        The ARN of the subnet.
    assignIpv6AddressOnCreation : bool, optional
        Specify true to indicate
        that network interfaces created in the specified subnet should be
        assigned an IPv6 address. Default is false
    availabilityZone : str, optional
        AZ for the subnet.
    availabilityZoneId : str, optional
        AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead.
    cidrBlock : str, optional
        The IPv4 CIDR block for the subnet.
    customerOwnedIpv4Pool : str, optional
        The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured.
    enableDns64 : bool, optional
        Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false.
    enableLniAtDeviceIndex : float, optional
        Indicates the device position for local network interfaces in this subnet. For example, 1 indicates local network interfaces in this subnet are the secondary network interface (eth1). A local network interface cannot be the primary network interface (eth0).
    enableResourceNameDnsARecordOnLaunch : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false.
    enableResourceNameDnsAaaaRecordOnLaunch : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false.
    id : str, optional
        The ID of the subnet
    ipv6CidrBlock : str, optional
        The IPv6 network range for the subnet,
        in CIDR notation. The subnet size must use a /64 prefix length.
    ipv6CidrBlockAssociationId : str, optional
        The association ID for the IPv6 CIDR block.
    ipv6Native : bool, optional
        Indicates whether to create an IPv6-only subnet. Default: false.
    mapCustomerOwnedIpOnLaunch : bool, optional
        Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false.
    mapPublicIpOnLaunch : bool, optional
        Specify true to indicate
        that instances launched into the subnet should be assigned
        a public IP address. Default is false.
    outpostArn : str, optional
        The Amazon Resource Name (ARN) of the Outpost.
    ownerId : str, optional
        The ID of the AWS account that owns the subnet.
    privateDnsHostnameTypeOnLaunch : str, optional
        The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    vpcId : str, optional
        The VPC ID.
    """
    arn? : str
    assignIpv6AddressOnCreation? : bool
    availabilityZone? : str
    availabilityZoneId? : str
    cidrBlock? : str
    customerOwnedIpv4Pool? : str
    enableDns64? : bool
    enableLniAtDeviceIndex? : float
    enableResourceNameDnsARecordOnLaunch? : bool
    enableResourceNameDnsAaaaRecordOnLaunch? : bool
    id? : str
    ipv6CidrBlock? : str
    ipv6CidrBlockAssociationId? : str
    ipv6Native? : bool
    mapCustomerOwnedIpOnLaunch? : bool
    mapPublicIpOnLaunch? : bool
    outpostArn? : str
    ownerId? : str
    privateDnsHostnameTypeOnLaunch? : str
    region? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    vpcId? : str

schema SubnetstatusConditionsitem:
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