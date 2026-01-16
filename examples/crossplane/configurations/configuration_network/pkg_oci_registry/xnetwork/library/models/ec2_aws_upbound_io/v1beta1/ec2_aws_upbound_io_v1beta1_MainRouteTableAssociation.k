"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Mainroutetableassociation:
    """
    MainRouteTableAssociation is the Schema for the MainRouteTableAssociations API. Provides a resource for managing the main routing table of a VPC.

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
    spec : MainroutetableassociationSpec, required
        MainRouteTableAssociationSpec defines the desired state of MainRouteTableAssociation
    status : MainroutetableassociationStatus, optional
        MainRouteTableAssociationStatus defines the observed state of MainRouteTableAssociation.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "MainRouteTableAssociation"
    metadata? : any
    spec : MainroutetableassociationSpec
    status? : MainroutetableassociationStatus

schema MainroutetableassociationSpec:
    """
    MainRouteTableAssociationSpec defines the desired state of MainRouteTableAssociation

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
    forProvider : MainroutetableassociationspecForprovider, required
        No description available.
    initProvider : MainroutetableassociationspecInitprovider, optional
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
    providerConfigRef : MainroutetableassociationspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : MainroutetableassociationspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : MainroutetableassociationspecForprovider
    initProvider? : MainroutetableassociationspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : MainroutetableassociationspecProviderconfigref
    writeConnectionSecretToRef? : MainroutetableassociationspecWriteconnectionsecrettoref

schema MainroutetableassociationspecForprovider:
    """
    MainroutetableassociationspecForprovider schema.

    Attributes
    ----------
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    routeTableId : str, optional
        The ID of the Route Table to set as the new
        main route table for the target VPC
    routeTableIdRef : MainroutetableassociationspecforproviderRoutetableidref, optional
        Reference to a RouteTable in ec2 to populate routeTableId.
    routeTableIdSelector : MainroutetableassociationspecforproviderRoutetableidselector, optional
        Selector for a RouteTable in ec2 to populate routeTableId.
    vpcId : str, optional
        The ID of the VPC whose main route table should be set
    vpcIdRef : MainroutetableassociationspecforproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : MainroutetableassociationspecforproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    region : str
    routeTableId? : str
    routeTableIdRef? : MainroutetableassociationspecforproviderRoutetableidref
    routeTableIdSelector? : MainroutetableassociationspecforproviderRoutetableidselector
    vpcId? : str
    vpcIdRef? : MainroutetableassociationspecforproviderVpcidref
    vpcIdSelector? : MainroutetableassociationspecforproviderVpcidselector

schema MainroutetableassociationspecforproviderRoutetableidref:
    """
    Reference to a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : MainroutetableassociationspecforproviderroutetableidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : MainroutetableassociationspecforproviderroutetableidrefPolicy

schema MainroutetableassociationspecforproviderroutetableidrefPolicy:
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

schema MainroutetableassociationspecforproviderRoutetableidselector:
    """
    Selector for a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : MainroutetableassociationspecforproviderroutetableidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : MainroutetableassociationspecforproviderroutetableidselectorPolicy

schema MainroutetableassociationspecforproviderroutetableidselectorPolicy:
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

schema MainroutetableassociationspecforproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : MainroutetableassociationspecforprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : MainroutetableassociationspecforprovidervpcidrefPolicy

schema MainroutetableassociationspecforprovidervpcidrefPolicy:
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

schema MainroutetableassociationspecforproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : MainroutetableassociationspecforprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : MainroutetableassociationspecforprovidervpcidselectorPolicy

schema MainroutetableassociationspecforprovidervpcidselectorPolicy:
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

schema MainroutetableassociationspecInitprovider:
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
    routeTableId : str, optional
        The ID of the Route Table to set as the new
        main route table for the target VPC
    routeTableIdRef : MainroutetableassociationspecinitproviderRoutetableidref, optional
        Reference to a RouteTable in ec2 to populate routeTableId.
    routeTableIdSelector : MainroutetableassociationspecinitproviderRoutetableidselector, optional
        Selector for a RouteTable in ec2 to populate routeTableId.
    vpcId : str, optional
        The ID of the VPC whose main route table should be set
    vpcIdRef : MainroutetableassociationspecinitproviderVpcidref, optional
        Reference to a VPC in ec2 to populate vpcId.
    vpcIdSelector : MainroutetableassociationspecinitproviderVpcidselector, optional
        Selector for a VPC in ec2 to populate vpcId.
    """
    routeTableId? : str
    routeTableIdRef? : MainroutetableassociationspecinitproviderRoutetableidref
    routeTableIdSelector? : MainroutetableassociationspecinitproviderRoutetableidselector
    vpcId? : str
    vpcIdRef? : MainroutetableassociationspecinitproviderVpcidref
    vpcIdSelector? : MainroutetableassociationspecinitproviderVpcidselector

schema MainroutetableassociationspecinitproviderRoutetableidref:
    """
    Reference to a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : MainroutetableassociationspecinitproviderroutetableidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : MainroutetableassociationspecinitproviderroutetableidrefPolicy

schema MainroutetableassociationspecinitproviderroutetableidrefPolicy:
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

schema MainroutetableassociationspecinitproviderRoutetableidselector:
    """
    Selector for a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : MainroutetableassociationspecinitproviderroutetableidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : MainroutetableassociationspecinitproviderroutetableidselectorPolicy

schema MainroutetableassociationspecinitproviderroutetableidselectorPolicy:
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

schema MainroutetableassociationspecinitproviderVpcidref:
    """
    Reference to a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : MainroutetableassociationspecinitprovidervpcidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : MainroutetableassociationspecinitprovidervpcidrefPolicy

schema MainroutetableassociationspecinitprovidervpcidrefPolicy:
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

schema MainroutetableassociationspecinitproviderVpcidselector:
    """
    Selector for a VPC in ec2 to populate vpcId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : MainroutetableassociationspecinitprovidervpcidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : MainroutetableassociationspecinitprovidervpcidselectorPolicy

schema MainroutetableassociationspecinitprovidervpcidselectorPolicy:
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

schema MainroutetableassociationspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : MainroutetableassociationspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : MainroutetableassociationspecproviderconfigrefPolicy

schema MainroutetableassociationspecproviderconfigrefPolicy:
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

schema MainroutetableassociationspecWriteconnectionsecrettoref:
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

schema MainroutetableassociationStatus:
    """
    MainRouteTableAssociationStatus defines the observed state of MainRouteTableAssociation.

    Attributes
    ----------
    atProvider : MainroutetableassociationstatusAtprovider, optional
        No description available.
    conditions : [MainroutetableassociationstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : MainroutetableassociationstatusAtprovider
    conditions? : [MainroutetableassociationstatusConditionsitem]
    observedGeneration? : int

schema MainroutetableassociationstatusAtprovider:
    """
    MainroutetableassociationstatusAtprovider schema.

    Attributes
    ----------
    id : str, optional
        The ID of the Route Table Association
    originalRouteTableId : str, optional
        Used internally, see Notes below
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    routeTableId : str, optional
        The ID of the Route Table to set as the new
        main route table for the target VPC
    vpcId : str, optional
        The ID of the VPC whose main route table should be set
    """
    id? : str
    originalRouteTableId? : str
    region? : str
    routeTableId? : str
    vpcId? : str

schema MainroutetableassociationstatusConditionsitem:
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