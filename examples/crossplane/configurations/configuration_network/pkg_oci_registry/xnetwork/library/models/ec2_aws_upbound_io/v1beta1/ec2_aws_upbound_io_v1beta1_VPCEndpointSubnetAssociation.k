"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Vpcendpointsubnetassociation:
    """
    VPCEndpointSubnetAssociation is the Schema for the VPCEndpointSubnetAssociations API. Provides a resource to create an association between a VPC endpoint and a subnet.

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
    spec : VpcendpointsubnetassociationSpec, required
        VPCEndpointSubnetAssociationSpec defines the desired state of VPCEndpointSubnetAssociation
    status : VpcendpointsubnetassociationStatus, optional
        VPCEndpointSubnetAssociationStatus defines the observed state of VPCEndpointSubnetAssociation.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "VPCEndpointSubnetAssociation"
    metadata? : any
    spec : VpcendpointsubnetassociationSpec
    status? : VpcendpointsubnetassociationStatus

schema VpcendpointsubnetassociationSpec:
    """
    VPCEndpointSubnetAssociationSpec defines the desired state of VPCEndpointSubnetAssociation

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
    forProvider : VpcendpointsubnetassociationspecForprovider, required
        No description available.
    initProvider : VpcendpointsubnetassociationspecInitprovider, optional
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
    providerConfigRef : VpcendpointsubnetassociationspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : VpcendpointsubnetassociationspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : VpcendpointsubnetassociationspecForprovider
    initProvider? : VpcendpointsubnetassociationspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : VpcendpointsubnetassociationspecProviderconfigref
    writeConnectionSecretToRef? : VpcendpointsubnetassociationspecWriteconnectionsecrettoref

schema VpcendpointsubnetassociationspecForprovider:
    """
    VpcendpointsubnetassociationspecForprovider schema.

    Attributes
    ----------
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    subnetId : str, optional
        The ID of the subnet to be associated with the VPC endpoint.
    subnetIdRef : VpcendpointsubnetassociationspecforproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : VpcendpointsubnetassociationspecforproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    vpcEndpointId : str, optional
        The ID of the VPC endpoint with which the subnet will be associated.
    vpcEndpointIdRef : VpcendpointsubnetassociationspecforproviderVpcendpointidref, optional
        Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.
    vpcEndpointIdSelector : VpcendpointsubnetassociationspecforproviderVpcendpointidselector, optional
        Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.
    """
    region : str
    subnetId? : str
    subnetIdRef? : VpcendpointsubnetassociationspecforproviderSubnetidref
    subnetIdSelector? : VpcendpointsubnetassociationspecforproviderSubnetidselector
    vpcEndpointId? : str
    vpcEndpointIdRef? : VpcendpointsubnetassociationspecforproviderVpcendpointidref
    vpcEndpointIdSelector? : VpcendpointsubnetassociationspecforproviderVpcendpointidselector

schema VpcendpointsubnetassociationspecforproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsubnetassociationspecforprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsubnetassociationspecforprovidersubnetidrefPolicy

schema VpcendpointsubnetassociationspecforprovidersubnetidrefPolicy:
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

schema VpcendpointsubnetassociationspecforproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsubnetassociationspecforprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsubnetassociationspecforprovidersubnetidselectorPolicy

schema VpcendpointsubnetassociationspecforprovidersubnetidselectorPolicy:
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

schema VpcendpointsubnetassociationspecforproviderVpcendpointidref:
    """
    Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsubnetassociationspecforprovidervpcendpointidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsubnetassociationspecforprovidervpcendpointidrefPolicy

schema VpcendpointsubnetassociationspecforprovidervpcendpointidrefPolicy:
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

schema VpcendpointsubnetassociationspecforproviderVpcendpointidselector:
    """
    Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsubnetassociationspecforprovidervpcendpointidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsubnetassociationspecforprovidervpcendpointidselectorPolicy

schema VpcendpointsubnetassociationspecforprovidervpcendpointidselectorPolicy:
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

schema VpcendpointsubnetassociationspecInitprovider:
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
    subnetId : str, optional
        The ID of the subnet to be associated with the VPC endpoint.
    subnetIdRef : VpcendpointsubnetassociationspecinitproviderSubnetidref, optional
        Reference to a Subnet in ec2 to populate subnetId.
    subnetIdSelector : VpcendpointsubnetassociationspecinitproviderSubnetidselector, optional
        Selector for a Subnet in ec2 to populate subnetId.
    vpcEndpointId : str, optional
        The ID of the VPC endpoint with which the subnet will be associated.
    vpcEndpointIdRef : VpcendpointsubnetassociationspecinitproviderVpcendpointidref, optional
        Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.
    vpcEndpointIdSelector : VpcendpointsubnetassociationspecinitproviderVpcendpointidselector, optional
        Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.
    """
    subnetId? : str
    subnetIdRef? : VpcendpointsubnetassociationspecinitproviderSubnetidref
    subnetIdSelector? : VpcendpointsubnetassociationspecinitproviderSubnetidselector
    vpcEndpointId? : str
    vpcEndpointIdRef? : VpcendpointsubnetassociationspecinitproviderVpcendpointidref
    vpcEndpointIdSelector? : VpcendpointsubnetassociationspecinitproviderVpcendpointidselector

schema VpcendpointsubnetassociationspecinitproviderSubnetidref:
    """
    Reference to a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsubnetassociationspecinitprovidersubnetidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsubnetassociationspecinitprovidersubnetidrefPolicy

schema VpcendpointsubnetassociationspecinitprovidersubnetidrefPolicy:
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

schema VpcendpointsubnetassociationspecinitproviderSubnetidselector:
    """
    Selector for a Subnet in ec2 to populate subnetId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsubnetassociationspecinitprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsubnetassociationspecinitprovidersubnetidselectorPolicy

schema VpcendpointsubnetassociationspecinitprovidersubnetidselectorPolicy:
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

schema VpcendpointsubnetassociationspecinitproviderVpcendpointidref:
    """
    Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsubnetassociationspecinitprovidervpcendpointidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsubnetassociationspecinitprovidervpcendpointidrefPolicy

schema VpcendpointsubnetassociationspecinitprovidervpcendpointidrefPolicy:
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

schema VpcendpointsubnetassociationspecinitproviderVpcendpointidselector:
    """
    Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsubnetassociationspecinitprovidervpcendpointidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsubnetassociationspecinitprovidervpcendpointidselectorPolicy

schema VpcendpointsubnetassociationspecinitprovidervpcendpointidselectorPolicy:
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

schema VpcendpointsubnetassociationspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsubnetassociationspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsubnetassociationspecproviderconfigrefPolicy

schema VpcendpointsubnetassociationspecproviderconfigrefPolicy:
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

schema VpcendpointsubnetassociationspecWriteconnectionsecrettoref:
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

schema VpcendpointsubnetassociationStatus:
    """
    VPCEndpointSubnetAssociationStatus defines the observed state of VPCEndpointSubnetAssociation.

    Attributes
    ----------
    atProvider : VpcendpointsubnetassociationstatusAtprovider, optional
        No description available.
    conditions : [VpcendpointsubnetassociationstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : VpcendpointsubnetassociationstatusAtprovider
    conditions? : [VpcendpointsubnetassociationstatusConditionsitem]
    observedGeneration? : int

schema VpcendpointsubnetassociationstatusAtprovider:
    """
    VpcendpointsubnetassociationstatusAtprovider schema.

    Attributes
    ----------
    id : str, optional
        The ID of the association.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    subnetId : str, optional
        The ID of the subnet to be associated with the VPC endpoint.
    vpcEndpointId : str, optional
        The ID of the VPC endpoint with which the subnet will be associated.
    """
    id? : str
    region? : str
    subnetId? : str
    vpcEndpointId? : str

schema VpcendpointsubnetassociationstatusConditionsitem:
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