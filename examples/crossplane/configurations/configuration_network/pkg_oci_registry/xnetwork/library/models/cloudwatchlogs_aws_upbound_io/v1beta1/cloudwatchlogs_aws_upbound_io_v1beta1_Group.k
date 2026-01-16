"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Group:
    """
    Group is the Schema for the Groups API. Provides a CloudWatch Log Group resource.

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
    spec : GroupSpec, required
        GroupSpec defines the desired state of Group
    status : GroupStatus, optional
        GroupStatus defines the observed state of Group.
    """
    apiVersion : str = "cloudwatchlogs.aws.upbound.io/v1beta1"
    kind : str = "Group"
    metadata? : any
    spec : GroupSpec
    status? : GroupStatus

schema GroupSpec:
    """
    GroupSpec defines the desired state of Group

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
    forProvider : GroupspecForprovider, required
        No description available.
    initProvider : GroupspecInitprovider, optional
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
    providerConfigRef : GroupspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : GroupspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : GroupspecForprovider
    initProvider? : GroupspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : GroupspecProviderconfigref
    writeConnectionSecretToRef? : GroupspecWriteconnectionsecrettoref

schema GroupspecForprovider:
    """
    GroupspecForprovider schema.

    Attributes
    ----------
    kmsKeyId : str, optional
        The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group,
        AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires
        permissions for the CMK whenever the encrypted data is requested.
    kmsKeyIdRef : GroupspecforproviderKmskeyidref, optional
        Reference to a Key in kms to populate kmsKeyId.
    kmsKeyIdSelector : GroupspecforproviderKmskeyidselector, optional
        Selector for a Key in kms to populate kmsKeyId.
    logGroupClass : str, optional
        Specified the log class of the log group. Possible values are: STANDARD, INFREQUENT_ACCESS, or DELIVERY.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    retentionInDays : float, optional
        Specifies the number of days
        you want to retain log events in the specified log group.  Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0.
        If you select 0, the events in the log group are always retained and never expire. If log_group_class is set to DELIVERY, this argument is ignored and retention_in_days is forcibly set to 2.
    skipDestroy : bool, optional
        No description available.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    kmsKeyId? : str
    kmsKeyIdRef? : GroupspecforproviderKmskeyidref
    kmsKeyIdSelector? : GroupspecforproviderKmskeyidselector
    logGroupClass? : str
    region : str
    retentionInDays? : float
    skipDestroy? : bool
    tags? : {str:str}

schema GroupspecforproviderKmskeyidref:
    """
    Reference to a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : GroupspecforproviderkmskeyidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : GroupspecforproviderkmskeyidrefPolicy

schema GroupspecforproviderkmskeyidrefPolicy:
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

schema GroupspecforproviderKmskeyidselector:
    """
    Selector for a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : GroupspecforproviderkmskeyidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : GroupspecforproviderkmskeyidselectorPolicy

schema GroupspecforproviderkmskeyidselectorPolicy:
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

schema GroupspecInitprovider:
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
    kmsKeyId : str, optional
        The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group,
        AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires
        permissions for the CMK whenever the encrypted data is requested.
    kmsKeyIdRef : GroupspecinitproviderKmskeyidref, optional
        Reference to a Key in kms to populate kmsKeyId.
    kmsKeyIdSelector : GroupspecinitproviderKmskeyidselector, optional
        Selector for a Key in kms to populate kmsKeyId.
    logGroupClass : str, optional
        Specified the log class of the log group. Possible values are: STANDARD, INFREQUENT_ACCESS, or DELIVERY.
    retentionInDays : float, optional
        Specifies the number of days
        you want to retain log events in the specified log group.  Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0.
        If you select 0, the events in the log group are always retained and never expire. If log_group_class is set to DELIVERY, this argument is ignored and retention_in_days is forcibly set to 2.
    skipDestroy : bool, optional
        No description available.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    kmsKeyId? : str
    kmsKeyIdRef? : GroupspecinitproviderKmskeyidref
    kmsKeyIdSelector? : GroupspecinitproviderKmskeyidselector
    logGroupClass? : str
    retentionInDays? : float
    skipDestroy? : bool
    tags? : {str:str}

schema GroupspecinitproviderKmskeyidref:
    """
    Reference to a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : GroupspecinitproviderkmskeyidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : GroupspecinitproviderkmskeyidrefPolicy

schema GroupspecinitproviderkmskeyidrefPolicy:
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

schema GroupspecinitproviderKmskeyidselector:
    """
    Selector for a Key in kms to populate kmsKeyId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : GroupspecinitproviderkmskeyidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : GroupspecinitproviderkmskeyidselectorPolicy

schema GroupspecinitproviderkmskeyidselectorPolicy:
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

schema GroupspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : GroupspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : GroupspecproviderconfigrefPolicy

schema GroupspecproviderconfigrefPolicy:
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

schema GroupspecWriteconnectionsecrettoref:
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

schema GroupStatus:
    """
    GroupStatus defines the observed state of Group.

    Attributes
    ----------
    atProvider : GroupstatusAtprovider, optional
        No description available.
    conditions : [GroupstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : GroupstatusAtprovider
    conditions? : [GroupstatusConditionsitem]
    observedGeneration? : int

schema GroupstatusAtprovider:
    """
    GroupstatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        The Amazon Resource Name (ARN) specifying the log group. Any :* suffix added by the API, denoting all CloudWatch Log Streams under the CloudWatch Log Group, is removed for greater compatibility with other AWS services that do not accept the suffix.
    id : str, optional
        No description available.
    kmsKeyId : str, optional
        The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group,
        AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires
        permissions for the CMK whenever the encrypted data is requested.
    logGroupClass : str, optional
        Specified the log class of the log group. Possible values are: STANDARD, INFREQUENT_ACCESS, or DELIVERY.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    retentionInDays : float, optional
        Specifies the number of days
        you want to retain log events in the specified log group.  Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0.
        If you select 0, the events in the log group are always retained and never expire. If log_group_class is set to DELIVERY, this argument is ignored and retention_in_days is forcibly set to 2.
    skipDestroy : bool, optional
        No description available.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    """
    arn? : str
    id? : str
    kmsKeyId? : str
    logGroupClass? : str
    region? : str
    retentionInDays? : float
    skipDestroy? : bool
    tags? : {str:str}
    tagsAll? : {str:str}

schema GroupstatusConditionsitem:
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