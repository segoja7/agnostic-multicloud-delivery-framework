"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Instance:
    """
    Instance is the Schema for the Instances API. Provides an EC2 instance resource. This allows instances to be created, updated, and deleted. Instances also support provisioning.

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
    spec : InstanceSpec, required
        InstanceSpec defines the desired state of Instance
    status : InstanceStatus, optional
        InstanceStatus defines the observed state of Instance.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "Instance"
    metadata? : any
    spec : InstanceSpec
    status? : InstanceStatus

schema InstanceSpec:
    """
    InstanceSpec defines the desired state of Instance

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
    forProvider : InstancespecForprovider, required
        No description available.
    initProvider : InstancespecInitprovider, optional
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
    providerConfigRef : InstancespecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : InstancespecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : InstancespecForprovider
    initProvider? : InstancespecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : InstancespecProviderconfigref
    writeConnectionSecretToRef? : InstancespecWriteconnectionsecrettoref

schema InstancespecForprovider:
    """
    InstancespecForprovider schema.

    Attributes
    ----------
    ami : str, optional
        AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template.
    associatePublicIpAddress : bool, optional
        Whether to associate a public IP address with an instance in a VPC.
    availabilityZone : str, optional
        AZ to start the instance in.
    capacityReservationSpecification : [InstancespecforproviderCapacityreservationspecificationitem], optional
        Describes an instance's Capacity Reservation targeting option. See Capacity Reservation Specification below for more details.
    cpuOptions : [InstancespecforproviderCpuoptionsitem], optional
        The CPU options for the instance. See CPU Options below for more details.
    creditSpecification : [InstancespecforproviderCreditspecificationitem], optional
        Configuration block for customizing the credit specification of the instance. See Credit Specification below for more details. Removing this configuration on existing instances will only stop managing it. It will not change the configuration back to the default for the instance type.
    disableApiStop : bool, optional
        If true, enables EC2 Instance Stop Protection.
    disableApiTermination : bool, optional
        If true, enables EC2 Instance Termination Protection.
    ebsBlockDevice : [InstancespecforproviderEbsblockdeviceitem], optional
        One or more configuration blocks with additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation. See Block Devices below for details on attributes and drift detection. When accessing this as an attribute reference, it is a set of objects.
    ebsOptimized : bool, optional
        If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information.
    enablePrimaryIpv6 : bool, optional
        Whether to assign a primary IPv6 Global Unicast Address (GUA) to the instance when launched in a dual-stack or IPv6-only subnet. A primary IPv6 address ensures a consistent IPv6 address for the instance and is automatically assigned by AWS to the ENI. Once enabled, the first IPv6 GUA becomes the primary IPv6 address and cannot be disabled. The primary IPv6 address remains until the instance is terminated or the ENI is detached. Disabling enable_primary_ipv6 after it has been enabled forces recreation of the instance.
    enclaveOptions : [InstancespecforproviderEnclaveoptionsitem], optional
        Enable Nitro Enclaves on launched instances. See Enclave Options below for more details.
    ephemeralBlockDevice : [InstancespecforproviderEphemeralblockdeviceitem], optional
        One or more configuration blocks to customize Ephemeral (also known as "Instance Store") volumes on the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a set of objects.
    forceDestroy : bool, optional
        Destroys instance even if disable_api_termination or disable_api_stop is set to true. Defaults to false. If setting this field in the same operation that would require replacing the instance or destroying the instance, this flag will not work.
    getPasswordData : bool, optional
        If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information.
    hibernation : bool, optional
        If true, the launched EC2 instance will support hibernation.
    hostId : str, optional
        ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host.
    hostResourceGroupArn : str, optional
        ARN of the host resource group in which to launch the instances. If you specify an ARN, omit the tenancy parameter or set it to host.
    iamInstanceProfile : str, optional
        IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole.
    instanceInitiatedShutdownBehavior : str, optional
        Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information.
    instanceMarketOptions : [InstancespecforproviderInstancemarketoptionsitem], optional
        Describes the market (purchasing) option for the instances. See Market Options below for details on attributes.
    instanceType : str, optional
        Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance.
    ipv6AddressCount : float, optional
        Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet.
    ipv6Addresses : [str], optional
        Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface
    keyName : str, optional
        Key name of the Key Pair to use for the instance; which can be managed using the .
    launchTemplate : [InstancespecforproviderLaunchtemplateitem], optional
        Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template. See Launch Template Specification below for more details.
    maintenanceOptions : [InstancespecforproviderMaintenanceoptionsitem], optional
        Maintenance and recovery options for the instance. See Maintenance Options below for more details.
    metadataOptions : [InstancespecforproviderMetadataoptionsitem], optional
        Customize the metadata options of the instance. See Metadata Options below for more details.
    monitoring : bool, optional
        If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)
    networkInterface : [InstancespecforproviderNetworkinterfaceitem], optional
        Customize network interfaces to be attached at instance boot time. See Network Interfaces below for more details.
    placementGroup : str, optional
        Placement Group to start the instance in. Conflicts with placement_group_id.
    placementGroupId : str, optional
        Placement Group ID to start the instance in. Conflicts with placement_group.
    placementPartitionNumber : float, optional
        Number of the partition the instance is in. Valid only if the  strategy argument is set to "partition".
    primaryNetworkInterface : [InstancespecforproviderPrimarynetworkinterfaceitem], optional
        The primary network interface. See Primary Network Interface below.
    privateDnsNameOptions : [InstancespecforproviderPrivatednsnameoptionsitem], optional
        Options for the instance hostname. The default values are inherited from the subnet. See Private DNS Name Options below for more details.
    privateIp : str, optional
        Private IP address to associate with the instance in a VPC.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    rootBlockDevice : [InstancespecforproviderRootblockdeviceitem], optional
        Configuration block to customize details about the root block device of the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a list containing one object.
    secondaryPrivateIps : [str], optional
        List of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e., referenced in a network_interface block. Refer to the Elastic network interfaces documentation to see the maximum number of private IP addresses allowed per instance type.
    sourceDestCheck : bool, optional
        Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true.
    subnetId : str, optional
        VPC Subnet ID to launch in.
    subnetIdRef : InstancespecforproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : InstancespecforproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tenancy : str, optional
        Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command. Valid values are default, dedicated, and host.
    userData : str, optional
        User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate of the EC2 instance.
    userDataBase64 : str, optional
        Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate of the EC2 instance.
    userDataReplaceOnChange : bool, optional
        When used in combination with user_data or user_data_base64 will trigger a destroy and recreate of the EC2 instance when set to true. Defaults to false if not set.
    volumeTags : {str:str}, optional
        Map of tags to assign, at instance-creation time, to root and EBS volumes.
    vpcSecurityGroupIdRefs : [InstancespecforproviderVpcsecuritygroupidrefsitem], optional
        References to SecurityGroup in ec2 to populate vpcSecurityGroupIds.
    vpcSecurityGroupIdSelector : InstancespecforproviderVpcsecuritygroupidselector, optional
        Selector for a list of SecurityGroup in ec2 to populate vpcSecurityGroupIds.
    vpcSecurityGroupIds : [str], optional
        List of security group IDs to associate with.
    """
    ami? : str
    associatePublicIpAddress? : bool
    availabilityZone? : str
    capacityReservationSpecification? : [InstancespecforproviderCapacityreservationspecificationitem]
    cpuOptions? : [InstancespecforproviderCpuoptionsitem]
    creditSpecification? : [InstancespecforproviderCreditspecificationitem]
    disableApiStop? : bool
    disableApiTermination? : bool
    ebsBlockDevice? : [InstancespecforproviderEbsblockdeviceitem]
    ebsOptimized? : bool
    enablePrimaryIpv6? : bool
    enclaveOptions? : [InstancespecforproviderEnclaveoptionsitem]
    ephemeralBlockDevice? : [InstancespecforproviderEphemeralblockdeviceitem]
    forceDestroy? : bool
    getPasswordData? : bool
    hibernation? : bool
    hostId? : str
    hostResourceGroupArn? : str
    iamInstanceProfile? : str
    instanceInitiatedShutdownBehavior? : str
    instanceMarketOptions? : [InstancespecforproviderInstancemarketoptionsitem]
    instanceType? : str
    ipv6AddressCount? : float
    ipv6Addresses? : [str]
    keyName? : str
    launchTemplate? : [InstancespecforproviderLaunchtemplateitem]
    maintenanceOptions? : [InstancespecforproviderMaintenanceoptionsitem]
    metadataOptions? : [InstancespecforproviderMetadataoptionsitem]
    monitoring? : bool
    networkInterface? : [InstancespecforproviderNetworkinterfaceitem]
    placementGroup? : str
    placementGroupId? : str
    placementPartitionNumber? : float
    primaryNetworkInterface? : [InstancespecforproviderPrimarynetworkinterfaceitem]
    privateDnsNameOptions? : [InstancespecforproviderPrivatednsnameoptionsitem]
    privateIp? : str
    region : str
    rootBlockDevice? : [InstancespecforproviderRootblockdeviceitem]
    secondaryPrivateIps? : [str]
    sourceDestCheck? : bool
    subnetId? : str
    subnetIdRef? : InstancespecforproviderSubnetidref
    subnetIdSelector? : InstancespecforproviderSubnetidselector
    tags? : {str:str}
    tenancy? : str
    userData? : str
    userDataBase64? : str
    userDataReplaceOnChange? : bool
    volumeTags? : {str:str}
    vpcSecurityGroupIdRefs? : [InstancespecforproviderVpcsecuritygroupidrefsitem]
    vpcSecurityGroupIdSelector? : InstancespecforproviderVpcsecuritygroupidselector
    vpcSecurityGroupIds? : [str]

schema InstancespecforproviderCapacityreservationspecificationitem:
    """
    InstancespecforproviderCapacityreservationspecificationitem schema.

    Attributes
    ----------
    capacityReservationPreference : str, optional
        Indicates the instance's Capacity Reservation preferences. Can be "open" or "none". (Default: "open").
    capacityReservationTarget : [InstancespecforprovidercapacityreservationspecificationitemCapacityreservationtargetitem], optional
        Information about the target Capacity Reservation. See Capacity Reservation Target below for more details.
    """
    capacityReservationPreference? : str
    capacityReservationTarget? : [InstancespecforprovidercapacityreservationspecificationitemCapacityreservationtargetitem]

schema InstancespecforprovidercapacityreservationspecificationitemCapacityreservationtargetitem:
    """
    InstancespecforprovidercapacityreservationspecificationitemCapacityreservationtargetitem schema.

    Attributes
    ----------
    capacityReservationId : str, optional
        ID of the Capacity Reservation in which to run the instance.
    capacityReservationResourceGroupArn : str, optional
        ARN of the Capacity Reservation resource group in which to run the instance.
    """
    capacityReservationId? : str
    capacityReservationResourceGroupArn? : str

schema InstancespecforproviderCpuoptionsitem:
    """
    InstancespecforproviderCpuoptionsitem schema.

    Attributes
    ----------
    amdSevSnp : str, optional
        Indicates whether to enable the instance for AMD SEV-SNP. AMD SEV-SNP is supported with M6a, R6a, and C6a instance types only. Valid values are enabled and disabled.
    coreCount : float, optional
        Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API.
    threadsPerCore : float, optional
        If set to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set. See Optimizing CPU Options for more information.
    """
    amdSevSnp? : str
    coreCount? : float
    threadsPerCore? : float

schema InstancespecforproviderCreditspecificationitem:
    """
    InstancespecforproviderCreditspecificationitem schema.

    Attributes
    ----------
    cpuCredits : str, optional
        Credit option for CPU usage. Valid values include standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default.
    """
    cpuCredits? : str

schema InstancespecforproviderEbsblockdeviceitem:
    """
    InstancespecforproviderEbsblockdeviceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether the volume should be destroyed on instance termination. Defaults to true.
    deviceName : str, optional
        Name of the device to mount.
    encrypted : bool, optional
        Enables EBS encryption on the volume. Defaults to false. Cannot be used with snapshot_id. Must be configured to perform drift detection.
    iops : float, optional
        Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
    kmsKeyId : str, optional
        Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
    kmsKeyIdRef : InstancespecforproviderebsblockdeviceitemKmskeyidref, optional
        Reference to a Key in kms to populate kmsKeyId.
    kmsKeyIdSelector : InstancespecforproviderebsblockdeviceitemKmskeyidselector, optional
        Selector for a Key in kms to populate kmsKeyId.
    snapshotId : str, optional
        Snapshot ID to mount.
    tags : {str:str}, optional
        Map of tags to assign to the device.
    tagsAll : {str:str}, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    throughput : float, optional
        Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
    volumeSize : float, optional
        Size of the volume in gibibytes (GiB).
    volumeType : str, optional
        Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2.
    """
    deleteOnTermination? : bool
    deviceName? : str
    encrypted? : bool
    iops? : float
    kmsKeyId? : str
    kmsKeyIdRef? : InstancespecforproviderebsblockdeviceitemKmskeyidref
    kmsKeyIdSelector? : InstancespecforproviderebsblockdeviceitemKmskeyidselector
    snapshotId? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    throughput? : float
    volumeSize? : float
    volumeType? : str

schema InstancespecforproviderebsblockdeviceitemKmskeyidref:
    """
    Reference to a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecforproviderebsblockdeviceitemkmskeyidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecforproviderebsblockdeviceitemkmskeyidrefPolicy

schema InstancespecforproviderebsblockdeviceitemkmskeyidrefPolicy:
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

schema InstancespecforproviderebsblockdeviceitemKmskeyidselector:
    """
    Selector for a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecforproviderebsblockdeviceitemkmskeyidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecforproviderebsblockdeviceitemkmskeyidselectorPolicy

schema InstancespecforproviderebsblockdeviceitemkmskeyidselectorPolicy:
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

schema InstancespecforproviderEnclaveoptionsitem:
    """
    InstancespecforproviderEnclaveoptionsitem schema.

    Attributes
    ----------
    enabled : bool, optional
        Whether Nitro Enclaves will be enabled on the instance. Defaults to false.
    """
    enabled? : bool

schema InstancespecforproviderEphemeralblockdeviceitem:
    """
    InstancespecforproviderEphemeralblockdeviceitem schema.

    Attributes
    ----------
    deviceName : str, optional
        Name of the block device to mount on the instance.
    noDevice : bool, optional
        Suppresses the specified device included in the AMI's block device mapping.
    virtualName : str, optional
        Instance Store Device Name (e.g., ephemeral0).
    """
    deviceName? : str
    noDevice? : bool
    virtualName? : str

schema InstancespecforproviderInstancemarketoptionsitem:
    """
    InstancespecforproviderInstancemarketoptionsitem schema.

    Attributes
    ----------
    marketType : str, optional
        Type of market for the instance. Valid values are spot and capacity-block. Defaults to spot. Required if spot_options is specified.
    spotOptions : [InstancespecforproviderinstancemarketoptionsitemSpotoptionsitem], optional
        Block to configure the options for Spot Instances. See Spot Options below for details on attributes.
    """
    marketType? : str
    spotOptions? : [InstancespecforproviderinstancemarketoptionsitemSpotoptionsitem]

schema InstancespecforproviderinstancemarketoptionsitemSpotoptionsitem:
    """
    InstancespecforproviderinstancemarketoptionsitemSpotoptionsitem schema.

    Attributes
    ----------
    instanceInterruptionBehavior : str, optional
        The behavior when a Spot Instance is interrupted. Valid values include hibernate, stop, terminate . The default is terminate.
    maxPrice : str, optional
        The maximum hourly price that you're willing to pay for a Spot Instance.
    spotInstanceType : str, optional
        The Spot Instance request type. Valid values include one-time, persistent. Persistent Spot Instance requests are only supported when the instance interruption behavior is either hibernate or stop. The default is one-time.
    validUntil : str, optional
        The end date of the request, in UTC format (YYYY-MM-DDTHH:MM:SSZ). Supported only for persistent requests.
    """
    instanceInterruptionBehavior? : str
    maxPrice? : str
    spotInstanceType? : str
    validUntil? : str

schema InstancespecforproviderLaunchtemplateitem:
    """
    InstancespecforproviderLaunchtemplateitem schema.

    Attributes
    ----------
    id : str, optional
        ID of the launch template. Conflicts with name.
    name : str, optional
        Name of the launch template. Conflicts with id.
    version : str, optional
        Template version. Can be a specific version number, $Latest or $Default. The default value is $Default.
    """
    id? : str
    name? : str
    version? : str

schema InstancespecforproviderMaintenanceoptionsitem:
    """
    InstancespecforproviderMaintenanceoptionsitem schema.

    Attributes
    ----------
    autoRecovery : str, optional
        Automatic recovery behavior of the Instance. Can be "default" or "disabled". See Recover your instance for more details.
    """
    autoRecovery? : str

schema InstancespecforproviderMetadataoptionsitem:
    """
    InstancespecforproviderMetadataoptionsitem schema.

    Attributes
    ----------
    httpEndpoint : str, optional
        Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled.
    httpProtocolIpv6 : str, optional
        Whether the IPv6 endpoint for the instance metadata service is enabled. Defaults to disabled.
    httpPutResponseHopLimit : float, optional
        Desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values are integer from 1 to 64. Defaults to 1.
    httpTokens : str, optional
        Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required.
    instanceMetadataTags : str, optional
        Enables or disables access to instance tags from the instance metadata service. Valid values include enabled or disabled. Defaults to disabled.
    """
    httpEndpoint? : str
    httpProtocolIpv6? : str
    httpPutResponseHopLimit? : float
    httpTokens? : str
    instanceMetadataTags? : str

schema InstancespecforproviderNetworkinterfaceitem:
    """
    InstancespecforproviderNetworkinterfaceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether or not to delete the network interface on instance termination. Defaults to false. Currently, the only valid value is false, as this is only supported when creating new network interfaces when launching an instance.
    deviceIndex : float, optional
        Integer index of the network interface attachment. Limited by instance type.
    networkCardIndex : float, optional
        Integer index of the network card. Limited by instance type. The default index is 0.
    networkInterfaceId : str, optional
        ID of the network interface to attach.
    networkInterfaceIdRef : InstancespecforprovidernetworkinterfaceitemNetworkinterfaceidref, optional
        Reference to a NetworkInterface in ec2 to populate networkInterfaceId.
    networkInterfaceIdSelector : InstancespecforprovidernetworkinterfaceitemNetworkinterfaceidselector, optional
        Selector for a NetworkInterface in ec2 to populate networkInterfaceId.
    """
    deleteOnTermination? : bool
    deviceIndex? : float
    networkCardIndex? : float
    networkInterfaceId? : str
    networkInterfaceIdRef? : InstancespecforprovidernetworkinterfaceitemNetworkinterfaceidref
    networkInterfaceIdSelector? : InstancespecforprovidernetworkinterfaceitemNetworkinterfaceidselector

schema InstancespecforprovidernetworkinterfaceitemNetworkinterfaceidref:
    """
    Reference to a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecforprovidernetworkinterfaceitemnetworkinterfaceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecforprovidernetworkinterfaceitemnetworkinterfaceidrefPolicy

schema InstancespecforprovidernetworkinterfaceitemnetworkinterfaceidrefPolicy:
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

schema InstancespecforprovidernetworkinterfaceitemNetworkinterfaceidselector:
    """
    Selector for a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecforprovidernetworkinterfaceitemnetworkinterfaceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecforprovidernetworkinterfaceitemnetworkinterfaceidselectorPolicy

schema InstancespecforprovidernetworkinterfaceitemnetworkinterfaceidselectorPolicy:
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

schema InstancespecforproviderPrimarynetworkinterfaceitem:
    """
    InstancespecforproviderPrimarynetworkinterfaceitem schema.

    Attributes
    ----------
    networkInterfaceId : str, optional
        ID of the network interface to attach.
    networkInterfaceIdRef : InstancespecforproviderprimarynetworkinterfaceitemNetworkinterfaceidref, optional
        Reference to a NetworkInterface in ec2 to populate networkInterfaceId.
    networkInterfaceIdSelector : InstancespecforproviderprimarynetworkinterfaceitemNetworkinterfaceidselector, optional
        Selector for a NetworkInterface in ec2 to populate networkInterfaceId.
    """
    networkInterfaceId? : str
    networkInterfaceIdRef? : InstancespecforproviderprimarynetworkinterfaceitemNetworkinterfaceidref
    networkInterfaceIdSelector? : InstancespecforproviderprimarynetworkinterfaceitemNetworkinterfaceidselector

schema InstancespecforproviderprimarynetworkinterfaceitemNetworkinterfaceidref:
    """
    Reference to a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecforproviderprimarynetworkinterfaceitemnetworkinterfaceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecforproviderprimarynetworkinterfaceitemnetworkinterfaceidrefPolicy

schema InstancespecforproviderprimarynetworkinterfaceitemnetworkinterfaceidrefPolicy:
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

schema InstancespecforproviderprimarynetworkinterfaceitemNetworkinterfaceidselector:
    """
    Selector for a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecforproviderprimarynetworkinterfaceitemnetworkinterfaceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecforproviderprimarynetworkinterfaceitemnetworkinterfaceidselectorPolicy

schema InstancespecforproviderprimarynetworkinterfaceitemnetworkinterfaceidselectorPolicy:
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

schema InstancespecforproviderPrivatednsnameoptionsitem:
    """
    InstancespecforproviderPrivatednsnameoptionsitem schema.

    Attributes
    ----------
    enableResourceNameDnsARecord : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS A records.
    enableResourceNameDnsAaaaRecord : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records.
    hostnameType : str, optional
        Type of hostname for Amazon EC2 instances. For IPv4 only subnets, an instance DNS name must be based on the instance IPv4 address. For IPv6 native subnets, an instance DNS name must be based on the instance ID. For dual-stack subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name and resource-name.
    """
    enableResourceNameDnsARecord? : bool
    enableResourceNameDnsAaaaRecord? : bool
    hostnameType? : str

schema InstancespecforproviderRootblockdeviceitem:
    """
    InstancespecforproviderRootblockdeviceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether the volume should be destroyed on instance termination. Defaults to true.
    encrypted : bool, optional
        Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection.
    iops : float, optional
        Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
    kmsKeyId : str, optional
        Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
    kmsKeyIdRef : InstancespecforproviderrootblockdeviceitemKmskeyidref, optional
        Reference to a Key in kms to populate kmsKeyId.
    kmsKeyIdSelector : InstancespecforproviderrootblockdeviceitemKmskeyidselector, optional
        Selector for a Key in kms to populate kmsKeyId.
    tags : {str:str}, optional
        Map of tags to assign to the device.
    tagsAll : {str:str}, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    throughput : float, optional
        Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
    volumeSize : float, optional
        Size of the volume in gibibytes (GiB).
    volumeType : str, optional
        Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to the volume type that the AMI uses.
    """
    deleteOnTermination? : bool
    encrypted? : bool
    iops? : float
    kmsKeyId? : str
    kmsKeyIdRef? : InstancespecforproviderrootblockdeviceitemKmskeyidref
    kmsKeyIdSelector? : InstancespecforproviderrootblockdeviceitemKmskeyidselector
    tags? : {str:str}
    tagsAll? : {str:str}
    throughput? : float
    volumeSize? : float
    volumeType? : str

schema InstancespecforproviderrootblockdeviceitemKmskeyidref:
    """
    Reference to a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecforproviderrootblockdeviceitemkmskeyidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecforproviderrootblockdeviceitemkmskeyidrefPolicy

schema InstancespecforproviderrootblockdeviceitemkmskeyidrefPolicy:
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

schema InstancespecforproviderrootblockdeviceitemKmskeyidselector:
    """
    Selector for a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecforproviderrootblockdeviceitemkmskeyidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecforproviderrootblockdeviceitemkmskeyidselectorPolicy

schema InstancespecforproviderrootblockdeviceitemkmskeyidselectorPolicy:
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

schema InstancespecforproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecforprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecforprovidersubnetidrefPolicy

schema InstancespecforprovidersubnetidrefPolicy:
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

schema InstancespecforproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecforprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecforprovidersubnetidselectorPolicy

schema InstancespecforprovidersubnetidselectorPolicy:
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

schema InstancespecforproviderVpcsecuritygroupidrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecforprovidervpcsecuritygroupidrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecforprovidervpcsecuritygroupidrefsitemPolicy

schema InstancespecforprovidervpcsecuritygroupidrefsitemPolicy:
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

schema InstancespecforproviderVpcsecuritygroupidselector:
    """
    Selector for a list of SecurityGroup in ec2 to populate vpcSecurityGroupIds.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecforprovidervpcsecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecforprovidervpcsecuritygroupidselectorPolicy

schema InstancespecforprovidervpcsecuritygroupidselectorPolicy:
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

schema InstancespecInitprovider:
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
    ami : str, optional
        AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template.
    associatePublicIpAddress : bool, optional
        Whether to associate a public IP address with an instance in a VPC.
    availabilityZone : str, optional
        AZ to start the instance in.
    capacityReservationSpecification : [InstancespecinitproviderCapacityreservationspecificationitem], optional
        Describes an instance's Capacity Reservation targeting option. See Capacity Reservation Specification below for more details.
    cpuOptions : [InstancespecinitproviderCpuoptionsitem], optional
        The CPU options for the instance. See CPU Options below for more details.
    creditSpecification : [InstancespecinitproviderCreditspecificationitem], optional
        Configuration block for customizing the credit specification of the instance. See Credit Specification below for more details. Removing this configuration on existing instances will only stop managing it. It will not change the configuration back to the default for the instance type.
    disableApiStop : bool, optional
        If true, enables EC2 Instance Stop Protection.
    disableApiTermination : bool, optional
        If true, enables EC2 Instance Termination Protection.
    ebsBlockDevice : [InstancespecinitproviderEbsblockdeviceitem], optional
        One or more configuration blocks with additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation. See Block Devices below for details on attributes and drift detection. When accessing this as an attribute reference, it is a set of objects.
    ebsOptimized : bool, optional
        If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information.
    enablePrimaryIpv6 : bool, optional
        Whether to assign a primary IPv6 Global Unicast Address (GUA) to the instance when launched in a dual-stack or IPv6-only subnet. A primary IPv6 address ensures a consistent IPv6 address for the instance and is automatically assigned by AWS to the ENI. Once enabled, the first IPv6 GUA becomes the primary IPv6 address and cannot be disabled. The primary IPv6 address remains until the instance is terminated or the ENI is detached. Disabling enable_primary_ipv6 after it has been enabled forces recreation of the instance.
    enclaveOptions : [InstancespecinitproviderEnclaveoptionsitem], optional
        Enable Nitro Enclaves on launched instances. See Enclave Options below for more details.
    ephemeralBlockDevice : [InstancespecinitproviderEphemeralblockdeviceitem], optional
        One or more configuration blocks to customize Ephemeral (also known as "Instance Store") volumes on the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a set of objects.
    forceDestroy : bool, optional
        Destroys instance even if disable_api_termination or disable_api_stop is set to true. Defaults to false. If setting this field in the same operation that would require replacing the instance or destroying the instance, this flag will not work.
    getPasswordData : bool, optional
        If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information.
    hibernation : bool, optional
        If true, the launched EC2 instance will support hibernation.
    hostId : str, optional
        ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host.
    hostResourceGroupArn : str, optional
        ARN of the host resource group in which to launch the instances. If you specify an ARN, omit the tenancy parameter or set it to host.
    iamInstanceProfile : str, optional
        IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole.
    instanceInitiatedShutdownBehavior : str, optional
        Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information.
    instanceMarketOptions : [InstancespecinitproviderInstancemarketoptionsitem], optional
        Describes the market (purchasing) option for the instances. See Market Options below for details on attributes.
    instanceType : str, optional
        Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance.
    ipv6AddressCount : float, optional
        Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet.
    ipv6Addresses : [str], optional
        Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface
    keyName : str, optional
        Key name of the Key Pair to use for the instance; which can be managed using the .
    launchTemplate : [InstancespecinitproviderLaunchtemplateitem], optional
        Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template. See Launch Template Specification below for more details.
    maintenanceOptions : [InstancespecinitproviderMaintenanceoptionsitem], optional
        Maintenance and recovery options for the instance. See Maintenance Options below for more details.
    metadataOptions : [InstancespecinitproviderMetadataoptionsitem], optional
        Customize the metadata options of the instance. See Metadata Options below for more details.
    monitoring : bool, optional
        If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)
    networkInterface : [InstancespecinitproviderNetworkinterfaceitem], optional
        Customize network interfaces to be attached at instance boot time. See Network Interfaces below for more details.
    placementGroup : str, optional
        Placement Group to start the instance in. Conflicts with placement_group_id.
    placementGroupId : str, optional
        Placement Group ID to start the instance in. Conflicts with placement_group.
    placementPartitionNumber : float, optional
        Number of the partition the instance is in. Valid only if the  strategy argument is set to "partition".
    primaryNetworkInterface : [InstancespecinitproviderPrimarynetworkinterfaceitem], optional
        The primary network interface. See Primary Network Interface below.
    privateDnsNameOptions : [InstancespecinitproviderPrivatednsnameoptionsitem], optional
        Options for the instance hostname. The default values are inherited from the subnet. See Private DNS Name Options below for more details.
    privateIp : str, optional
        Private IP address to associate with the instance in a VPC.
    rootBlockDevice : [InstancespecinitproviderRootblockdeviceitem], optional
        Configuration block to customize details about the root block device of the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a list containing one object.
    secondaryPrivateIps : [str], optional
        List of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e., referenced in a network_interface block. Refer to the Elastic network interfaces documentation to see the maximum number of private IP addresses allowed per instance type.
    sourceDestCheck : bool, optional
        Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true.
    subnetId : str, optional
        VPC Subnet ID to launch in.
    subnetIdRef : InstancespecinitproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : InstancespecinitproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tenancy : str, optional
        Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command. Valid values are default, dedicated, and host.
    userData : str, optional
        User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate of the EC2 instance.
    userDataBase64 : str, optional
        Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate of the EC2 instance.
    userDataReplaceOnChange : bool, optional
        When used in combination with user_data or user_data_base64 will trigger a destroy and recreate of the EC2 instance when set to true. Defaults to false if not set.
    volumeTags : {str:str}, optional
        Map of tags to assign, at instance-creation time, to root and EBS volumes.
    vpcSecurityGroupIdRefs : [InstancespecinitproviderVpcsecuritygroupidrefsitem], optional
        References to SecurityGroup in ec2 to populate vpcSecurityGroupIds.
    vpcSecurityGroupIdSelector : InstancespecinitproviderVpcsecuritygroupidselector, optional
        Selector for a list of SecurityGroup in ec2 to populate vpcSecurityGroupIds.
    vpcSecurityGroupIds : [str], optional
        List of security group IDs to associate with.
    """
    ami? : str
    associatePublicIpAddress? : bool
    availabilityZone? : str
    capacityReservationSpecification? : [InstancespecinitproviderCapacityreservationspecificationitem]
    cpuOptions? : [InstancespecinitproviderCpuoptionsitem]
    creditSpecification? : [InstancespecinitproviderCreditspecificationitem]
    disableApiStop? : bool
    disableApiTermination? : bool
    ebsBlockDevice? : [InstancespecinitproviderEbsblockdeviceitem]
    ebsOptimized? : bool
    enablePrimaryIpv6? : bool
    enclaveOptions? : [InstancespecinitproviderEnclaveoptionsitem]
    ephemeralBlockDevice? : [InstancespecinitproviderEphemeralblockdeviceitem]
    forceDestroy? : bool
    getPasswordData? : bool
    hibernation? : bool
    hostId? : str
    hostResourceGroupArn? : str
    iamInstanceProfile? : str
    instanceInitiatedShutdownBehavior? : str
    instanceMarketOptions? : [InstancespecinitproviderInstancemarketoptionsitem]
    instanceType? : str
    ipv6AddressCount? : float
    ipv6Addresses? : [str]
    keyName? : str
    launchTemplate? : [InstancespecinitproviderLaunchtemplateitem]
    maintenanceOptions? : [InstancespecinitproviderMaintenanceoptionsitem]
    metadataOptions? : [InstancespecinitproviderMetadataoptionsitem]
    monitoring? : bool
    networkInterface? : [InstancespecinitproviderNetworkinterfaceitem]
    placementGroup? : str
    placementGroupId? : str
    placementPartitionNumber? : float
    primaryNetworkInterface? : [InstancespecinitproviderPrimarynetworkinterfaceitem]
    privateDnsNameOptions? : [InstancespecinitproviderPrivatednsnameoptionsitem]
    privateIp? : str
    rootBlockDevice? : [InstancespecinitproviderRootblockdeviceitem]
    secondaryPrivateIps? : [str]
    sourceDestCheck? : bool
    subnetId? : str
    subnetIdRef? : InstancespecinitproviderSubnetidref
    subnetIdSelector? : InstancespecinitproviderSubnetidselector
    tags? : {str:str}
    tenancy? : str
    userData? : str
    userDataBase64? : str
    userDataReplaceOnChange? : bool
    volumeTags? : {str:str}
    vpcSecurityGroupIdRefs? : [InstancespecinitproviderVpcsecuritygroupidrefsitem]
    vpcSecurityGroupIdSelector? : InstancespecinitproviderVpcsecuritygroupidselector
    vpcSecurityGroupIds? : [str]

schema InstancespecinitproviderCapacityreservationspecificationitem:
    """
    InstancespecinitproviderCapacityreservationspecificationitem schema.

    Attributes
    ----------
    capacityReservationPreference : str, optional
        Indicates the instance's Capacity Reservation preferences. Can be "open" or "none". (Default: "open").
    capacityReservationTarget : [InstancespecinitprovidercapacityreservationspecificationitemCapacityreservationtargetitem], optional
        Information about the target Capacity Reservation. See Capacity Reservation Target below for more details.
    """
    capacityReservationPreference? : str
    capacityReservationTarget? : [InstancespecinitprovidercapacityreservationspecificationitemCapacityreservationtargetitem]

schema InstancespecinitprovidercapacityreservationspecificationitemCapacityreservationtargetitem:
    """
    InstancespecinitprovidercapacityreservationspecificationitemCapacityreservationtargetitem schema.

    Attributes
    ----------
    capacityReservationId : str, optional
        ID of the Capacity Reservation in which to run the instance.
    capacityReservationResourceGroupArn : str, optional
        ARN of the Capacity Reservation resource group in which to run the instance.
    """
    capacityReservationId? : str
    capacityReservationResourceGroupArn? : str

schema InstancespecinitproviderCpuoptionsitem:
    """
    InstancespecinitproviderCpuoptionsitem schema.

    Attributes
    ----------
    amdSevSnp : str, optional
        Indicates whether to enable the instance for AMD SEV-SNP. AMD SEV-SNP is supported with M6a, R6a, and C6a instance types only. Valid values are enabled and disabled.
    coreCount : float, optional
        Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API.
    threadsPerCore : float, optional
        If set to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set. See Optimizing CPU Options for more information.
    """
    amdSevSnp? : str
    coreCount? : float
    threadsPerCore? : float

schema InstancespecinitproviderCreditspecificationitem:
    """
    InstancespecinitproviderCreditspecificationitem schema.

    Attributes
    ----------
    cpuCredits : str, optional
        Credit option for CPU usage. Valid values include standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default.
    """
    cpuCredits? : str

schema InstancespecinitproviderEbsblockdeviceitem:
    """
    InstancespecinitproviderEbsblockdeviceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether the volume should be destroyed on instance termination. Defaults to true.
    deviceName : str, optional
        Name of the device to mount.
    encrypted : bool, optional
        Enables EBS encryption on the volume. Defaults to false. Cannot be used with snapshot_id. Must be configured to perform drift detection.
    iops : float, optional
        Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
    kmsKeyId : str, optional
        Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
    kmsKeyIdRef : InstancespecinitproviderebsblockdeviceitemKmskeyidref, optional
        Reference to a Key in kms to populate kmsKeyId.
    kmsKeyIdSelector : InstancespecinitproviderebsblockdeviceitemKmskeyidselector, optional
        Selector for a Key in kms to populate kmsKeyId.
    snapshotId : str, optional
        Snapshot ID to mount.
    tags : {str:str}, optional
        Map of tags to assign to the device.
    tagsAll : {str:str}, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    throughput : float, optional
        Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
    volumeSize : float, optional
        Size of the volume in gibibytes (GiB).
    volumeType : str, optional
        Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2.
    """
    deleteOnTermination? : bool
    deviceName? : str
    encrypted? : bool
    iops? : float
    kmsKeyId? : str
    kmsKeyIdRef? : InstancespecinitproviderebsblockdeviceitemKmskeyidref
    kmsKeyIdSelector? : InstancespecinitproviderebsblockdeviceitemKmskeyidselector
    snapshotId? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    throughput? : float
    volumeSize? : float
    volumeType? : str

schema InstancespecinitproviderebsblockdeviceitemKmskeyidref:
    """
    Reference to a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecinitproviderebsblockdeviceitemkmskeyidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecinitproviderebsblockdeviceitemkmskeyidrefPolicy

schema InstancespecinitproviderebsblockdeviceitemkmskeyidrefPolicy:
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

schema InstancespecinitproviderebsblockdeviceitemKmskeyidselector:
    """
    Selector for a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecinitproviderebsblockdeviceitemkmskeyidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecinitproviderebsblockdeviceitemkmskeyidselectorPolicy

schema InstancespecinitproviderebsblockdeviceitemkmskeyidselectorPolicy:
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

schema InstancespecinitproviderEnclaveoptionsitem:
    """
    InstancespecinitproviderEnclaveoptionsitem schema.

    Attributes
    ----------
    enabled : bool, optional
        Whether Nitro Enclaves will be enabled on the instance. Defaults to false.
    """
    enabled? : bool

schema InstancespecinitproviderEphemeralblockdeviceitem:
    """
    InstancespecinitproviderEphemeralblockdeviceitem schema.

    Attributes
    ----------
    deviceName : str, optional
        Name of the block device to mount on the instance.
    noDevice : bool, optional
        Suppresses the specified device included in the AMI's block device mapping.
    virtualName : str, optional
        Instance Store Device Name (e.g., ephemeral0).
    """
    deviceName? : str
    noDevice? : bool
    virtualName? : str

schema InstancespecinitproviderInstancemarketoptionsitem:
    """
    InstancespecinitproviderInstancemarketoptionsitem schema.

    Attributes
    ----------
    marketType : str, optional
        Type of market for the instance. Valid values are spot and capacity-block. Defaults to spot. Required if spot_options is specified.
    spotOptions : [InstancespecinitproviderinstancemarketoptionsitemSpotoptionsitem], optional
        Block to configure the options for Spot Instances. See Spot Options below for details on attributes.
    """
    marketType? : str
    spotOptions? : [InstancespecinitproviderinstancemarketoptionsitemSpotoptionsitem]

schema InstancespecinitproviderinstancemarketoptionsitemSpotoptionsitem:
    """
    InstancespecinitproviderinstancemarketoptionsitemSpotoptionsitem schema.

    Attributes
    ----------
    instanceInterruptionBehavior : str, optional
        The behavior when a Spot Instance is interrupted. Valid values include hibernate, stop, terminate . The default is terminate.
    maxPrice : str, optional
        The maximum hourly price that you're willing to pay for a Spot Instance.
    spotInstanceType : str, optional
        The Spot Instance request type. Valid values include one-time, persistent. Persistent Spot Instance requests are only supported when the instance interruption behavior is either hibernate or stop. The default is one-time.
    validUntil : str, optional
        The end date of the request, in UTC format (YYYY-MM-DDTHH:MM:SSZ). Supported only for persistent requests.
    """
    instanceInterruptionBehavior? : str
    maxPrice? : str
    spotInstanceType? : str
    validUntil? : str

schema InstancespecinitproviderLaunchtemplateitem:
    """
    InstancespecinitproviderLaunchtemplateitem schema.

    Attributes
    ----------
    id : str, optional
        ID of the launch template. Conflicts with name.
    name : str, optional
        Name of the launch template. Conflicts with id.
    version : str, optional
        Template version. Can be a specific version number, $Latest or $Default. The default value is $Default.
    """
    id? : str
    name? : str
    version? : str

schema InstancespecinitproviderMaintenanceoptionsitem:
    """
    InstancespecinitproviderMaintenanceoptionsitem schema.

    Attributes
    ----------
    autoRecovery : str, optional
        Automatic recovery behavior of the Instance. Can be "default" or "disabled". See Recover your instance for more details.
    """
    autoRecovery? : str

schema InstancespecinitproviderMetadataoptionsitem:
    """
    InstancespecinitproviderMetadataoptionsitem schema.

    Attributes
    ----------
    httpEndpoint : str, optional
        Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled.
    httpProtocolIpv6 : str, optional
        Whether the IPv6 endpoint for the instance metadata service is enabled. Defaults to disabled.
    httpPutResponseHopLimit : float, optional
        Desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values are integer from 1 to 64. Defaults to 1.
    httpTokens : str, optional
        Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required.
    instanceMetadataTags : str, optional
        Enables or disables access to instance tags from the instance metadata service. Valid values include enabled or disabled. Defaults to disabled.
    """
    httpEndpoint? : str
    httpProtocolIpv6? : str
    httpPutResponseHopLimit? : float
    httpTokens? : str
    instanceMetadataTags? : str

schema InstancespecinitproviderNetworkinterfaceitem:
    """
    InstancespecinitproviderNetworkinterfaceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether or not to delete the network interface on instance termination. Defaults to false. Currently, the only valid value is false, as this is only supported when creating new network interfaces when launching an instance.
    deviceIndex : float, optional
        Integer index of the network interface attachment. Limited by instance type.
    networkCardIndex : float, optional
        Integer index of the network card. Limited by instance type. The default index is 0.
    networkInterfaceId : str, optional
        ID of the network interface to attach.
    networkInterfaceIdRef : InstancespecinitprovidernetworkinterfaceitemNetworkinterfaceidref, optional
        Reference to a NetworkInterface in ec2 to populate networkInterfaceId.
    networkInterfaceIdSelector : InstancespecinitprovidernetworkinterfaceitemNetworkinterfaceidselector, optional
        Selector for a NetworkInterface in ec2 to populate networkInterfaceId.
    """
    deleteOnTermination? : bool
    deviceIndex? : float
    networkCardIndex? : float
    networkInterfaceId? : str
    networkInterfaceIdRef? : InstancespecinitprovidernetworkinterfaceitemNetworkinterfaceidref
    networkInterfaceIdSelector? : InstancespecinitprovidernetworkinterfaceitemNetworkinterfaceidselector

schema InstancespecinitprovidernetworkinterfaceitemNetworkinterfaceidref:
    """
    Reference to a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecinitprovidernetworkinterfaceitemnetworkinterfaceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecinitprovidernetworkinterfaceitemnetworkinterfaceidrefPolicy

schema InstancespecinitprovidernetworkinterfaceitemnetworkinterfaceidrefPolicy:
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

schema InstancespecinitprovidernetworkinterfaceitemNetworkinterfaceidselector:
    """
    Selector for a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecinitprovidernetworkinterfaceitemnetworkinterfaceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecinitprovidernetworkinterfaceitemnetworkinterfaceidselectorPolicy

schema InstancespecinitprovidernetworkinterfaceitemnetworkinterfaceidselectorPolicy:
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

schema InstancespecinitproviderPrimarynetworkinterfaceitem:
    """
    InstancespecinitproviderPrimarynetworkinterfaceitem schema.

    Attributes
    ----------
    networkInterfaceId : str, optional
        ID of the network interface to attach.
    networkInterfaceIdRef : InstancespecinitproviderprimarynetworkinterfaceitemNetworkinterfaceidref, optional
        Reference to a NetworkInterface in ec2 to populate networkInterfaceId.
    networkInterfaceIdSelector : InstancespecinitproviderprimarynetworkinterfaceitemNetworkinterfaceidselector, optional
        Selector for a NetworkInterface in ec2 to populate networkInterfaceId.
    """
    networkInterfaceId? : str
    networkInterfaceIdRef? : InstancespecinitproviderprimarynetworkinterfaceitemNetworkinterfaceidref
    networkInterfaceIdSelector? : InstancespecinitproviderprimarynetworkinterfaceitemNetworkinterfaceidselector

schema InstancespecinitproviderprimarynetworkinterfaceitemNetworkinterfaceidref:
    """
    Reference to a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecinitproviderprimarynetworkinterfaceitemnetworkinterfaceidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecinitproviderprimarynetworkinterfaceitemnetworkinterfaceidrefPolicy

schema InstancespecinitproviderprimarynetworkinterfaceitemnetworkinterfaceidrefPolicy:
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

schema InstancespecinitproviderprimarynetworkinterfaceitemNetworkinterfaceidselector:
    """
    Selector for a NetworkInterface in ec2 to populate networkInterfaceId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecinitproviderprimarynetworkinterfaceitemnetworkinterfaceidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecinitproviderprimarynetworkinterfaceitemnetworkinterfaceidselectorPolicy

schema InstancespecinitproviderprimarynetworkinterfaceitemnetworkinterfaceidselectorPolicy:
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

schema InstancespecinitproviderPrivatednsnameoptionsitem:
    """
    InstancespecinitproviderPrivatednsnameoptionsitem schema.

    Attributes
    ----------
    enableResourceNameDnsARecord : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS A records.
    enableResourceNameDnsAaaaRecord : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records.
    hostnameType : str, optional
        Type of hostname for Amazon EC2 instances. For IPv4 only subnets, an instance DNS name must be based on the instance IPv4 address. For IPv6 native subnets, an instance DNS name must be based on the instance ID. For dual-stack subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name and resource-name.
    """
    enableResourceNameDnsARecord? : bool
    enableResourceNameDnsAaaaRecord? : bool
    hostnameType? : str

schema InstancespecinitproviderRootblockdeviceitem:
    """
    InstancespecinitproviderRootblockdeviceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether the volume should be destroyed on instance termination. Defaults to true.
    encrypted : bool, optional
        Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection.
    iops : float, optional
        Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
    kmsKeyId : str, optional
        Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
    kmsKeyIdRef : InstancespecinitproviderrootblockdeviceitemKmskeyidref, optional
        Reference to a Key in kms to populate kmsKeyId.
    kmsKeyIdSelector : InstancespecinitproviderrootblockdeviceitemKmskeyidselector, optional
        Selector for a Key in kms to populate kmsKeyId.
    tags : {str:str}, optional
        Map of tags to assign to the device.
    tagsAll : {str:str}, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    throughput : float, optional
        Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
    volumeSize : float, optional
        Size of the volume in gibibytes (GiB).
    volumeType : str, optional
        Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to the volume type that the AMI uses.
    """
    deleteOnTermination? : bool
    encrypted? : bool
    iops? : float
    kmsKeyId? : str
    kmsKeyIdRef? : InstancespecinitproviderrootblockdeviceitemKmskeyidref
    kmsKeyIdSelector? : InstancespecinitproviderrootblockdeviceitemKmskeyidselector
    tags? : {str:str}
    tagsAll? : {str:str}
    throughput? : float
    volumeSize? : float
    volumeType? : str

schema InstancespecinitproviderrootblockdeviceitemKmskeyidref:
    """
    Reference to a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecinitproviderrootblockdeviceitemkmskeyidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecinitproviderrootblockdeviceitemkmskeyidrefPolicy

schema InstancespecinitproviderrootblockdeviceitemkmskeyidrefPolicy:
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

schema InstancespecinitproviderrootblockdeviceitemKmskeyidselector:
    """
    Selector for a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecinitproviderrootblockdeviceitemkmskeyidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecinitproviderrootblockdeviceitemkmskeyidselectorPolicy

schema InstancespecinitproviderrootblockdeviceitemkmskeyidselectorPolicy:
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

schema InstancespecinitproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecinitprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecinitprovidersubnetidrefPolicy

schema InstancespecinitprovidersubnetidrefPolicy:
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

schema InstancespecinitproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecinitprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecinitprovidersubnetidselectorPolicy

schema InstancespecinitprovidersubnetidselectorPolicy:
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

schema InstancespecinitproviderVpcsecuritygroupidrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecinitprovidervpcsecuritygroupidrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecinitprovidervpcsecuritygroupidrefsitemPolicy

schema InstancespecinitprovidervpcsecuritygroupidrefsitemPolicy:
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

schema InstancespecinitproviderVpcsecuritygroupidselector:
    """
    Selector for a list of SecurityGroup in ec2 to populate vpcSecurityGroupIds.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InstancespecinitprovidervpcsecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InstancespecinitprovidervpcsecuritygroupidselectorPolicy

schema InstancespecinitprovidervpcsecuritygroupidselectorPolicy:
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

schema InstancespecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InstancespecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InstancespecproviderconfigrefPolicy

schema InstancespecproviderconfigrefPolicy:
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

schema InstancespecWriteconnectionsecrettoref:
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

schema InstanceStatus:
    """
    InstanceStatus defines the observed state of Instance.

    Attributes
    ----------
    atProvider : InstancestatusAtprovider, optional
        No description available.
    conditions : [InstancestatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : InstancestatusAtprovider
    conditions? : [InstancestatusConditionsitem]
    observedGeneration? : int

schema InstancestatusAtprovider:
    """
    InstancestatusAtprovider schema.

    Attributes
    ----------
    ami : str, optional
        AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template.
    arn : str, optional
        ARN of the instance.
    associatePublicIpAddress : bool, optional
        Whether to associate a public IP address with an instance in a VPC.
    availabilityZone : str, optional
        AZ to start the instance in.
    capacityReservationSpecification : [InstancestatusatproviderCapacityreservationspecificationitem], optional
        Describes an instance's Capacity Reservation targeting option. See Capacity Reservation Specification below for more details.
    cpuOptions : [InstancestatusatproviderCpuoptionsitem], optional
        The CPU options for the instance. See CPU Options below for more details.
    creditSpecification : [InstancestatusatproviderCreditspecificationitem], optional
        Configuration block for customizing the credit specification of the instance. See Credit Specification below for more details. Removing this configuration on existing instances will only stop managing it. It will not change the configuration back to the default for the instance type.
    disableApiStop : bool, optional
        If true, enables EC2 Instance Stop Protection.
    disableApiTermination : bool, optional
        If true, enables EC2 Instance Termination Protection.
    ebsBlockDevice : [InstancestatusatproviderEbsblockdeviceitem], optional
        One or more configuration blocks with additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation. See Block Devices below for details on attributes and drift detection. When accessing this as an attribute reference, it is a set of objects.
    ebsOptimized : bool, optional
        If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information.
    enablePrimaryIpv6 : bool, optional
        Whether to assign a primary IPv6 Global Unicast Address (GUA) to the instance when launched in a dual-stack or IPv6-only subnet. A primary IPv6 address ensures a consistent IPv6 address for the instance and is automatically assigned by AWS to the ENI. Once enabled, the first IPv6 GUA becomes the primary IPv6 address and cannot be disabled. The primary IPv6 address remains until the instance is terminated or the ENI is detached. Disabling enable_primary_ipv6 after it has been enabled forces recreation of the instance.
    enclaveOptions : [InstancestatusatproviderEnclaveoptionsitem], optional
        Enable Nitro Enclaves on launched instances. See Enclave Options below for more details.
    ephemeralBlockDevice : [InstancestatusatproviderEphemeralblockdeviceitem], optional
        One or more configuration blocks to customize Ephemeral (also known as "Instance Store") volumes on the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a set of objects.
    forceDestroy : bool, optional
        Destroys instance even if disable_api_termination or disable_api_stop is set to true. Defaults to false. If setting this field in the same operation that would require replacing the instance or destroying the instance, this flag will not work.
    getPasswordData : bool, optional
        If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information.
    hibernation : bool, optional
        If true, the launched EC2 instance will support hibernation.
    hostId : str, optional
        ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host.
    hostResourceGroupArn : str, optional
        ARN of the host resource group in which to launch the instances. If you specify an ARN, omit the tenancy parameter or set it to host.
    iamInstanceProfile : str, optional
        IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole.
    id : str, optional
        ID of the instance.
    instanceInitiatedShutdownBehavior : str, optional
        Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information.
    instanceLifecycle : str, optional
        Indicates whether this is a Spot Instance or a Scheduled Instance.
    instanceMarketOptions : [InstancestatusatproviderInstancemarketoptionsitem], optional
        Describes the market (purchasing) option for the instances. See Market Options below for details on attributes.
    instanceState : str, optional
        State of the instance. One of: pending, running, shutting-down, terminated, stopping, stopped. See Instance Lifecycle for more information.
    instanceType : str, optional
        Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance.
    ipv6AddressCount : float, optional
        Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet.
    ipv6Addresses : [str], optional
        Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface
    keyName : str, optional
        Key name of the Key Pair to use for the instance; which can be managed using the .
    launchTemplate : [InstancestatusatproviderLaunchtemplateitem], optional
        Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template. See Launch Template Specification below for more details.
    maintenanceOptions : [InstancestatusatproviderMaintenanceoptionsitem], optional
        Maintenance and recovery options for the instance. See Maintenance Options below for more details.
    metadataOptions : [InstancestatusatproviderMetadataoptionsitem], optional
        Customize the metadata options of the instance. See Metadata Options below for more details.
    monitoring : bool, optional
        If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)
    networkInterface : [InstancestatusatproviderNetworkinterfaceitem], optional
        Customize network interfaces to be attached at instance boot time. See Network Interfaces below for more details.
    outpostArn : str, optional
        ARN of the Outpost the instance is assigned to.
    passwordData : str, optional
        Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows. This attribute is only exported if get_password_data is true. Note that this encrypted value will be stored in the state file, as with all exported attributes. See GetPasswordData for more information.
    placementGroup : str, optional
        Placement Group to start the instance in. Conflicts with placement_group_id.
    placementGroupId : str, optional
        Placement Group ID to start the instance in. Conflicts with placement_group.
    placementPartitionNumber : float, optional
        Number of the partition the instance is in. Valid only if the  strategy argument is set to "partition".
    primaryNetworkInterface : [InstancestatusatproviderPrimarynetworkinterfaceitem], optional
        The primary network interface. See Primary Network Interface below.
    primaryNetworkInterfaceId : str, optional
        ID of the instance's primary network interface.
    privateDns : str, optional
        Private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC.
    privateDnsNameOptions : [InstancestatusatproviderPrivatednsnameoptionsitem], optional
        Options for the instance hostname. The default values are inherited from the subnet. See Private DNS Name Options below for more details.
    privateIp : str, optional
        Private IP address to associate with the instance in a VPC.
    publicDns : str, optional
        Public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC.
    publicIp : str, optional
        Public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use public_ip as this field will change after the EIP is attached.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    rootBlockDevice : [InstancestatusatproviderRootblockdeviceitem], optional
        Configuration block to customize details about the root block device of the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a list containing one object.
    secondaryPrivateIps : [str], optional
        List of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e., referenced in a network_interface block. Refer to the Elastic network interfaces documentation to see the maximum number of private IP addresses allowed per instance type.
    securityGroups : [str], optional
        List of security group names to associate with.
    sourceDestCheck : bool, optional
        Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true.
    spotInstanceRequestId : str, optional
        If the request is a Spot Instance request, the ID of the request.
    subnetId : str, optional
        VPC Subnet ID to launch in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    tenancy : str, optional
        Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command. Valid values are default, dedicated, and host.
    userData : str, optional
        User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate of the EC2 instance.
    userDataBase64 : str, optional
        Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate of the EC2 instance.
    userDataReplaceOnChange : bool, optional
        When used in combination with user_data or user_data_base64 will trigger a destroy and recreate of the EC2 instance when set to true. Defaults to false if not set.
    volumeTags : {str:str}, optional
        Map of tags to assign, at instance-creation time, to root and EBS volumes.
    vpcSecurityGroupIds : [str], optional
        List of security group IDs to associate with.
    """
    ami? : str
    arn? : str
    associatePublicIpAddress? : bool
    availabilityZone? : str
    capacityReservationSpecification? : [InstancestatusatproviderCapacityreservationspecificationitem]
    cpuOptions? : [InstancestatusatproviderCpuoptionsitem]
    creditSpecification? : [InstancestatusatproviderCreditspecificationitem]
    disableApiStop? : bool
    disableApiTermination? : bool
    ebsBlockDevice? : [InstancestatusatproviderEbsblockdeviceitem]
    ebsOptimized? : bool
    enablePrimaryIpv6? : bool
    enclaveOptions? : [InstancestatusatproviderEnclaveoptionsitem]
    ephemeralBlockDevice? : [InstancestatusatproviderEphemeralblockdeviceitem]
    forceDestroy? : bool
    getPasswordData? : bool
    hibernation? : bool
    hostId? : str
    hostResourceGroupArn? : str
    iamInstanceProfile? : str
    id? : str
    instanceInitiatedShutdownBehavior? : str
    instanceLifecycle? : str
    instanceMarketOptions? : [InstancestatusatproviderInstancemarketoptionsitem]
    instanceState? : str
    instanceType? : str
    ipv6AddressCount? : float
    ipv6Addresses? : [str]
    keyName? : str
    launchTemplate? : [InstancestatusatproviderLaunchtemplateitem]
    maintenanceOptions? : [InstancestatusatproviderMaintenanceoptionsitem]
    metadataOptions? : [InstancestatusatproviderMetadataoptionsitem]
    monitoring? : bool
    networkInterface? : [InstancestatusatproviderNetworkinterfaceitem]
    outpostArn? : str
    passwordData? : str
    placementGroup? : str
    placementGroupId? : str
    placementPartitionNumber? : float
    primaryNetworkInterface? : [InstancestatusatproviderPrimarynetworkinterfaceitem]
    primaryNetworkInterfaceId? : str
    privateDns? : str
    privateDnsNameOptions? : [InstancestatusatproviderPrivatednsnameoptionsitem]
    privateIp? : str
    publicDns? : str
    publicIp? : str
    region? : str
    rootBlockDevice? : [InstancestatusatproviderRootblockdeviceitem]
    secondaryPrivateIps? : [str]
    securityGroups? : [str]
    sourceDestCheck? : bool
    spotInstanceRequestId? : str
    subnetId? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    tenancy? : str
    userData? : str
    userDataBase64? : str
    userDataReplaceOnChange? : bool
    volumeTags? : {str:str}
    vpcSecurityGroupIds? : [str]

schema InstancestatusatproviderCapacityreservationspecificationitem:
    """
    InstancestatusatproviderCapacityreservationspecificationitem schema.

    Attributes
    ----------
    capacityReservationPreference : str, optional
        Indicates the instance's Capacity Reservation preferences. Can be "open" or "none". (Default: "open").
    capacityReservationTarget : [InstancestatusatprovidercapacityreservationspecificationitemCapacityreservationtargetitem], optional
        Information about the target Capacity Reservation. See Capacity Reservation Target below for more details.
    """
    capacityReservationPreference? : str
    capacityReservationTarget? : [InstancestatusatprovidercapacityreservationspecificationitemCapacityreservationtargetitem]

schema InstancestatusatprovidercapacityreservationspecificationitemCapacityreservationtargetitem:
    """
    InstancestatusatprovidercapacityreservationspecificationitemCapacityreservationtargetitem schema.

    Attributes
    ----------
    capacityReservationId : str, optional
        ID of the Capacity Reservation in which to run the instance.
    capacityReservationResourceGroupArn : str, optional
        ARN of the Capacity Reservation resource group in which to run the instance.
    """
    capacityReservationId? : str
    capacityReservationResourceGroupArn? : str

schema InstancestatusatproviderCpuoptionsitem:
    """
    InstancestatusatproviderCpuoptionsitem schema.

    Attributes
    ----------
    amdSevSnp : str, optional
        Indicates whether to enable the instance for AMD SEV-SNP. AMD SEV-SNP is supported with M6a, R6a, and C6a instance types only. Valid values are enabled and disabled.
    coreCount : float, optional
        Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API.
    threadsPerCore : float, optional
        If set to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set. See Optimizing CPU Options for more information.
    """
    amdSevSnp? : str
    coreCount? : float
    threadsPerCore? : float

schema InstancestatusatproviderCreditspecificationitem:
    """
    InstancestatusatproviderCreditspecificationitem schema.

    Attributes
    ----------
    cpuCredits : str, optional
        Credit option for CPU usage. Valid values include standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default.
    """
    cpuCredits? : str

schema InstancestatusatproviderEbsblockdeviceitem:
    """
    InstancestatusatproviderEbsblockdeviceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether the volume should be destroyed on instance termination. Defaults to true.
    deviceName : str, optional
        Name of the device to mount.
    encrypted : bool, optional
        Enables EBS encryption on the volume. Defaults to false. Cannot be used with snapshot_id. Must be configured to perform drift detection.
    iops : float, optional
        Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
    kmsKeyId : str, optional
        Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
    snapshotId : str, optional
        Snapshot ID to mount.
    tags : {str:str}, optional
        Map of tags to assign to the device.
    tagsAll : {str:str}, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    throughput : float, optional
        Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
    volumeId : str, optional
        ID of the volume. For example, the ID can be accessed like this, aws_instance.web.ebs_block_device.2.volume_id.
    volumeSize : float, optional
        Size of the volume in gibibytes (GiB).
    volumeType : str, optional
        Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2.
    """
    deleteOnTermination? : bool
    deviceName? : str
    encrypted? : bool
    iops? : float
    kmsKeyId? : str
    snapshotId? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    throughput? : float
    volumeId? : str
    volumeSize? : float
    volumeType? : str

schema InstancestatusatproviderEnclaveoptionsitem:
    """
    InstancestatusatproviderEnclaveoptionsitem schema.

    Attributes
    ----------
    enabled : bool, optional
        Whether Nitro Enclaves will be enabled on the instance. Defaults to false.
    """
    enabled? : bool

schema InstancestatusatproviderEphemeralblockdeviceitem:
    """
    InstancestatusatproviderEphemeralblockdeviceitem schema.

    Attributes
    ----------
    deviceName : str, optional
        Name of the block device to mount on the instance.
    noDevice : bool, optional
        Suppresses the specified device included in the AMI's block device mapping.
    virtualName : str, optional
        Instance Store Device Name (e.g., ephemeral0).
    """
    deviceName? : str
    noDevice? : bool
    virtualName? : str

schema InstancestatusatproviderInstancemarketoptionsitem:
    """
    InstancestatusatproviderInstancemarketoptionsitem schema.

    Attributes
    ----------
    marketType : str, optional
        Type of market for the instance. Valid values are spot and capacity-block. Defaults to spot. Required if spot_options is specified.
    spotOptions : [InstancestatusatproviderinstancemarketoptionsitemSpotoptionsitem], optional
        Block to configure the options for Spot Instances. See Spot Options below for details on attributes.
    """
    marketType? : str
    spotOptions? : [InstancestatusatproviderinstancemarketoptionsitemSpotoptionsitem]

schema InstancestatusatproviderinstancemarketoptionsitemSpotoptionsitem:
    """
    InstancestatusatproviderinstancemarketoptionsitemSpotoptionsitem schema.

    Attributes
    ----------
    instanceInterruptionBehavior : str, optional
        The behavior when a Spot Instance is interrupted. Valid values include hibernate, stop, terminate . The default is terminate.
    maxPrice : str, optional
        The maximum hourly price that you're willing to pay for a Spot Instance.
    spotInstanceType : str, optional
        The Spot Instance request type. Valid values include one-time, persistent. Persistent Spot Instance requests are only supported when the instance interruption behavior is either hibernate or stop. The default is one-time.
    validUntil : str, optional
        The end date of the request, in UTC format (YYYY-MM-DDTHH:MM:SSZ). Supported only for persistent requests.
    """
    instanceInterruptionBehavior? : str
    maxPrice? : str
    spotInstanceType? : str
    validUntil? : str

schema InstancestatusatproviderLaunchtemplateitem:
    """
    InstancestatusatproviderLaunchtemplateitem schema.

    Attributes
    ----------
    id : str, optional
        ID of the launch template. Conflicts with name.
    name : str, optional
        Name of the launch template. Conflicts with id.
    version : str, optional
        Template version. Can be a specific version number, $Latest or $Default. The default value is $Default.
    """
    id? : str
    name? : str
    version? : str

schema InstancestatusatproviderMaintenanceoptionsitem:
    """
    InstancestatusatproviderMaintenanceoptionsitem schema.

    Attributes
    ----------
    autoRecovery : str, optional
        Automatic recovery behavior of the Instance. Can be "default" or "disabled". See Recover your instance for more details.
    """
    autoRecovery? : str

schema InstancestatusatproviderMetadataoptionsitem:
    """
    InstancestatusatproviderMetadataoptionsitem schema.

    Attributes
    ----------
    httpEndpoint : str, optional
        Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled.
    httpProtocolIpv6 : str, optional
        Whether the IPv6 endpoint for the instance metadata service is enabled. Defaults to disabled.
    httpPutResponseHopLimit : float, optional
        Desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values are integer from 1 to 64. Defaults to 1.
    httpTokens : str, optional
        Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required.
    instanceMetadataTags : str, optional
        Enables or disables access to instance tags from the instance metadata service. Valid values include enabled or disabled. Defaults to disabled.
    """
    httpEndpoint? : str
    httpProtocolIpv6? : str
    httpPutResponseHopLimit? : float
    httpTokens? : str
    instanceMetadataTags? : str

schema InstancestatusatproviderNetworkinterfaceitem:
    """
    InstancestatusatproviderNetworkinterfaceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether or not to delete the network interface on instance termination. Defaults to false. Currently, the only valid value is false, as this is only supported when creating new network interfaces when launching an instance.
    deviceIndex : float, optional
        Integer index of the network interface attachment. Limited by instance type.
    networkCardIndex : float, optional
        Integer index of the network card. Limited by instance type. The default index is 0.
    networkInterfaceId : str, optional
        ID of the network interface to attach.
    """
    deleteOnTermination? : bool
    deviceIndex? : float
    networkCardIndex? : float
    networkInterfaceId? : str

schema InstancestatusatproviderPrimarynetworkinterfaceitem:
    """
    InstancestatusatproviderPrimarynetworkinterfaceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        (Read-Only) Whether the network interface will be deleted when the instance terminates.
    networkInterfaceId : str, optional
        ID of the network interface to attach.
    """
    deleteOnTermination? : bool
    networkInterfaceId? : str

schema InstancestatusatproviderPrivatednsnameoptionsitem:
    """
    InstancestatusatproviderPrivatednsnameoptionsitem schema.

    Attributes
    ----------
    enableResourceNameDnsARecord : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS A records.
    enableResourceNameDnsAaaaRecord : bool, optional
        Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records.
    hostnameType : str, optional
        Type of hostname for Amazon EC2 instances. For IPv4 only subnets, an instance DNS name must be based on the instance IPv4 address. For IPv6 native subnets, an instance DNS name must be based on the instance ID. For dual-stack subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name and resource-name.
    """
    enableResourceNameDnsARecord? : bool
    enableResourceNameDnsAaaaRecord? : bool
    hostnameType? : str

schema InstancestatusatproviderRootblockdeviceitem:
    """
    InstancestatusatproviderRootblockdeviceitem schema.

    Attributes
    ----------
    deleteOnTermination : bool, optional
        Whether the volume should be destroyed on instance termination. Defaults to true.
    deviceName : str, optional
        Device name, e.g., /dev/sdh or xvdh.
    encrypted : bool, optional
        Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection.
    iops : float, optional
        Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
    kmsKeyId : str, optional
        Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
    tags : {str:str}, optional
        Map of tags to assign to the device.
    tagsAll : {str:str}, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    throughput : float, optional
        Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
    volumeId : str, optional
        ID of the volume. For example, the ID can be accessed like this, aws_instance.web.root_block_device.0.volume_id.
    volumeSize : float, optional
        Size of the volume in gibibytes (GiB).
    volumeType : str, optional
        Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to the volume type that the AMI uses.
    """
    deleteOnTermination? : bool
    deviceName? : str
    encrypted? : bool
    iops? : float
    kmsKeyId? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    throughput? : float
    volumeId? : str
    volumeSize? : float
    volumeType? : str

schema InstancestatusConditionsitem:
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