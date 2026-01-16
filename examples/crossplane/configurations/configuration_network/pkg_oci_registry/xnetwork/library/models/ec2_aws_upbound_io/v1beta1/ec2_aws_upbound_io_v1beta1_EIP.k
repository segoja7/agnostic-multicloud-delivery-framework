"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Eip:
    """
    EIP is the Schema for the EIPs API. Provides an Elastic IP resource.

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
    spec : EipSpec, required
        EIPSpec defines the desired state of EIP
    status : EipStatus, optional
        EIPStatus defines the observed state of EIP.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "EIP"
    metadata? : any
    spec : EipSpec
    status? : EipStatus

schema EipSpec:
    """
    EIPSpec defines the desired state of EIP

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
    forProvider : EipspecForprovider, required
        No description available.
    initProvider : EipspecInitprovider, optional
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
    providerConfigRef : EipspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : EipspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : EipspecForprovider
    initProvider? : EipspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : EipspecProviderconfigref
    writeConnectionSecretToRef? : EipspecWriteconnectionsecrettoref

schema EipspecForprovider:
    """
    EipspecForprovider schema.

    Attributes
    ----------
    address : str, optional
        IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs.
    associateWithPrivateIp : str, optional
        User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address.
    customerOwnedIpv4Pool : str, optional
        ID  of a customer-owned address pool. For more on customer owned IP addressed check out Customer-owned IP addresses guide.
    domain : str, optional
        Indicates if this EIP is for use in VPC (vpc).
    instance : str, optional
        EC2 instance ID.
    instanceRef : EipspecforproviderInstanceref, optional
        Reference to a Instance in ec2 to populate instance.
    instanceSelector : EipspecforproviderInstanceselector, optional
        Selector for a Instance in ec2 to populate instance.
    ipamPoolId : str, optional
        The ID of an IPAM pool which has an Amazon-provided or BYOIP public IPv4 CIDR provisioned to it.
    networkBorderGroup : str, optional
        Location from which the IP address is advertised. Use this parameter to limit the address to this location.
    networkInterface : str, optional
        Network interface ID to associate with.
    networkInterfaceRef : EipspecforproviderNetworkinterfaceref, optional
        Reference to a NetworkInterface in ec2 to populate networkInterface.
    networkInterfaceSelector : EipspecforproviderNetworkinterfaceselector, optional
        Selector for a NetworkInterface in ec2 to populate networkInterface.
    publicIpv4Pool : str, optional
        EC2 IPv4 address pool identifier or amazon.
        This option is only available for VPC EIPs.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    address? : str
    associateWithPrivateIp? : str
    customerOwnedIpv4Pool? : str
    domain? : str
    instance? : str
    instanceRef? : EipspecforproviderInstanceref
    instanceSelector? : EipspecforproviderInstanceselector
    ipamPoolId? : str
    networkBorderGroup? : str
    networkInterface? : str
    networkInterfaceRef? : EipspecforproviderNetworkinterfaceref
    networkInterfaceSelector? : EipspecforproviderNetworkinterfaceselector
    publicIpv4Pool? : str
    region : str
    tags? : {str:str}

schema EipspecforproviderInstanceref:
    """
    Reference to a Instance in ec2 to populate instance.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : EipspecforproviderinstancerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : EipspecforproviderinstancerefPolicy

schema EipspecforproviderinstancerefPolicy:
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

schema EipspecforproviderInstanceselector:
    """
    Selector for a Instance in ec2 to populate instance.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : EipspecforproviderinstanceselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : EipspecforproviderinstanceselectorPolicy

schema EipspecforproviderinstanceselectorPolicy:
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

schema EipspecforproviderNetworkinterfaceref:
    """
    Reference to a NetworkInterface in ec2 to populate networkInterface.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : EipspecforprovidernetworkinterfacerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : EipspecforprovidernetworkinterfacerefPolicy

schema EipspecforprovidernetworkinterfacerefPolicy:
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

schema EipspecforproviderNetworkinterfaceselector:
    """
    Selector for a NetworkInterface in ec2 to populate networkInterface.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : EipspecforprovidernetworkinterfaceselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : EipspecforprovidernetworkinterfaceselectorPolicy

schema EipspecforprovidernetworkinterfaceselectorPolicy:
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

schema EipspecInitprovider:
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
    address : str, optional
        IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs.
    associateWithPrivateIp : str, optional
        User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address.
    customerOwnedIpv4Pool : str, optional
        ID  of a customer-owned address pool. For more on customer owned IP addressed check out Customer-owned IP addresses guide.
    domain : str, optional
        Indicates if this EIP is for use in VPC (vpc).
    instance : str, optional
        EC2 instance ID.
    instanceRef : EipspecinitproviderInstanceref, optional
        Reference to a Instance in ec2 to populate instance.
    instanceSelector : EipspecinitproviderInstanceselector, optional
        Selector for a Instance in ec2 to populate instance.
    ipamPoolId : str, optional
        The ID of an IPAM pool which has an Amazon-provided or BYOIP public IPv4 CIDR provisioned to it.
    networkBorderGroup : str, optional
        Location from which the IP address is advertised. Use this parameter to limit the address to this location.
    networkInterface : str, optional
        Network interface ID to associate with.
    networkInterfaceRef : EipspecinitproviderNetworkinterfaceref, optional
        Reference to a NetworkInterface in ec2 to populate networkInterface.
    networkInterfaceSelector : EipspecinitproviderNetworkinterfaceselector, optional
        Selector for a NetworkInterface in ec2 to populate networkInterface.
    publicIpv4Pool : str, optional
        EC2 IPv4 address pool identifier or amazon.
        This option is only available for VPC EIPs.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    address? : str
    associateWithPrivateIp? : str
    customerOwnedIpv4Pool? : str
    domain? : str
    instance? : str
    instanceRef? : EipspecinitproviderInstanceref
    instanceSelector? : EipspecinitproviderInstanceselector
    ipamPoolId? : str
    networkBorderGroup? : str
    networkInterface? : str
    networkInterfaceRef? : EipspecinitproviderNetworkinterfaceref
    networkInterfaceSelector? : EipspecinitproviderNetworkinterfaceselector
    publicIpv4Pool? : str
    tags? : {str:str}

schema EipspecinitproviderInstanceref:
    """
    Reference to a Instance in ec2 to populate instance.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : EipspecinitproviderinstancerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : EipspecinitproviderinstancerefPolicy

schema EipspecinitproviderinstancerefPolicy:
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

schema EipspecinitproviderInstanceselector:
    """
    Selector for a Instance in ec2 to populate instance.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : EipspecinitproviderinstanceselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : EipspecinitproviderinstanceselectorPolicy

schema EipspecinitproviderinstanceselectorPolicy:
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

schema EipspecinitproviderNetworkinterfaceref:
    """
    Reference to a NetworkInterface in ec2 to populate networkInterface.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : EipspecinitprovidernetworkinterfacerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : EipspecinitprovidernetworkinterfacerefPolicy

schema EipspecinitprovidernetworkinterfacerefPolicy:
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

schema EipspecinitproviderNetworkinterfaceselector:
    """
    Selector for a NetworkInterface in ec2 to populate networkInterface.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : EipspecinitprovidernetworkinterfaceselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : EipspecinitprovidernetworkinterfaceselectorPolicy

schema EipspecinitprovidernetworkinterfaceselectorPolicy:
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

schema EipspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : EipspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : EipspecproviderconfigrefPolicy

schema EipspecproviderconfigrefPolicy:
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

schema EipspecWriteconnectionsecrettoref:
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

schema EipStatus:
    """
    EIPStatus defines the observed state of EIP.

    Attributes
    ----------
    atProvider : EipstatusAtprovider, optional
        No description available.
    conditions : [EipstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : EipstatusAtprovider
    conditions? : [EipstatusConditionsitem]
    observedGeneration? : int

schema EipstatusAtprovider:
    """
    EipstatusAtprovider schema.

    Attributes
    ----------
    address : str, optional
        IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs.
    allocationId : str, optional
        ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC.
    arn : str, optional
        No description available.
    associateWithPrivateIp : str, optional
        User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address.
    associationId : str, optional
        ID representing the association of the address with an instance in a VPC.
    carrierIp : str, optional
        Carrier IP address.
    customerOwnedIp : str, optional
        Customer owned IP.
    customerOwnedIpv4Pool : str, optional
        ID  of a customer-owned address pool. For more on customer owned IP addressed check out Customer-owned IP addresses guide.
    domain : str, optional
        Indicates if this EIP is for use in VPC (vpc).
    id : str, optional
        Contains the EIP allocation ID.
    instance : str, optional
        EC2 instance ID.
    ipamPoolId : str, optional
        The ID of an IPAM pool which has an Amazon-provided or BYOIP public IPv4 CIDR provisioned to it.
    networkBorderGroup : str, optional
        Location from which the IP address is advertised. Use this parameter to limit the address to this location.
    networkInterface : str, optional
        Network interface ID to associate with.
    privateDns : str, optional
        The Private DNS associated with the Elastic IP address (if in VPC).
    privateIp : str, optional
        Contains the private IP address (if in VPC).
    ptrRecord : str, optional
        The DNS pointer (PTR) record for the IP address.
    publicDns : str, optional
        Public DNS associated with the Elastic IP address.
    publicIp : str, optional
        Contains the public IP address.
    publicIpv4Pool : str, optional
        EC2 IPv4 address pool identifier or amazon.
        This option is only available for VPC EIPs.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    """
    address? : str
    allocationId? : str
    arn? : str
    associateWithPrivateIp? : str
    associationId? : str
    carrierIp? : str
    customerOwnedIp? : str
    customerOwnedIpv4Pool? : str
    domain? : str
    id? : str
    instance? : str
    ipamPoolId? : str
    networkBorderGroup? : str
    networkInterface? : str
    privateDns? : str
    privateIp? : str
    ptrRecord? : str
    publicDns? : str
    publicIp? : str
    publicIpv4Pool? : str
    region? : str
    tags? : {str:str}
    tagsAll? : {str:str}

schema EipstatusConditionsitem:
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