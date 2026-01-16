"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Role:
    """
    Role is the Schema for the Roles API. Provides an IAM role.

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
    spec : RoleSpec, required
        RoleSpec defines the desired state of Role
    status : RoleStatus, optional
        RoleStatus defines the observed state of Role.
    """
    apiVersion : str = "iam.aws.upbound.io/v1beta1"
    kind : str = "Role"
    metadata? : any
    spec : RoleSpec
    status? : RoleStatus

schema RoleSpec:
    """
    RoleSpec defines the desired state of Role

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
    forProvider : RolespecForprovider, required
        No description available.
    initProvider : RolespecInitprovider, optional
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
    providerConfigRef : RolespecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : RolespecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : RolespecForprovider
    initProvider? : RolespecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : RolespecProviderconfigref
    writeConnectionSecretToRef? : RolespecWriteconnectionsecrettoref

schema RolespecForprovider:
    """
    RolespecForprovider schema.

    Attributes
    ----------
    assumeRolePolicy : str, optional
        Policy that grants an entity permission to assume the role. This field is required, but it can be specified in either 'spec.forProvider.assumeRolePolicy' or 'spec.initProvider.assumeRolePolicy'. While it may appear optional in each location individually, the resource requires that it is defined in at least one of them during creation.
    description : str, optional
        Description of the role.
    forceDetachPolicies : bool, optional
        Whether to force detaching any policies the role has before destroying it. Defaults to false.
    inlinePolicy : [RolespecforproviderInlinepolicyitem], optional
        Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Crossplane will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Crossplane to remove all inline policies added out of band on apply.
    managedPolicyArns : [str], optional
        Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Crossplane will ignore policy attachments to this resource. When configured, Crossplane will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Crossplane to remove all managed policy attachments.
    managedPolicyArnsRefs : [RolespecforproviderManagedpolicyarnsrefsitem], optional
        References to Policy in iam to populate managedPolicyArns.
    managedPolicyArnsSelector : RolespecforproviderManagedpolicyarnsselector, optional
        Selector for a list of Policy in iam to populate managedPolicyArns.
    maxSessionDuration : float, optional
        Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
    path : str, optional
        Path to the role. See IAM Identifiers for more information.
    permissionsBoundary : str, optional
        ARN of the policy that is used to set the permissions boundary for the role.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    assumeRolePolicy? : str
    description? : str
    forceDetachPolicies? : bool
    inlinePolicy? : [RolespecforproviderInlinepolicyitem]
    managedPolicyArns? : [str]
    managedPolicyArnsRefs? : [RolespecforproviderManagedpolicyarnsrefsitem]
    managedPolicyArnsSelector? : RolespecforproviderManagedpolicyarnsselector
    maxSessionDuration? : float
    path? : str
    permissionsBoundary? : str
    tags? : {str:str}

schema RolespecforproviderInlinepolicyitem:
    """
    RolespecforproviderInlinepolicyitem schema.

    Attributes
    ----------
    name : str, optional
        Friendly name of the role. See IAM Identifiers for more information.
    policy : str, optional
        Policy document as a JSON formatted string.
    """
    name? : str
    policy? : str

schema RolespecforproviderManagedpolicyarnsrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolespecforprovidermanagedpolicyarnsrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolespecforprovidermanagedpolicyarnsrefsitemPolicy

schema RolespecforprovidermanagedpolicyarnsrefsitemPolicy:
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

schema RolespecforproviderManagedpolicyarnsselector:
    """
    Selector for a list of Policy in iam to populate managedPolicyArns.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RolespecforprovidermanagedpolicyarnsselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RolespecforprovidermanagedpolicyarnsselectorPolicy

schema RolespecforprovidermanagedpolicyarnsselectorPolicy:
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

schema RolespecInitprovider:
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
    assumeRolePolicy : str, optional
        Policy that grants an entity permission to assume the role. This field is required, but it can be specified in either 'spec.forProvider.assumeRolePolicy' or 'spec.initProvider.assumeRolePolicy'. While it may appear optional in each location individually, the resource requires that it is defined in at least one of them during creation.
    description : str, optional
        Description of the role.
    forceDetachPolicies : bool, optional
        Whether to force detaching any policies the role has before destroying it. Defaults to false.
    inlinePolicy : [RolespecinitproviderInlinepolicyitem], optional
        Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Crossplane will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Crossplane to remove all inline policies added out of band on apply.
    managedPolicyArns : [str], optional
        Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Crossplane will ignore policy attachments to this resource. When configured, Crossplane will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Crossplane to remove all managed policy attachments.
    managedPolicyArnsRefs : [RolespecinitproviderManagedpolicyarnsrefsitem], optional
        References to Policy in iam to populate managedPolicyArns.
    managedPolicyArnsSelector : RolespecinitproviderManagedpolicyarnsselector, optional
        Selector for a list of Policy in iam to populate managedPolicyArns.
    maxSessionDuration : float, optional
        Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
    path : str, optional
        Path to the role. See IAM Identifiers for more information.
    permissionsBoundary : str, optional
        ARN of the policy that is used to set the permissions boundary for the role.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    assumeRolePolicy? : str
    description? : str
    forceDetachPolicies? : bool
    inlinePolicy? : [RolespecinitproviderInlinepolicyitem]
    managedPolicyArns? : [str]
    managedPolicyArnsRefs? : [RolespecinitproviderManagedpolicyarnsrefsitem]
    managedPolicyArnsSelector? : RolespecinitproviderManagedpolicyarnsselector
    maxSessionDuration? : float
    path? : str
    permissionsBoundary? : str
    tags? : {str:str}

schema RolespecinitproviderInlinepolicyitem:
    """
    RolespecinitproviderInlinepolicyitem schema.

    Attributes
    ----------
    name : str, optional
        Friendly name of the role. See IAM Identifiers for more information.
    policy : str, optional
        Policy document as a JSON formatted string.
    """
    name? : str
    policy? : str

schema RolespecinitproviderManagedpolicyarnsrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolespecinitprovidermanagedpolicyarnsrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolespecinitprovidermanagedpolicyarnsrefsitemPolicy

schema RolespecinitprovidermanagedpolicyarnsrefsitemPolicy:
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

schema RolespecinitproviderManagedpolicyarnsselector:
    """
    Selector for a list of Policy in iam to populate managedPolicyArns.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RolespecinitprovidermanagedpolicyarnsselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RolespecinitprovidermanagedpolicyarnsselectorPolicy

schema RolespecinitprovidermanagedpolicyarnsselectorPolicy:
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

schema RolespecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolespecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolespecproviderconfigrefPolicy

schema RolespecproviderconfigrefPolicy:
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

schema RolespecWriteconnectionsecrettoref:
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

schema RoleStatus:
    """
    RoleStatus defines the observed state of Role.

    Attributes
    ----------
    atProvider : RolestatusAtprovider, optional
        No description available.
    conditions : [RolestatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : RolestatusAtprovider
    conditions? : [RolestatusConditionsitem]
    observedGeneration? : int

schema RolestatusAtprovider:
    """
    RolestatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        Amazon Resource Name (ARN) specifying the role.
    assumeRolePolicy : str, optional
        Policy that grants an entity permission to assume the role. This field is required, but it can be specified in either 'spec.forProvider.assumeRolePolicy' or 'spec.initProvider.assumeRolePolicy'. While it may appear optional in each location individually, the resource requires that it is defined in at least one of them during creation.
    createDate : str, optional
        Creation date of the IAM role.
    description : str, optional
        Description of the role.
    forceDetachPolicies : bool, optional
        Whether to force detaching any policies the role has before destroying it. Defaults to false.
    id : str, optional
        Name of the role.
    inlinePolicy : [RolestatusatproviderInlinepolicyitem], optional
        Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Crossplane will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Crossplane to remove all inline policies added out of band on apply.
    managedPolicyArns : [str], optional
        Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Crossplane will ignore policy attachments to this resource. When configured, Crossplane will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Crossplane to remove all managed policy attachments.
    maxSessionDuration : float, optional
        Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
    path : str, optional
        Path to the role. See IAM Identifiers for more information.
    permissionsBoundary : str, optional
        ARN of the policy that is used to set the permissions boundary for the role.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    uniqueId : str, optional
        Stable and unique string identifying the role.
    """
    arn? : str
    assumeRolePolicy? : str
    createDate? : str
    description? : str
    forceDetachPolicies? : bool
    id? : str
    inlinePolicy? : [RolestatusatproviderInlinepolicyitem]
    managedPolicyArns? : [str]
    maxSessionDuration? : float
    path? : str
    permissionsBoundary? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    uniqueId? : str

schema RolestatusatproviderInlinepolicyitem:
    """
    RolestatusatproviderInlinepolicyitem schema.

    Attributes
    ----------
    name : str, optional
        Friendly name of the role. See IAM Identifiers for more information.
    policy : str, optional
        Policy document as a JSON formatted string.
    """
    name? : str
    policy? : str

schema RolestatusConditionsitem:
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