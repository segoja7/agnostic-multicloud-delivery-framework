"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Securitygroup:
    """
    SecurityGroup is the Schema for the SecurityGroups API. Provides a security group resource.

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
    spec : SecuritygroupSpec, required
        SecurityGroupSpec defines the desired state of SecurityGroup
    status : SecuritygroupStatus, optional
        SecurityGroupStatus defines the observed state of SecurityGroup.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "SecurityGroup"
    metadata? : any
    spec : SecuritygroupSpec
    status? : SecuritygroupStatus

schema SecuritygroupSpec:
    """
    SecurityGroupSpec defines the desired state of SecurityGroup

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
    forProvider : SecuritygroupspecForprovider, required
        No description available.
    initProvider : SecuritygroupspecInitprovider, optional
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
    providerConfigRef : SecuritygroupspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : SecuritygroupspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : SecuritygroupspecForprovider
    initProvider? : SecuritygroupspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : SecuritygroupspecProviderconfigref
    writeConnectionSecretToRef? : SecuritygroupspecWriteconnectionsecrettoref

schema SecuritygroupspecForprovider:
    """
    SecuritygroupspecForprovider schema.

    Attributes
    ----------
    description : str, optional
        Security group description. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags.
    name : str, optional
        Name of the security group.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    revokeRulesOnDelete : bool, optional
        This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false.
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcId : str, optional
        VPC ID. Defaults to the region's default VPC.
    vpcIdRef : SecuritygroupspecforproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : SecuritygroupspecforproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    description? : str
    name? : str
    region : str
    revokeRulesOnDelete? : bool
    tags? : {str:str}
    vpcId? : str
    vpcIdRef? : SecuritygroupspecforproviderVpcidref
    vpcIdSelector? : SecuritygroupspecforproviderVpcidselector

schema SecuritygroupspecforproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygroupspecforprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygroupspecforprovidervpcidrefPolicy

schema SecuritygroupspecforprovidervpcidrefPolicy:
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

schema SecuritygroupspecforproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygroupspecforprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygroupspecforprovidervpcidselectorPolicy

schema SecuritygroupspecforprovidervpcidselectorPolicy:
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

schema SecuritygroupspecInitprovider:
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
    description : str, optional
        Security group description. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags.
    name : str, optional
        Name of the security group.
    revokeRulesOnDelete : bool, optional
        This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false.
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcId : str, optional
        VPC ID. Defaults to the region's default VPC.
    vpcIdRef : SecuritygroupspecinitproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : SecuritygroupspecinitproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    description? : str
    name? : str
    revokeRulesOnDelete? : bool
    tags? : {str:str}
    vpcId? : str
    vpcIdRef? : SecuritygroupspecinitproviderVpcidref
    vpcIdSelector? : SecuritygroupspecinitproviderVpcidselector

schema SecuritygroupspecinitproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygroupspecinitprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygroupspecinitprovidervpcidrefPolicy

schema SecuritygroupspecinitprovidervpcidrefPolicy:
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

schema SecuritygroupspecinitproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygroupspecinitprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygroupspecinitprovidervpcidselectorPolicy

schema SecuritygroupspecinitprovidervpcidselectorPolicy:
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

schema SecuritygroupspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygroupspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygroupspecproviderconfigrefPolicy

schema SecuritygroupspecproviderconfigrefPolicy:
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

schema SecuritygroupspecWriteconnectionsecrettoref:
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

schema SecuritygroupStatus:
    """
    SecurityGroupStatus defines the observed state of SecurityGroup.

    Attributes
    ----------
    atProvider : SecuritygroupstatusAtprovider, optional
        No description available.
    conditions : [SecuritygroupstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : SecuritygroupstatusAtprovider
    conditions? : [SecuritygroupstatusConditionsitem]
    observedGeneration? : int

schema SecuritygroupstatusAtprovider:
    """
    SecuritygroupstatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        ARN of the security group.
    description : str, optional
        Security group description. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags.
    egress : [SecuritygroupstatusatproviderEgressitem], optional
        Configuration block for egress rules. Can be specified multiple times for each egress rule. Each egress block supports fields documented below. This argument is processed in attribute-as-blocks mode.
    id : str, optional
        ID of the security group.
    ingress : [SecuritygroupstatusatproviderIngressitem], optional
        Configuration block for ingress rules. Can be specified multiple times for each ingress rule. Each ingress block supports fields documented below. This argument is processed in attribute-as-blocks mode.
    name : str, optional
        Name of the security group.
    ownerId : str, optional
        Owner ID.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    revokeRulesOnDelete : bool, optional
        This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    vpcId : str, optional
        VPC ID. Defaults to the region's default VPC.
    """
    arn? : str
    description? : str
    egress? : [SecuritygroupstatusatproviderEgressitem]
    id? : str
    ingress? : [SecuritygroupstatusatproviderIngressitem]
    name? : str
    ownerId? : str
    region? : str
    revokeRulesOnDelete? : bool
    tags? : {str:str}
    tagsAll? : {str:str}
    vpcId? : str

schema SecuritygroupstatusatproviderEgressitem:
    """
    SecuritygroupstatusatproviderEgressitem schema.

    Attributes
    ----------
    cidrBlocks : [str], optional
        List of CIDR blocks.
    description : str, optional
        Security group description. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags.
    fromPort : float, optional
        Start port (or ICMP type number if protocol is icmp or icmpv6).
    ipv6CidrBlocks : [str], optional
        List of IPv6 CIDR blocks.
    prefixListIds : [str], optional
        List of Prefix List IDs.
    protocol : str, optional
        Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument on the IpPermission API reference.12.
    securityGroups : [str], optional
        List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
    self : bool, optional
        Whether the security group itself will be added as a source to this ingress rule.
    toPort : float, optional
        End range port (or ICMP code if protocol is icmp).
    """
    cidrBlocks? : [str]
    description? : str
    fromPort? : float
    ipv6CidrBlocks? : [str]
    prefixListIds? : [str]
    protocol? : str
    securityGroups? : [str]
    self? : bool
    toPort? : float

schema SecuritygroupstatusatproviderIngressitem:
    """
    SecuritygroupstatusatproviderIngressitem schema.

    Attributes
    ----------
    cidrBlocks : [str], optional
        List of CIDR blocks.
    description : str, optional
        Security group description. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags.
    fromPort : float, optional
        Start port (or ICMP type number if protocol is icmp or icmpv6).
    ipv6CidrBlocks : [str], optional
        List of IPv6 CIDR blocks.
    prefixListIds : [str], optional
        List of Prefix List IDs.
    protocol : str, optional
        Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument on the IpPermission API reference.12.
    securityGroups : [str], optional
        List of security groups. A group name can be used relative to the default VPC. Otherwise, group ID.
    self : bool, optional
        Whether the security group itself will be added as a source to this ingress rule.
    toPort : float, optional
        End range port (or ICMP code if protocol is icmp).
    """
    cidrBlocks? : [str]
    description? : str
    fromPort? : float
    ipv6CidrBlocks? : [str]
    prefixListIds? : [str]
    protocol? : str
    securityGroups? : [str]
    self? : bool
    toPort? : float

schema SecuritygroupstatusConditionsitem:
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