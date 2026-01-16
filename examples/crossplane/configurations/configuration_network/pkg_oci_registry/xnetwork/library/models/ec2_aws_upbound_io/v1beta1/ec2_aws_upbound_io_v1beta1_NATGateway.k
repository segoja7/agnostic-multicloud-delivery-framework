"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Natgateway:
    """
    NATGateway is the Schema for the NATGateways API. Provides a resource to create a VPC NAT Gateway.

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
    spec : NatgatewaySpec, required
        NATGatewaySpec defines the desired state of NATGateway
    status : NatgatewayStatus, optional
        NATGatewayStatus defines the observed state of NATGateway.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "NATGateway"
    metadata? : any
    spec : NatgatewaySpec
    status? : NatgatewayStatus

schema NatgatewaySpec:
    """
    NATGatewaySpec defines the desired state of NATGateway

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
    forProvider : NatgatewayspecForprovider, required
        No description available.
    initProvider : NatgatewayspecInitprovider, optional
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
    providerConfigRef : NatgatewayspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : NatgatewayspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : NatgatewayspecForprovider
    initProvider? : NatgatewayspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : NatgatewayspecProviderconfigref
    writeConnectionSecretToRef? : NatgatewayspecWriteconnectionsecrettoref

schema NatgatewayspecForprovider:
    """
    NatgatewayspecForprovider schema.

    Attributes
    ----------
    allocationId : str, optional
        The Allocation ID of the Elastic IP address for the NAT Gateway. Required for connectivity_type of public.
    allocationIdRef : NatgatewayspecforproviderAllocationidref, optional
        Reference to a EIP in ec2 to populate allocationId.
    allocationIdSelector : NatgatewayspecforproviderAllocationidselector, optional
        Selector for a EIP in ec2 to populate allocationId.
    connectivityType : str, optional
        Connectivity type for the NAT Gateway. Valid values are private and public. Defaults to public.
    privateIp : str, optional
        The private IPv4 address to assign to the NAT Gateway. If you don't provide an address, a private IPv4 address will be automatically assigned.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    secondaryAllocationIds : [str], optional
        A list of secondary allocation EIP IDs for this NAT Gateway. To remove all secondary allocations an empty list should be specified.
    secondaryAllocationIdsRefs : [NatgatewayspecforproviderSecondaryallocationidsrefsitem], optional
        References to EIP in ec2 to populate secondaryAllocationIds.
    secondaryAllocationIdsSelector : NatgatewayspecforproviderSecondaryallocationidsselector, optional
        Selector for a list of EIP in ec2 to populate secondaryAllocationIds.
    secondaryPrivateIpAddressCount : float, optional
        [Private NAT Gateway only] The number of secondary private IPv4 addresses you want to assign to the NAT Gateway.
    secondaryPrivateIpAddresses : [str], optional
        A list of secondary private IPv4 addresses to assign to the NAT Gateway. To remove all secondary private addresses an empty list should be specified.
    subnetId : str, optional
        The Subnet ID of the subnet in which to place the NAT Gateway.
    subnetIdRef : NatgatewayspecforproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : NatgatewayspecforproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    allocationId? : str
    allocationIdRef? : NatgatewayspecforproviderAllocationidref
    allocationIdSelector? : NatgatewayspecforproviderAllocationidselector
    connectivityType? : str
    privateIp? : str
    region : str
    secondaryAllocationIds? : [str]
    secondaryAllocationIdsRefs? : [NatgatewayspecforproviderSecondaryallocationidsrefsitem]
    secondaryAllocationIdsSelector? : NatgatewayspecforproviderSecondaryallocationidsselector
    secondaryPrivateIpAddressCount? : float
    secondaryPrivateIpAddresses? : [str]
    subnetId? : str
    subnetIdRef? : NatgatewayspecforproviderSubnetidref
    subnetIdSelector? : NatgatewayspecforproviderSubnetidselector
    tags? : {str:str}

schema NatgatewayspecforproviderAllocationidref:
    """
    Reference to a EIP in ec2 to populate allocationId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : NatgatewayspecforproviderallocationidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : NatgatewayspecforproviderallocationidrefPolicy

schema NatgatewayspecforproviderallocationidrefPolicy:
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

schema NatgatewayspecforproviderAllocationidselector:
    """
    Selector for a EIP in ec2 to populate allocationId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : NatgatewayspecforproviderallocationidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : NatgatewayspecforproviderallocationidselectorPolicy

schema NatgatewayspecforproviderallocationidselectorPolicy:
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

schema NatgatewayspecforproviderSecondaryallocationidsrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : NatgatewayspecforprovidersecondaryallocationidsrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : NatgatewayspecforprovidersecondaryallocationidsrefsitemPolicy

schema NatgatewayspecforprovidersecondaryallocationidsrefsitemPolicy:
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

schema NatgatewayspecforproviderSecondaryallocationidsselector:
    """
    Selector for a list of EIP in ec2 to populate secondaryAllocationIds.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : NatgatewayspecforprovidersecondaryallocationidsselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : NatgatewayspecforprovidersecondaryallocationidsselectorPolicy

schema NatgatewayspecforprovidersecondaryallocationidsselectorPolicy:
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

schema NatgatewayspecforproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : NatgatewayspecforprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : NatgatewayspecforprovidersubnetidrefPolicy

schema NatgatewayspecforprovidersubnetidrefPolicy:
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

schema NatgatewayspecforproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : NatgatewayspecforprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : NatgatewayspecforprovidersubnetidselectorPolicy

schema NatgatewayspecforprovidersubnetidselectorPolicy:
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

schema NatgatewayspecInitprovider:
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
    allocationId : str, optional
        The Allocation ID of the Elastic IP address for the NAT Gateway. Required for connectivity_type of public.
    allocationIdRef : NatgatewayspecinitproviderAllocationidref, optional
        Reference to a EIP in ec2 to populate allocationId.
    allocationIdSelector : NatgatewayspecinitproviderAllocationidselector, optional
        Selector for a EIP in ec2 to populate allocationId.
    connectivityType : str, optional
        Connectivity type for the NAT Gateway. Valid values are private and public. Defaults to public.
    privateIp : str, optional
        The private IPv4 address to assign to the NAT Gateway. If you don't provide an address, a private IPv4 address will be automatically assigned.
    secondaryAllocationIds : [str], optional
        A list of secondary allocation EIP IDs for this NAT Gateway. To remove all secondary allocations an empty list should be specified.
    secondaryAllocationIdsRefs : [NatgatewayspecinitproviderSecondaryallocationidsrefsitem], optional
        References to EIP in ec2 to populate secondaryAllocationIds.
    secondaryAllocationIdsSelector : NatgatewayspecinitproviderSecondaryallocationidsselector, optional
        Selector for a list of EIP in ec2 to populate secondaryAllocationIds.
    secondaryPrivateIpAddressCount : float, optional
        [Private NAT Gateway only] The number of secondary private IPv4 addresses you want to assign to the NAT Gateway.
    secondaryPrivateIpAddresses : [str], optional
        A list of secondary private IPv4 addresses to assign to the NAT Gateway. To remove all secondary private addresses an empty list should be specified.
    subnetId : str, optional
        The Subnet ID of the subnet in which to place the NAT Gateway.
    subnetIdRef : NatgatewayspecinitproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : NatgatewayspecinitproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    allocationId? : str
    allocationIdRef? : NatgatewayspecinitproviderAllocationidref
    allocationIdSelector? : NatgatewayspecinitproviderAllocationidselector
    connectivityType? : str
    privateIp? : str
    secondaryAllocationIds? : [str]
    secondaryAllocationIdsRefs? : [NatgatewayspecinitproviderSecondaryallocationidsrefsitem]
    secondaryAllocationIdsSelector? : NatgatewayspecinitproviderSecondaryallocationidsselector
    secondaryPrivateIpAddressCount? : float
    secondaryPrivateIpAddresses? : [str]
    subnetId? : str
    subnetIdRef? : NatgatewayspecinitproviderSubnetidref
    subnetIdSelector? : NatgatewayspecinitproviderSubnetidselector
    tags? : {str:str}

schema NatgatewayspecinitproviderAllocationidref:
    """
    Reference to a EIP in ec2 to populate allocationId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : NatgatewayspecinitproviderallocationidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : NatgatewayspecinitproviderallocationidrefPolicy

schema NatgatewayspecinitproviderallocationidrefPolicy:
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

schema NatgatewayspecinitproviderAllocationidselector:
    """
    Selector for a EIP in ec2 to populate allocationId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : NatgatewayspecinitproviderallocationidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : NatgatewayspecinitproviderallocationidselectorPolicy

schema NatgatewayspecinitproviderallocationidselectorPolicy:
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

schema NatgatewayspecinitproviderSecondaryallocationidsrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : NatgatewayspecinitprovidersecondaryallocationidsrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : NatgatewayspecinitprovidersecondaryallocationidsrefsitemPolicy

schema NatgatewayspecinitprovidersecondaryallocationidsrefsitemPolicy:
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

schema NatgatewayspecinitproviderSecondaryallocationidsselector:
    """
    Selector for a list of EIP in ec2 to populate secondaryAllocationIds.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : NatgatewayspecinitprovidersecondaryallocationidsselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : NatgatewayspecinitprovidersecondaryallocationidsselectorPolicy

schema NatgatewayspecinitprovidersecondaryallocationidsselectorPolicy:
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

schema NatgatewayspecinitproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : NatgatewayspecinitprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : NatgatewayspecinitprovidersubnetidrefPolicy

schema NatgatewayspecinitprovidersubnetidrefPolicy:
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

schema NatgatewayspecinitproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : NatgatewayspecinitprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : NatgatewayspecinitprovidersubnetidselectorPolicy

schema NatgatewayspecinitprovidersubnetidselectorPolicy:
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

schema NatgatewayspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : NatgatewayspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : NatgatewayspecproviderconfigrefPolicy

schema NatgatewayspecproviderconfigrefPolicy:
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

schema NatgatewayspecWriteconnectionsecrettoref:
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

schema NatgatewayStatus:
    """
    NATGatewayStatus defines the observed state of NATGateway.

    Attributes
    ----------
    atProvider : NatgatewaystatusAtprovider, optional
        No description available.
    conditions : [NatgatewaystatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : NatgatewaystatusAtprovider
    conditions? : [NatgatewaystatusConditionsitem]
    observedGeneration? : int

schema NatgatewaystatusAtprovider:
    """
    NatgatewaystatusAtprovider schema.

    Attributes
    ----------
    allocationId : str, optional
        The Allocation ID of the Elastic IP address for the NAT Gateway. Required for connectivity_type of public.
    associationId : str, optional
        The association ID of the Elastic IP address that's associated with the NAT Gateway. Only available when connectivity_type is public.
    connectivityType : str, optional
        Connectivity type for the NAT Gateway. Valid values are private and public. Defaults to public.
    id : str, optional
        The ID of the NAT Gateway.
    networkInterfaceId : str, optional
        The ID of the network interface associated with the NAT Gateway.
    privateIp : str, optional
        The private IPv4 address to assign to the NAT Gateway. If you don't provide an address, a private IPv4 address will be automatically assigned.
    publicIp : str, optional
        The Elastic IP address associated with the NAT Gateway.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    secondaryAllocationIds : [str], optional
        A list of secondary allocation EIP IDs for this NAT Gateway. To remove all secondary allocations an empty list should be specified.
    secondaryPrivateIpAddressCount : float, optional
        [Private NAT Gateway only] The number of secondary private IPv4 addresses you want to assign to the NAT Gateway.
    secondaryPrivateIpAddresses : [str], optional
        A list of secondary private IPv4 addresses to assign to the NAT Gateway. To remove all secondary private addresses an empty list should be specified.
    subnetId : str, optional
        The Subnet ID of the subnet in which to place the NAT Gateway.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    """
    allocationId? : str
    associationId? : str
    connectivityType? : str
    id? : str
    networkInterfaceId? : str
    privateIp? : str
    publicIp? : str
    region? : str
    secondaryAllocationIds? : [str]
    secondaryPrivateIpAddressCount? : float
    secondaryPrivateIpAddresses? : [str]
    subnetId? : str
    tags? : {str:str}
    tagsAll? : {str:str}

schema NatgatewaystatusConditionsitem:
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