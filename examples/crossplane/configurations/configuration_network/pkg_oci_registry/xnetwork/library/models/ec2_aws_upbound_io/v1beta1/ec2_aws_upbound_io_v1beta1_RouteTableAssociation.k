"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Routetableassociation:
    """
    RouteTableAssociation is the Schema for the RouteTableAssociations API. Provides a resource to create an association between a route table and a subnet or a route table and an internet gateway or virtual private gateway.

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
    spec : RoutetableassociationSpec, required
        RouteTableAssociationSpec defines the desired state of RouteTableAssociation
    status : RoutetableassociationStatus, optional
        RouteTableAssociationStatus defines the observed state of RouteTableAssociation.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "RouteTableAssociation"
    metadata? : any
    spec : RoutetableassociationSpec
    status? : RoutetableassociationStatus

schema RoutetableassociationSpec:
    """
    RouteTableAssociationSpec defines the desired state of RouteTableAssociation

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
    forProvider : RoutetableassociationspecForprovider, required
        No description available.
    initProvider : RoutetableassociationspecInitprovider, optional
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
    providerConfigRef : RoutetableassociationspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : RoutetableassociationspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : RoutetableassociationspecForprovider
    initProvider? : RoutetableassociationspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : RoutetableassociationspecProviderconfigref
    writeConnectionSecretToRef? : RoutetableassociationspecWriteconnectionsecrettoref

schema RoutetableassociationspecForprovider:
    """
    RoutetableassociationspecForprovider schema.

    Attributes
    ----------
    gatewayId : str, optional
        The gateway ID to create an association. Conflicts with subnet_id.
    gatewayIdRef : RoutetableassociationspecforproviderGatewayidref, optional
        Reference to a InternetGateway in ec2 to populate gatewayId.
    gatewayIdSelector : RoutetableassociationspecforproviderGatewayidselector, optional
        Selector for a InternetGateway in ec2 to populate gatewayId.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    routeTableId : str, optional
        The ID of the routing table to associate with.
    routeTableIdRef : RoutetableassociationspecforproviderRoutetableidref, optional
        Reference to a RouteTable in ec2 to populate routeTableId.
    routeTableIdSelector : RoutetableassociationspecforproviderRoutetableidselector, optional
        Selector for a RouteTable in ec2 to populate routeTableId.
    subnetId : str, optional
        The subnet ID to create an association. Conflicts with gateway_id.
    subnetIdRef : RoutetableassociationspecforproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : RoutetableassociationspecforproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    """
    gatewayId? : str
    gatewayIdRef? : RoutetableassociationspecforproviderGatewayidref
    gatewayIdSelector? : RoutetableassociationspecforproviderGatewayidselector
    region : str
    routeTableId? : str
    routeTableIdRef? : RoutetableassociationspecforproviderRoutetableidref
    routeTableIdSelector? : RoutetableassociationspecforproviderRoutetableidselector
    subnetId? : str
    subnetIdRef? : RoutetableassociationspecforproviderSubnetidref
    subnetIdSelector? : RoutetableassociationspecforproviderSubnetidselector

schema RoutetableassociationspecforproviderGatewayidref:
    """
    Reference to a InternetGateway in ec2 to populate gatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutetableassociationspecforprovidergatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutetableassociationspecforprovidergatewayidrefPolicy

schema RoutetableassociationspecforprovidergatewayidrefPolicy:
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

schema RoutetableassociationspecforproviderGatewayidselector:
    """
    Selector for a InternetGateway in ec2 to populate gatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutetableassociationspecforprovidergatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutetableassociationspecforprovidergatewayidselectorPolicy

schema RoutetableassociationspecforprovidergatewayidselectorPolicy:
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

schema RoutetableassociationspecforproviderRoutetableidref:
    """
    Reference to a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutetableassociationspecforproviderroutetableidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutetableassociationspecforproviderroutetableidrefPolicy

schema RoutetableassociationspecforproviderroutetableidrefPolicy:
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

schema RoutetableassociationspecforproviderRoutetableidselector:
    """
    Selector for a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutetableassociationspecforproviderroutetableidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutetableassociationspecforproviderroutetableidselectorPolicy

schema RoutetableassociationspecforproviderroutetableidselectorPolicy:
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

schema RoutetableassociationspecforproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutetableassociationspecforprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutetableassociationspecforprovidersubnetidrefPolicy

schema RoutetableassociationspecforprovidersubnetidrefPolicy:
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

schema RoutetableassociationspecforproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutetableassociationspecforprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutetableassociationspecforprovidersubnetidselectorPolicy

schema RoutetableassociationspecforprovidersubnetidselectorPolicy:
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

schema RoutetableassociationspecInitprovider:
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
    gatewayId : str, optional
        The gateway ID to create an association. Conflicts with subnet_id.
    gatewayIdRef : RoutetableassociationspecinitproviderGatewayidref, optional
        Reference to a InternetGateway in ec2 to populate gatewayId.
    gatewayIdSelector : RoutetableassociationspecinitproviderGatewayidselector, optional
        Selector for a InternetGateway in ec2 to populate gatewayId.
    routeTableId : str, optional
        The ID of the routing table to associate with.
    routeTableIdRef : RoutetableassociationspecinitproviderRoutetableidref, optional
        Reference to a RouteTable in ec2 to populate routeTableId.
    routeTableIdSelector : RoutetableassociationspecinitproviderRoutetableidselector, optional
        Selector for a RouteTable in ec2 to populate routeTableId.
    subnetId : str, optional
        The subnet ID to create an association. Conflicts with gateway_id.
    subnetIdRef : RoutetableassociationspecinitproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : RoutetableassociationspecinitproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    """
    gatewayId? : str
    gatewayIdRef? : RoutetableassociationspecinitproviderGatewayidref
    gatewayIdSelector? : RoutetableassociationspecinitproviderGatewayidselector
    routeTableId? : str
    routeTableIdRef? : RoutetableassociationspecinitproviderRoutetableidref
    routeTableIdSelector? : RoutetableassociationspecinitproviderRoutetableidselector
    subnetId? : str
    subnetIdRef? : RoutetableassociationspecinitproviderSubnetidref
    subnetIdSelector? : RoutetableassociationspecinitproviderSubnetidselector

schema RoutetableassociationspecinitproviderGatewayidref:
    """
    Reference to a InternetGateway in ec2 to populate gatewayId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutetableassociationspecinitprovidergatewayidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutetableassociationspecinitprovidergatewayidrefPolicy

schema RoutetableassociationspecinitprovidergatewayidrefPolicy:
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

schema RoutetableassociationspecinitproviderGatewayidselector:
    """
    Selector for a InternetGateway in ec2 to populate gatewayId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutetableassociationspecinitprovidergatewayidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutetableassociationspecinitprovidergatewayidselectorPolicy

schema RoutetableassociationspecinitprovidergatewayidselectorPolicy:
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

schema RoutetableassociationspecinitproviderRoutetableidref:
    """
    Reference to a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutetableassociationspecinitproviderroutetableidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutetableassociationspecinitproviderroutetableidrefPolicy

schema RoutetableassociationspecinitproviderroutetableidrefPolicy:
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

schema RoutetableassociationspecinitproviderRoutetableidselector:
    """
    Selector for a RouteTable in ec2 to populate routeTableId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutetableassociationspecinitproviderroutetableidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutetableassociationspecinitproviderroutetableidselectorPolicy

schema RoutetableassociationspecinitproviderroutetableidselectorPolicy:
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

schema RoutetableassociationspecinitproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutetableassociationspecinitprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutetableassociationspecinitprovidersubnetidrefPolicy

schema RoutetableassociationspecinitprovidersubnetidrefPolicy:
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

schema RoutetableassociationspecinitproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RoutetableassociationspecinitprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RoutetableassociationspecinitprovidersubnetidselectorPolicy

schema RoutetableassociationspecinitprovidersubnetidselectorPolicy:
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

schema RoutetableassociationspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RoutetableassociationspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RoutetableassociationspecproviderconfigrefPolicy

schema RoutetableassociationspecproviderconfigrefPolicy:
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

schema RoutetableassociationspecWriteconnectionsecrettoref:
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

schema RoutetableassociationStatus:
    """
    RouteTableAssociationStatus defines the observed state of RouteTableAssociation.

    Attributes
    ----------
    atProvider : RoutetableassociationstatusAtprovider, optional
        No description available.
    conditions : [RoutetableassociationstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : RoutetableassociationstatusAtprovider
    conditions? : [RoutetableassociationstatusConditionsitem]
    observedGeneration? : int

schema RoutetableassociationstatusAtprovider:
    """
    RoutetableassociationstatusAtprovider schema.

    Attributes
    ----------
    gatewayId : str, optional
        The gateway ID to create an association. Conflicts with subnet_id.
    id : str, optional
        The ID of the association
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    routeTableId : str, optional
        The ID of the routing table to associate with.
    subnetId : str, optional
        The subnet ID to create an association. Conflicts with gateway_id.
    """
    gatewayId? : str
    id? : str
    region? : str
    routeTableId? : str
    subnetId? : str

schema RoutetableassociationstatusConditionsitem:
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