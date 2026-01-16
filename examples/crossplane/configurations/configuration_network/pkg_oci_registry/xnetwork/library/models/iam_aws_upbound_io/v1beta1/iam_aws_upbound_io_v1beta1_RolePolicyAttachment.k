"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Rolepolicyattachment:
    """
    RolePolicyAttachment is the Schema for the RolePolicyAttachments API. Attaches a Managed IAM Policy to an IAM role

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
    spec : RolepolicyattachmentSpec, required
        RolePolicyAttachmentSpec defines the desired state of RolePolicyAttachment
    status : RolepolicyattachmentStatus, optional
        RolePolicyAttachmentStatus defines the observed state of RolePolicyAttachment.
    """
    apiVersion : str = "iam.aws.upbound.io/v1beta1"
    kind : str = "RolePolicyAttachment"
    metadata? : any
    spec : RolepolicyattachmentSpec
    status? : RolepolicyattachmentStatus

schema RolepolicyattachmentSpec:
    """
    RolePolicyAttachmentSpec defines the desired state of RolePolicyAttachment

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
    forProvider : RolepolicyattachmentspecForprovider, required
        No description available.
    initProvider : RolepolicyattachmentspecInitprovider, optional
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
    providerConfigRef : RolepolicyattachmentspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : RolepolicyattachmentspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : RolepolicyattachmentspecForprovider
    initProvider? : RolepolicyattachmentspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : RolepolicyattachmentspecProviderconfigref
    writeConnectionSecretToRef? : RolepolicyattachmentspecWriteconnectionsecrettoref

schema RolepolicyattachmentspecForprovider:
    """
    RolepolicyattachmentspecForprovider schema.

    Attributes
    ----------
    policyArn : str, optional
        The ARN of the policy you want to apply
    policyArnRef : RolepolicyattachmentspecforproviderPolicyarnref, optional
        Reference to a Policy in iam to populate policyArn.
    policyArnSelector : RolepolicyattachmentspecforproviderPolicyarnselector, optional
        Selector for a Policy in iam to populate policyArn.
    role : str, optional
        The name of the IAM role to which the policy should be applied
    roleRef : RolepolicyattachmentspecforproviderRoleref, optional
        Reference to a Role in iam to populate role.
    roleSelector : RolepolicyattachmentspecforproviderRoleselector, optional
        Selector for a Role in iam to populate role.
    """
    policyArn? : str
    policyArnRef? : RolepolicyattachmentspecforproviderPolicyarnref
    policyArnSelector? : RolepolicyattachmentspecforproviderPolicyarnselector
    role? : str
    roleRef? : RolepolicyattachmentspecforproviderRoleref
    roleSelector? : RolepolicyattachmentspecforproviderRoleselector

schema RolepolicyattachmentspecforproviderPolicyarnref:
    """
    Reference to a Policy in iam to populate policyArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolepolicyattachmentspecforproviderpolicyarnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolepolicyattachmentspecforproviderpolicyarnrefPolicy

schema RolepolicyattachmentspecforproviderpolicyarnrefPolicy:
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

schema RolepolicyattachmentspecforproviderPolicyarnselector:
    """
    Selector for a Policy in iam to populate policyArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RolepolicyattachmentspecforproviderpolicyarnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RolepolicyattachmentspecforproviderpolicyarnselectorPolicy

schema RolepolicyattachmentspecforproviderpolicyarnselectorPolicy:
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

schema RolepolicyattachmentspecforproviderRoleref:
    """
    Reference to a Role in iam to populate role.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolepolicyattachmentspecforproviderrolerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolepolicyattachmentspecforproviderrolerefPolicy

schema RolepolicyattachmentspecforproviderrolerefPolicy:
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

schema RolepolicyattachmentspecforproviderRoleselector:
    """
    Selector for a Role in iam to populate role.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RolepolicyattachmentspecforproviderroleselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RolepolicyattachmentspecforproviderroleselectorPolicy

schema RolepolicyattachmentspecforproviderroleselectorPolicy:
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

schema RolepolicyattachmentspecInitprovider:
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
    policyArn : str, optional
        The ARN of the policy you want to apply
    policyArnRef : RolepolicyattachmentspecinitproviderPolicyarnref, optional
        Reference to a Policy in iam to populate policyArn.
    policyArnSelector : RolepolicyattachmentspecinitproviderPolicyarnselector, optional
        Selector for a Policy in iam to populate policyArn.
    role : str, optional
        The name of the IAM role to which the policy should be applied
    roleRef : RolepolicyattachmentspecinitproviderRoleref, optional
        Reference to a Role in iam to populate role.
    roleSelector : RolepolicyattachmentspecinitproviderRoleselector, optional
        Selector for a Role in iam to populate role.
    """
    policyArn? : str
    policyArnRef? : RolepolicyattachmentspecinitproviderPolicyarnref
    policyArnSelector? : RolepolicyattachmentspecinitproviderPolicyarnselector
    role? : str
    roleRef? : RolepolicyattachmentspecinitproviderRoleref
    roleSelector? : RolepolicyattachmentspecinitproviderRoleselector

schema RolepolicyattachmentspecinitproviderPolicyarnref:
    """
    Reference to a Policy in iam to populate policyArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolepolicyattachmentspecinitproviderpolicyarnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolepolicyattachmentspecinitproviderpolicyarnrefPolicy

schema RolepolicyattachmentspecinitproviderpolicyarnrefPolicy:
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

schema RolepolicyattachmentspecinitproviderPolicyarnselector:
    """
    Selector for a Policy in iam to populate policyArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RolepolicyattachmentspecinitproviderpolicyarnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RolepolicyattachmentspecinitproviderpolicyarnselectorPolicy

schema RolepolicyattachmentspecinitproviderpolicyarnselectorPolicy:
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

schema RolepolicyattachmentspecinitproviderRoleref:
    """
    Reference to a Role in iam to populate role.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolepolicyattachmentspecinitproviderrolerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolepolicyattachmentspecinitproviderrolerefPolicy

schema RolepolicyattachmentspecinitproviderrolerefPolicy:
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

schema RolepolicyattachmentspecinitproviderRoleselector:
    """
    Selector for a Role in iam to populate role.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RolepolicyattachmentspecinitproviderroleselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RolepolicyattachmentspecinitproviderroleselectorPolicy

schema RolepolicyattachmentspecinitproviderroleselectorPolicy:
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

schema RolepolicyattachmentspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RolepolicyattachmentspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RolepolicyattachmentspecproviderconfigrefPolicy

schema RolepolicyattachmentspecproviderconfigrefPolicy:
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

schema RolepolicyattachmentspecWriteconnectionsecrettoref:
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

schema RolepolicyattachmentStatus:
    """
    RolePolicyAttachmentStatus defines the observed state of RolePolicyAttachment.

    Attributes
    ----------
    atProvider : RolepolicyattachmentstatusAtprovider, optional
        No description available.
    conditions : [RolepolicyattachmentstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : RolepolicyattachmentstatusAtprovider
    conditions? : [RolepolicyattachmentstatusConditionsitem]
    observedGeneration? : int

schema RolepolicyattachmentstatusAtprovider:
    """
    RolepolicyattachmentstatusAtprovider schema.

    Attributes
    ----------
    id : str, optional
        No description available.
    policyArn : str, optional
        The ARN of the policy you want to apply
    role : str, optional
        The name of the IAM role to which the policy should be applied
    """
    id? : str
    policyArn? : str
    role? : str

schema RolepolicyattachmentstatusConditionsitem:
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