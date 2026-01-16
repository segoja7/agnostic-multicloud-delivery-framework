"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Flowlog:
    """
    FlowLog is the Schema for the FlowLogs API. Provides a VPC/Subnet/ENI Flow Log

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
    spec : FlowlogSpec, required
        FlowLogSpec defines the desired state of FlowLog
    status : FlowlogStatus, optional
        FlowLogStatus defines the observed state of FlowLog.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "FlowLog"
    metadata? : any
    spec : FlowlogSpec
    status? : FlowlogStatus

schema FlowlogSpec:
    """
    FlowLogSpec defines the desired state of FlowLog

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
    forProvider : FlowlogspecForprovider, required
        No description available.
    initProvider : FlowlogspecInitprovider, optional
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
    providerConfigRef : FlowlogspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : FlowlogspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : FlowlogspecForprovider
    initProvider? : FlowlogspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : FlowlogspecProviderconfigref
    writeConnectionSecretToRef? : FlowlogspecWriteconnectionsecrettoref

schema FlowlogspecForprovider:
    """
    FlowlogspecForprovider schema.

    Attributes
    ----------
    deliverCrossAccountRole : str, optional
        ARN of the IAM role in the destination account used for cross-account delivery of flow logs.
    deliverCrossAccountRoleRef : FlowlogspecforproviderDelivercrossaccountroleref, optional
        Reference to a Role in iam to populate deliverCrossAccountRole.
    deliverCrossAccountRoleSelector : FlowlogspecforproviderDelivercrossaccountroleselector, optional
        Selector for a Role in iam to populate deliverCrossAccountRole.
    destinationOptions : [FlowlogspecforproviderDestinationoptionsitem], optional
        Describes the destination options for a flow log. More details below.
    eniId : str, optional
        Elastic Network Interface ID to attach to.
    iamRoleArn : str, optional
        ARN of the IAM role used to post flow logs. Corresponds to DeliverLogsPermissionArn in the AWS API.
    iamRoleArnRef : FlowlogspecforproviderIamrolearnref, optional
        Reference to a Role in iam to populate iamRoleArn.
    iamRoleArnSelector : FlowlogspecforproviderIamrolearnselector, optional
        Selector for a Role in iam to populate iamRoleArn.
    logDestination : str, optional
        ARN of the logging destination.
    logDestinationRef : FlowlogspecforproviderLogdestinationref, optional
        Reference to a Group in cloudwatchlogs to populate logDestination.
    logDestinationSelector : FlowlogspecforproviderLogdestinationselector, optional
        Selector for a Group in cloudwatchlogs to populate logDestination.
    logDestinationType : str, optional
        Logging destination type. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs.
    logFormat : str, optional
        The fields to include in the flow log record. Accepted format example: "$${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport}".
    maxAggregationInterval : float, optional
        The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record.
        Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes). Default: 600.
        When transit_gateway_id or transit_gateway_attachment_id is specified, max_aggregation_interval must be 60 seconds (1 minute).
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    subnetId : str, optional
        Subnet ID to attach to.
    subnetIdRef : FlowlogspecforproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : FlowlogspecforproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    tags : {str:str}, optional
        Key-value map of resource tags.
    trafficType : str, optional
        The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL.
    transitGatewayAttachmentId : str, optional
        Transit Gateway Attachment ID to attach to.
    transitGatewayId : str, optional
        Transit Gateway ID to attach to.
    vpcId : str, optional
        VPC ID to attach to.
    vpcIdRef : FlowlogspecforproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : FlowlogspecforproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    deliverCrossAccountRole? : str
    deliverCrossAccountRoleRef? : FlowlogspecforproviderDelivercrossaccountroleref
    deliverCrossAccountRoleSelector? : FlowlogspecforproviderDelivercrossaccountroleselector
    destinationOptions? : [FlowlogspecforproviderDestinationoptionsitem]
    eniId? : str
    iamRoleArn? : str
    iamRoleArnRef? : FlowlogspecforproviderIamrolearnref
    iamRoleArnSelector? : FlowlogspecforproviderIamrolearnselector
    logDestination? : str
    logDestinationRef? : FlowlogspecforproviderLogdestinationref
    logDestinationSelector? : FlowlogspecforproviderLogdestinationselector
    logDestinationType? : str
    logFormat? : str
    maxAggregationInterval? : float
    region : str
    subnetId? : str
    subnetIdRef? : FlowlogspecforproviderSubnetidref
    subnetIdSelector? : FlowlogspecforproviderSubnetidselector
    tags? : {str:str}
    trafficType? : str
    transitGatewayAttachmentId? : str
    transitGatewayId? : str
    vpcId? : str
    vpcIdRef? : FlowlogspecforproviderVpcidref
    vpcIdSelector? : FlowlogspecforproviderVpcidselector

schema FlowlogspecforproviderDelivercrossaccountroleref:
    """
    Reference to a Role in iam to populate deliverCrossAccountRole.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecforproviderdelivercrossaccountrolerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecforproviderdelivercrossaccountrolerefPolicy

schema FlowlogspecforproviderdelivercrossaccountrolerefPolicy:
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

schema FlowlogspecforproviderDelivercrossaccountroleselector:
    """
    Selector for a Role in iam to populate deliverCrossAccountRole.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecforproviderdelivercrossaccountroleselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecforproviderdelivercrossaccountroleselectorPolicy

schema FlowlogspecforproviderdelivercrossaccountroleselectorPolicy:
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

schema FlowlogspecforproviderDestinationoptionsitem:
    """
    FlowlogspecforproviderDestinationoptionsitem schema.

    Attributes
    ----------
    fileFormat : str, optional
        File format for the flow log. Default value: plain-text. Valid values: plain-text, parquet.
    hiveCompatiblePartitions : bool, optional
        Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3. Default value: false.
    perHourPartition : bool, optional
        Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries. Default value: false.
    """
    fileFormat? : str
    hiveCompatiblePartitions? : bool
    perHourPartition? : bool

schema FlowlogspecforproviderIamrolearnref:
    """
    Reference to a Role in iam to populate iamRoleArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecforprovideriamrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecforprovideriamrolearnrefPolicy

schema FlowlogspecforprovideriamrolearnrefPolicy:
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

schema FlowlogspecforproviderIamrolearnselector:
    """
    Selector for a Role in iam to populate iamRoleArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecforprovideriamrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecforprovideriamrolearnselectorPolicy

schema FlowlogspecforprovideriamrolearnselectorPolicy:
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

schema FlowlogspecforproviderLogdestinationref:
    """
    Reference to a Group in cloudwatchlogs to populate logDestination.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecforproviderlogdestinationrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecforproviderlogdestinationrefPolicy

schema FlowlogspecforproviderlogdestinationrefPolicy:
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

schema FlowlogspecforproviderLogdestinationselector:
    """
    Selector for a Group in cloudwatchlogs to populate logDestination.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecforproviderlogdestinationselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecforproviderlogdestinationselectorPolicy

schema FlowlogspecforproviderlogdestinationselectorPolicy:
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

schema FlowlogspecforproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecforprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecforprovidersubnetidrefPolicy

schema FlowlogspecforprovidersubnetidrefPolicy:
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

schema FlowlogspecforproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecforprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecforprovidersubnetidselectorPolicy

schema FlowlogspecforprovidersubnetidselectorPolicy:
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

schema FlowlogspecforproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecforprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecforprovidervpcidrefPolicy

schema FlowlogspecforprovidervpcidrefPolicy:
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

schema FlowlogspecforproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecforprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecforprovidervpcidselectorPolicy

schema FlowlogspecforprovidervpcidselectorPolicy:
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

schema FlowlogspecInitprovider:
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
    deliverCrossAccountRole : str, optional
        ARN of the IAM role in the destination account used for cross-account delivery of flow logs.
    deliverCrossAccountRoleRef : FlowlogspecinitproviderDelivercrossaccountroleref, optional
        Reference to a Role in iam to populate deliverCrossAccountRole.
    deliverCrossAccountRoleSelector : FlowlogspecinitproviderDelivercrossaccountroleselector, optional
        Selector for a Role in iam to populate deliverCrossAccountRole.
    destinationOptions : [FlowlogspecinitproviderDestinationoptionsitem], optional
        Describes the destination options for a flow log. More details below.
    eniId : str, optional
        Elastic Network Interface ID to attach to.
    iamRoleArn : str, optional
        ARN of the IAM role used to post flow logs. Corresponds to DeliverLogsPermissionArn in the AWS API.
    iamRoleArnRef : FlowlogspecinitproviderIamrolearnref, optional
        Reference to a Role in iam to populate iamRoleArn.
    iamRoleArnSelector : FlowlogspecinitproviderIamrolearnselector, optional
        Selector for a Role in iam to populate iamRoleArn.
    logDestination : str, optional
        ARN of the logging destination.
    logDestinationRef : FlowlogspecinitproviderLogdestinationref, optional
        Reference to a Group in cloudwatchlogs to populate logDestination.
    logDestinationSelector : FlowlogspecinitproviderLogdestinationselector, optional
        Selector for a Group in cloudwatchlogs to populate logDestination.
    logDestinationType : str, optional
        Logging destination type. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs.
    logFormat : str, optional
        The fields to include in the flow log record. Accepted format example: "$${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport}".
    maxAggregationInterval : float, optional
        The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record.
        Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes). Default: 600.
        When transit_gateway_id or transit_gateway_attachment_id is specified, max_aggregation_interval must be 60 seconds (1 minute).
    subnetId : str, optional
        Subnet ID to attach to.
    subnetIdRef : FlowlogspecinitproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : FlowlogspecinitproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    tags : {str:str}, optional
        Key-value map of resource tags.
    trafficType : str, optional
        The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL.
    transitGatewayAttachmentId : str, optional
        Transit Gateway Attachment ID to attach to.
    transitGatewayId : str, optional
        Transit Gateway ID to attach to.
    vpcId : str, optional
        VPC ID to attach to.
    vpcIdRef : FlowlogspecinitproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : FlowlogspecinitproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    deliverCrossAccountRole? : str
    deliverCrossAccountRoleRef? : FlowlogspecinitproviderDelivercrossaccountroleref
    deliverCrossAccountRoleSelector? : FlowlogspecinitproviderDelivercrossaccountroleselector
    destinationOptions? : [FlowlogspecinitproviderDestinationoptionsitem]
    eniId? : str
    iamRoleArn? : str
    iamRoleArnRef? : FlowlogspecinitproviderIamrolearnref
    iamRoleArnSelector? : FlowlogspecinitproviderIamrolearnselector
    logDestination? : str
    logDestinationRef? : FlowlogspecinitproviderLogdestinationref
    logDestinationSelector? : FlowlogspecinitproviderLogdestinationselector
    logDestinationType? : str
    logFormat? : str
    maxAggregationInterval? : float
    subnetId? : str
    subnetIdRef? : FlowlogspecinitproviderSubnetidref
    subnetIdSelector? : FlowlogspecinitproviderSubnetidselector
    tags? : {str:str}
    trafficType? : str
    transitGatewayAttachmentId? : str
    transitGatewayId? : str
    vpcId? : str
    vpcIdRef? : FlowlogspecinitproviderVpcidref
    vpcIdSelector? : FlowlogspecinitproviderVpcidselector

schema FlowlogspecinitproviderDelivercrossaccountroleref:
    """
    Reference to a Role in iam to populate deliverCrossAccountRole.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecinitproviderdelivercrossaccountrolerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecinitproviderdelivercrossaccountrolerefPolicy

schema FlowlogspecinitproviderdelivercrossaccountrolerefPolicy:
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

schema FlowlogspecinitproviderDelivercrossaccountroleselector:
    """
    Selector for a Role in iam to populate deliverCrossAccountRole.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecinitproviderdelivercrossaccountroleselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecinitproviderdelivercrossaccountroleselectorPolicy

schema FlowlogspecinitproviderdelivercrossaccountroleselectorPolicy:
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

schema FlowlogspecinitproviderDestinationoptionsitem:
    """
    FlowlogspecinitproviderDestinationoptionsitem schema.

    Attributes
    ----------
    fileFormat : str, optional
        File format for the flow log. Default value: plain-text. Valid values: plain-text, parquet.
    hiveCompatiblePartitions : bool, optional
        Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3. Default value: false.
    perHourPartition : bool, optional
        Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries. Default value: false.
    """
    fileFormat? : str
    hiveCompatiblePartitions? : bool
    perHourPartition? : bool

schema FlowlogspecinitproviderIamrolearnref:
    """
    Reference to a Role in iam to populate iamRoleArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecinitprovideriamrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecinitprovideriamrolearnrefPolicy

schema FlowlogspecinitprovideriamrolearnrefPolicy:
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

schema FlowlogspecinitproviderIamrolearnselector:
    """
    Selector for a Role in iam to populate iamRoleArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecinitprovideriamrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecinitprovideriamrolearnselectorPolicy

schema FlowlogspecinitprovideriamrolearnselectorPolicy:
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

schema FlowlogspecinitproviderLogdestinationref:
    """
    Reference to a Group in cloudwatchlogs to populate logDestination.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecinitproviderlogdestinationrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecinitproviderlogdestinationrefPolicy

schema FlowlogspecinitproviderlogdestinationrefPolicy:
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

schema FlowlogspecinitproviderLogdestinationselector:
    """
    Selector for a Group in cloudwatchlogs to populate logDestination.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecinitproviderlogdestinationselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecinitproviderlogdestinationselectorPolicy

schema FlowlogspecinitproviderlogdestinationselectorPolicy:
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

schema FlowlogspecinitproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecinitprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecinitprovidersubnetidrefPolicy

schema FlowlogspecinitprovidersubnetidrefPolicy:
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

schema FlowlogspecinitproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecinitprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecinitprovidersubnetidselectorPolicy

schema FlowlogspecinitprovidersubnetidselectorPolicy:
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

schema FlowlogspecinitproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecinitprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecinitprovidervpcidrefPolicy

schema FlowlogspecinitprovidervpcidrefPolicy:
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

schema FlowlogspecinitproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : FlowlogspecinitprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : FlowlogspecinitprovidervpcidselectorPolicy

schema FlowlogspecinitprovidervpcidselectorPolicy:
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

schema FlowlogspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : FlowlogspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : FlowlogspecproviderconfigrefPolicy

schema FlowlogspecproviderconfigrefPolicy:
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

schema FlowlogspecWriteconnectionsecrettoref:
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

schema FlowlogStatus:
    """
    FlowLogStatus defines the observed state of FlowLog.

    Attributes
    ----------
    atProvider : FlowlogstatusAtprovider, optional
        No description available.
    conditions : [FlowlogstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : FlowlogstatusAtprovider
    conditions? : [FlowlogstatusConditionsitem]
    observedGeneration? : int

schema FlowlogstatusAtprovider:
    """
    FlowlogstatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        ARN of the Flow Log.
    deliverCrossAccountRole : str, optional
        ARN of the IAM role in the destination account used for cross-account delivery of flow logs.
    destinationOptions : [FlowlogstatusatproviderDestinationoptionsitem], optional
        Describes the destination options for a flow log. More details below.
    eniId : str, optional
        Elastic Network Interface ID to attach to.
    iamRoleArn : str, optional
        ARN of the IAM role used to post flow logs. Corresponds to DeliverLogsPermissionArn in the AWS API.
    id : str, optional
        Flow Log ID.
    logDestination : str, optional
        ARN of the logging destination.
    logDestinationType : str, optional
        Logging destination type. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs.
    logFormat : str, optional
        The fields to include in the flow log record. Accepted format example: "$${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport}".
    maxAggregationInterval : float, optional
        The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record.
        Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes). Default: 600.
        When transit_gateway_id or transit_gateway_attachment_id is specified, max_aggregation_interval must be 60 seconds (1 minute).
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    subnetId : str, optional
        Subnet ID to attach to.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    trafficType : str, optional
        The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL.
    transitGatewayAttachmentId : str, optional
        Transit Gateway Attachment ID to attach to.
    transitGatewayId : str, optional
        Transit Gateway ID to attach to.
    vpcId : str, optional
        VPC ID to attach to.
    """
    arn? : str
    deliverCrossAccountRole? : str
    destinationOptions? : [FlowlogstatusatproviderDestinationoptionsitem]
    eniId? : str
    iamRoleArn? : str
    id? : str
    logDestination? : str
    logDestinationType? : str
    logFormat? : str
    maxAggregationInterval? : float
    region? : str
    subnetId? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    trafficType? : str
    transitGatewayAttachmentId? : str
    transitGatewayId? : str
    vpcId? : str

schema FlowlogstatusatproviderDestinationoptionsitem:
    """
    FlowlogstatusatproviderDestinationoptionsitem schema.

    Attributes
    ----------
    fileFormat : str, optional
        File format for the flow log. Default value: plain-text. Valid values: plain-text, parquet.
    hiveCompatiblePartitions : bool, optional
        Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3. Default value: false.
    perHourPartition : bool, optional
        Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries. Default value: false.
    """
    fileFormat? : str
    hiveCompatiblePartitions? : bool
    perHourPartition? : bool

schema FlowlogstatusConditionsitem:
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