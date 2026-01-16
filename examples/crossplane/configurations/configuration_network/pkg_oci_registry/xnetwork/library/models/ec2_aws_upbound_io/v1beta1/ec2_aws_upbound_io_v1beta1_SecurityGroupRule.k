"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Securitygrouprule:
    """
    SecurityGroupRule is the Schema for the SecurityGroupRules API. Provides an security group rule resource.

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
    spec : SecuritygroupruleSpec, required
        SecurityGroupRuleSpec defines the desired state of SecurityGroupRule
    status : SecuritygroupruleStatus, optional
        SecurityGroupRuleStatus defines the observed state of SecurityGroupRule.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "SecurityGroupRule"
    metadata? : any
    spec : SecuritygroupruleSpec
    status? : SecuritygroupruleStatus

schema SecuritygroupruleSpec:
    """
    SecurityGroupRuleSpec defines the desired state of SecurityGroupRule

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
    forProvider : SecuritygrouprulespecForprovider, required
        No description available.
    initProvider : SecuritygrouprulespecInitprovider, optional
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
    providerConfigRef : SecuritygrouprulespecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : SecuritygrouprulespecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : SecuritygrouprulespecForprovider
    initProvider? : SecuritygrouprulespecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : SecuritygrouprulespecProviderconfigref
    writeConnectionSecretToRef? : SecuritygrouprulespecWriteconnectionsecrettoref

schema SecuritygrouprulespecForprovider:
    """
    SecuritygrouprulespecForprovider schema.

    Attributes
    ----------
    cidrBlocks : [str], optional
        List of CIDR blocks. Cannot be specified with source_security_group_id or self.
    cidrBlocksRefs : [SecuritygrouprulespecforproviderCidrblocksrefsitem], optional
        References to VPC in ec2 to populate cidrBlocks.
    cidrBlocksSelector : SecuritygrouprulespecforproviderCidrblocksselector, optional
        Selector for a list of VPC in ec2 to populate cidrBlocks.
    description : str, optional
        Description of the rule.
    fromPort : float, optional
        Start port (or ICMP type number if protocol is "icmp" or "icmpv6").
    ipv6CidrBlocks : [str], optional
        List of IPv6 CIDR blocks. Cannot be specified with source_security_group_id or self.
    ipv6CidrBlocksRefs : [SecuritygrouprulespecforproviderIpv6Cidrblocksrefsitem], optional
        References to VPC in ec2 to populate ipv6CidrBlocks.
    ipv6CidrBlocksSelector : SecuritygrouprulespecforproviderIpv6Cidrblocksselector, optional
        Selector for a list of VPC in ec2 to populate ipv6CidrBlocks.
    prefixListIdRefs : [SecuritygrouprulespecforproviderPrefixlistidrefsitem], optional
        References to ManagedPrefixList in ec2 to populate prefixListIds.
    prefixListIdSelector : SecuritygrouprulespecforproviderPrefixlistidselector, optional
        Selector for a list of ManagedPrefixList in ec2 to populate prefixListIds.
    prefixListIds : [str], optional
        List of Prefix List IDs.
    protocol : str, optional
        Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    securityGroupId : str, optional
        Security group to apply this rule to.
    securityGroupIdRef : SecuritygrouprulespecforproviderSecuritygroupidref, optional
        Reference to a SecurityGroup in ec2 to populate securityGroupId.
    securityGroupIdSelector : SecuritygrouprulespecforproviderSecuritygroupidselector, optional
        Selector for a SecurityGroup in ec2 to populate securityGroupId.
    self : bool, optional
        Whether the security group itself will be added as a source to this ingress rule. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or source_security_group_id.
    sourceSecurityGroupId : str, optional
        Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self.
    sourceSecurityGroupIdRef : SecuritygrouprulespecforproviderSourcesecuritygroupidref, optional
        Reference to a SecurityGroup in ec2 to populate sourceSecurityGroupId.
    sourceSecurityGroupIdSelector : SecuritygrouprulespecforproviderSourcesecuritygroupidselector, optional
        Selector for a SecurityGroup in ec2 to populate sourceSecurityGroupId.
    toPort : float, optional
        End port (or ICMP code if protocol is "icmp").
    type : str, optional
        Type of rule being created. Valid options are ingress (inbound)
        or egress (outbound).
    """
    cidrBlocks? : [str]
    cidrBlocksRefs? : [SecuritygrouprulespecforproviderCidrblocksrefsitem]
    cidrBlocksSelector? : SecuritygrouprulespecforproviderCidrblocksselector
    description? : str
    fromPort? : float
    ipv6CidrBlocks? : [str]
    ipv6CidrBlocksRefs? : [SecuritygrouprulespecforproviderIpv6Cidrblocksrefsitem]
    ipv6CidrBlocksSelector? : SecuritygrouprulespecforproviderIpv6Cidrblocksselector
    prefixListIdRefs? : [SecuritygrouprulespecforproviderPrefixlistidrefsitem]
    prefixListIdSelector? : SecuritygrouprulespecforproviderPrefixlistidselector
    prefixListIds? : [str]
    protocol? : str
    region : str
    securityGroupId? : str
    securityGroupIdRef? : SecuritygrouprulespecforproviderSecuritygroupidref
    securityGroupIdSelector? : SecuritygrouprulespecforproviderSecuritygroupidselector
    self? : bool
    sourceSecurityGroupId? : str
    sourceSecurityGroupIdRef? : SecuritygrouprulespecforproviderSourcesecuritygroupidref
    sourceSecurityGroupIdSelector? : SecuritygrouprulespecforproviderSourcesecuritygroupidselector
    toPort? : float
    type? : str

schema SecuritygrouprulespecforproviderCidrblocksrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecforprovidercidrblocksrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecforprovidercidrblocksrefsitemPolicy

schema SecuritygrouprulespecforprovidercidrblocksrefsitemPolicy:
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

schema SecuritygrouprulespecforproviderCidrblocksselector:
    """
    Selector for a list of VPC in ec2 to populate cidrBlocks.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecforprovidercidrblocksselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecforprovidercidrblocksselectorPolicy

schema SecuritygrouprulespecforprovidercidrblocksselectorPolicy:
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

schema SecuritygrouprulespecforproviderIpv6Cidrblocksrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : Securitygrouprulespecforprovideripv6CidrblocksrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : Securitygrouprulespecforprovideripv6CidrblocksrefsitemPolicy

schema Securitygrouprulespecforprovideripv6CidrblocksrefsitemPolicy:
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

schema SecuritygrouprulespecforproviderIpv6Cidrblocksselector:
    """
    Selector for a list of VPC in ec2 to populate ipv6CidrBlocks.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : Securitygrouprulespecforprovideripv6CidrblocksselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : Securitygrouprulespecforprovideripv6CidrblocksselectorPolicy

schema Securitygrouprulespecforprovideripv6CidrblocksselectorPolicy:
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

schema SecuritygrouprulespecforproviderPrefixlistidrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecforproviderprefixlistidrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecforproviderprefixlistidrefsitemPolicy

schema SecuritygrouprulespecforproviderprefixlistidrefsitemPolicy:
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

schema SecuritygrouprulespecforproviderPrefixlistidselector:
    """
    Selector for a list of ManagedPrefixList in ec2 to populate prefixListIds.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecforproviderprefixlistidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecforproviderprefixlistidselectorPolicy

schema SecuritygrouprulespecforproviderprefixlistidselectorPolicy:
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

schema SecuritygrouprulespecforproviderSecuritygroupidref:
    """
    Reference to a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecforprovidersecuritygroupidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecforprovidersecuritygroupidrefPolicy

schema SecuritygrouprulespecforprovidersecuritygroupidrefPolicy:
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

schema SecuritygrouprulespecforproviderSecuritygroupidselector:
    """
    Selector for a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecforprovidersecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecforprovidersecuritygroupidselectorPolicy

schema SecuritygrouprulespecforprovidersecuritygroupidselectorPolicy:
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

schema SecuritygrouprulespecforproviderSourcesecuritygroupidref:
    """
    Reference to a SecurityGroup in ec2 to populate sourceSecurityGroupId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecforprovidersourcesecuritygroupidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecforprovidersourcesecuritygroupidrefPolicy

schema SecuritygrouprulespecforprovidersourcesecuritygroupidrefPolicy:
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

schema SecuritygrouprulespecforproviderSourcesecuritygroupidselector:
    """
    Selector for a SecurityGroup in ec2 to populate sourceSecurityGroupId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecforprovidersourcesecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecforprovidersourcesecuritygroupidselectorPolicy

schema SecuritygrouprulespecforprovidersourcesecuritygroupidselectorPolicy:
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

schema SecuritygrouprulespecInitprovider:
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
    cidrBlocks : [str], optional
        List of CIDR blocks. Cannot be specified with source_security_group_id or self.
    cidrBlocksRefs : [SecuritygrouprulespecinitproviderCidrblocksrefsitem], optional
        References to VPC in ec2 to populate cidrBlocks.
    cidrBlocksSelector : SecuritygrouprulespecinitproviderCidrblocksselector, optional
        Selector for a list of VPC in ec2 to populate cidrBlocks.
    description : str, optional
        Description of the rule.
    fromPort : float, optional
        Start port (or ICMP type number if protocol is "icmp" or "icmpv6").
    ipv6CidrBlocks : [str], optional
        List of IPv6 CIDR blocks. Cannot be specified with source_security_group_id or self.
    ipv6CidrBlocksRefs : [SecuritygrouprulespecinitproviderIpv6Cidrblocksrefsitem], optional
        References to VPC in ec2 to populate ipv6CidrBlocks.
    ipv6CidrBlocksSelector : SecuritygrouprulespecinitproviderIpv6Cidrblocksselector, optional
        Selector for a list of VPC in ec2 to populate ipv6CidrBlocks.
    prefixListIdRefs : [SecuritygrouprulespecinitproviderPrefixlistidrefsitem], optional
        References to ManagedPrefixList in ec2 to populate prefixListIds.
    prefixListIdSelector : SecuritygrouprulespecinitproviderPrefixlistidselector, optional
        Selector for a list of ManagedPrefixList in ec2 to populate prefixListIds.
    prefixListIds : [str], optional
        List of Prefix List IDs.
    protocol : str, optional
        Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number
    securityGroupId : str, optional
        Security group to apply this rule to.
    securityGroupIdRef : SecuritygrouprulespecinitproviderSecuritygroupidref, optional
        Reference to a SecurityGroup in ec2 to populate securityGroupId.
    securityGroupIdSelector : SecuritygrouprulespecinitproviderSecuritygroupidselector, optional
        Selector for a SecurityGroup in ec2 to populate securityGroupId.
    self : bool, optional
        Whether the security group itself will be added as a source to this ingress rule. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or source_security_group_id.
    sourceSecurityGroupId : str, optional
        Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self.
    sourceSecurityGroupIdRef : SecuritygrouprulespecinitproviderSourcesecuritygroupidref, optional
        Reference to a SecurityGroup in ec2 to populate sourceSecurityGroupId.
    sourceSecurityGroupIdSelector : SecuritygrouprulespecinitproviderSourcesecuritygroupidselector, optional
        Selector for a SecurityGroup in ec2 to populate sourceSecurityGroupId.
    toPort : float, optional
        End port (or ICMP code if protocol is "icmp").
    type : str, optional
        Type of rule being created. Valid options are ingress (inbound)
        or egress (outbound).
    """
    cidrBlocks? : [str]
    cidrBlocksRefs? : [SecuritygrouprulespecinitproviderCidrblocksrefsitem]
    cidrBlocksSelector? : SecuritygrouprulespecinitproviderCidrblocksselector
    description? : str
    fromPort? : float
    ipv6CidrBlocks? : [str]
    ipv6CidrBlocksRefs? : [SecuritygrouprulespecinitproviderIpv6Cidrblocksrefsitem]
    ipv6CidrBlocksSelector? : SecuritygrouprulespecinitproviderIpv6Cidrblocksselector
    prefixListIdRefs? : [SecuritygrouprulespecinitproviderPrefixlistidrefsitem]
    prefixListIdSelector? : SecuritygrouprulespecinitproviderPrefixlistidselector
    prefixListIds? : [str]
    protocol? : str
    securityGroupId? : str
    securityGroupIdRef? : SecuritygrouprulespecinitproviderSecuritygroupidref
    securityGroupIdSelector? : SecuritygrouprulespecinitproviderSecuritygroupidselector
    self? : bool
    sourceSecurityGroupId? : str
    sourceSecurityGroupIdRef? : SecuritygrouprulespecinitproviderSourcesecuritygroupidref
    sourceSecurityGroupIdSelector? : SecuritygrouprulespecinitproviderSourcesecuritygroupidselector
    toPort? : float
    type? : str

schema SecuritygrouprulespecinitproviderCidrblocksrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecinitprovidercidrblocksrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecinitprovidercidrblocksrefsitemPolicy

schema SecuritygrouprulespecinitprovidercidrblocksrefsitemPolicy:
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

schema SecuritygrouprulespecinitproviderCidrblocksselector:
    """
    Selector for a list of VPC in ec2 to populate cidrBlocks.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecinitprovidercidrblocksselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecinitprovidercidrblocksselectorPolicy

schema SecuritygrouprulespecinitprovidercidrblocksselectorPolicy:
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

schema SecuritygrouprulespecinitproviderIpv6Cidrblocksrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : Securitygrouprulespecinitprovideripv6CidrblocksrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : Securitygrouprulespecinitprovideripv6CidrblocksrefsitemPolicy

schema Securitygrouprulespecinitprovideripv6CidrblocksrefsitemPolicy:
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

schema SecuritygrouprulespecinitproviderIpv6Cidrblocksselector:
    """
    Selector for a list of VPC in ec2 to populate ipv6CidrBlocks.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : Securitygrouprulespecinitprovideripv6CidrblocksselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : Securitygrouprulespecinitprovideripv6CidrblocksselectorPolicy

schema Securitygrouprulespecinitprovideripv6CidrblocksselectorPolicy:
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

schema SecuritygrouprulespecinitproviderPrefixlistidrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecinitproviderprefixlistidrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecinitproviderprefixlistidrefsitemPolicy

schema SecuritygrouprulespecinitproviderprefixlistidrefsitemPolicy:
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

schema SecuritygrouprulespecinitproviderPrefixlistidselector:
    """
    Selector for a list of ManagedPrefixList in ec2 to populate prefixListIds.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecinitproviderprefixlistidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecinitproviderprefixlistidselectorPolicy

schema SecuritygrouprulespecinitproviderprefixlistidselectorPolicy:
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

schema SecuritygrouprulespecinitproviderSecuritygroupidref:
    """
    Reference to a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecinitprovidersecuritygroupidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecinitprovidersecuritygroupidrefPolicy

schema SecuritygrouprulespecinitprovidersecuritygroupidrefPolicy:
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

schema SecuritygrouprulespecinitproviderSecuritygroupidselector:
    """
    Selector for a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecinitprovidersecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecinitprovidersecuritygroupidselectorPolicy

schema SecuritygrouprulespecinitprovidersecuritygroupidselectorPolicy:
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

schema SecuritygrouprulespecinitproviderSourcesecuritygroupidref:
    """
    Reference to a SecurityGroup in ec2 to populate sourceSecurityGroupId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecinitprovidersourcesecuritygroupidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecinitprovidersourcesecuritygroupidrefPolicy

schema SecuritygrouprulespecinitprovidersourcesecuritygroupidrefPolicy:
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

schema SecuritygrouprulespecinitproviderSourcesecuritygroupidselector:
    """
    Selector for a SecurityGroup in ec2 to populate sourceSecurityGroupId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : SecuritygrouprulespecinitprovidersourcesecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : SecuritygrouprulespecinitprovidersourcesecuritygroupidselectorPolicy

schema SecuritygrouprulespecinitprovidersourcesecuritygroupidselectorPolicy:
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

schema SecuritygrouprulespecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : SecuritygrouprulespecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : SecuritygrouprulespecproviderconfigrefPolicy

schema SecuritygrouprulespecproviderconfigrefPolicy:
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

schema SecuritygrouprulespecWriteconnectionsecrettoref:
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

schema SecuritygroupruleStatus:
    """
    SecurityGroupRuleStatus defines the observed state of SecurityGroupRule.

    Attributes
    ----------
    atProvider : SecuritygrouprulestatusAtprovider, optional
        No description available.
    conditions : [SecuritygrouprulestatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : SecuritygrouprulestatusAtprovider
    conditions? : [SecuritygrouprulestatusConditionsitem]
    observedGeneration? : int

schema SecuritygrouprulestatusAtprovider:
    """
    SecuritygrouprulestatusAtprovider schema.

    Attributes
    ----------
    cidrBlocks : [str], optional
        List of CIDR blocks. Cannot be specified with source_security_group_id or self.
    description : str, optional
        Description of the rule.
    fromPort : float, optional
        Start port (or ICMP type number if protocol is "icmp" or "icmpv6").
    id : str, optional
        ID of the security group rule.
    ipv6CidrBlocks : [str], optional
        List of IPv6 CIDR blocks. Cannot be specified with source_security_group_id or self.
    prefixListIds : [str], optional
        List of Prefix List IDs.
    protocol : str, optional
        Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    securityGroupId : str, optional
        Security group to apply this rule to.
    securityGroupRuleId : str, optional
        If the aws_security_group_rule resource has a single source or destination then this is the AWS Security Group Rule resource ID. Otherwise it is empty.
    self : bool, optional
        Whether the security group itself will be added as a source to this ingress rule. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or source_security_group_id.
    sourceSecurityGroupId : str, optional
        Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self.
    toPort : float, optional
        End port (or ICMP code if protocol is "icmp").
    type : str, optional
        Type of rule being created. Valid options are ingress (inbound)
        or egress (outbound).
    """
    cidrBlocks? : [str]
    description? : str
    fromPort? : float
    id? : str
    ipv6CidrBlocks? : [str]
    prefixListIds? : [str]
    protocol? : str
    region? : str
    securityGroupId? : str
    securityGroupRuleId? : str
    self? : bool
    sourceSecurityGroupId? : str
    toPort? : float
    type? : str

schema SecuritygrouprulestatusConditionsitem:
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