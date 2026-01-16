"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Internetgateway:
    """
    InternetGateway is the Schema for the InternetGateways API. Provides a resource to create a VPC Internet Gateway.

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
    spec : InternetgatewaySpec, required
        InternetGatewaySpec defines the desired state of InternetGateway
    status : InternetgatewayStatus, optional
        InternetGatewayStatus defines the observed state of InternetGateway.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "InternetGateway"
    metadata? : any
    spec : InternetgatewaySpec
    status? : InternetgatewayStatus

schema InternetgatewaySpec:
    """
    InternetGatewaySpec defines the desired state of InternetGateway

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
    forProvider : InternetgatewayspecForprovider, required
        No description available.
    initProvider : InternetgatewayspecInitprovider, optional
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
    providerConfigRef : InternetgatewayspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : InternetgatewayspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : InternetgatewayspecForprovider
    initProvider? : InternetgatewayspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : InternetgatewayspecProviderconfigref
    writeConnectionSecretToRef? : InternetgatewayspecWriteconnectionsecrettoref

schema InternetgatewayspecForprovider:
    """
    InternetgatewayspecForprovider schema.

    Attributes
    ----------
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcId : str, optional
        The VPC ID to create in.  See the aws_internet_gateway_attachment resource for an alternate way to attach an Internet Gateway to a VPC.
    vpcIdRef : InternetgatewayspecforproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : InternetgatewayspecforproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    region : str
    tags? : {str:str}
    vpcId? : str
    vpcIdRef? : InternetgatewayspecforproviderVpcidref
    vpcIdSelector? : InternetgatewayspecforproviderVpcidselector

schema InternetgatewayspecforproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InternetgatewayspecforprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InternetgatewayspecforprovidervpcidrefPolicy

schema InternetgatewayspecforprovidervpcidrefPolicy:
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

schema InternetgatewayspecforproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InternetgatewayspecforprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InternetgatewayspecforprovidervpcidselectorPolicy

schema InternetgatewayspecforprovidervpcidselectorPolicy:
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

schema InternetgatewayspecInitprovider:
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
    tags : {str:str}, optional
        Key-value map of resource tags.
    vpcId : str, optional
        The VPC ID to create in.  See the aws_internet_gateway_attachment resource for an alternate way to attach an Internet Gateway to a VPC.
    vpcIdRef : InternetgatewayspecinitproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : InternetgatewayspecinitproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    tags? : {str:str}
    vpcId? : str
    vpcIdRef? : InternetgatewayspecinitproviderVpcidref
    vpcIdSelector? : InternetgatewayspecinitproviderVpcidselector

schema InternetgatewayspecinitproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InternetgatewayspecinitprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InternetgatewayspecinitprovidervpcidrefPolicy

schema InternetgatewayspecinitprovidervpcidrefPolicy:
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

schema InternetgatewayspecinitproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : InternetgatewayspecinitprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : InternetgatewayspecinitprovidervpcidselectorPolicy

schema InternetgatewayspecinitprovidervpcidselectorPolicy:
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

schema InternetgatewayspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : InternetgatewayspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : InternetgatewayspecproviderconfigrefPolicy

schema InternetgatewayspecproviderconfigrefPolicy:
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

schema InternetgatewayspecWriteconnectionsecrettoref:
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

schema InternetgatewayStatus:
    """
    InternetGatewayStatus defines the observed state of InternetGateway.

    Attributes
    ----------
    atProvider : InternetgatewaystatusAtprovider, optional
        No description available.
    conditions : [InternetgatewaystatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : InternetgatewaystatusAtprovider
    conditions? : [InternetgatewaystatusConditionsitem]
    observedGeneration? : int

schema InternetgatewaystatusAtprovider:
    """
    InternetgatewaystatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        The ARN of the Internet Gateway.
    id : str, optional
        The ID of the Internet Gateway.
    ownerId : str, optional
        The ID of the AWS account that owns the internet gateway.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    vpcId : str, optional
        The VPC ID to create in.  See the aws_internet_gateway_attachment resource for an alternate way to attach an Internet Gateway to a VPC.
    """
    arn? : str
    id? : str
    ownerId? : str
    region? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    vpcId? : str

schema InternetgatewaystatusConditionsitem:
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