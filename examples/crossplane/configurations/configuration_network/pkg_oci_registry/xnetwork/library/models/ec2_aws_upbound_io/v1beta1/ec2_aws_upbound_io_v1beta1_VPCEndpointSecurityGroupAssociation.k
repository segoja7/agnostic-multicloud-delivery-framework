"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Vpcendpointsecuritygroupassociation:
    """
    VPCEndpointSecurityGroupAssociation is the Schema for the VPCEndpointSecurityGroupAssociations API. Provides a resource to create an association between a VPC endpoint and a security group.

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
    spec : VpcendpointsecuritygroupassociationSpec, required
        VPCEndpointSecurityGroupAssociationSpec defines the desired state of VPCEndpointSecurityGroupAssociation
    status : VpcendpointsecuritygroupassociationStatus, optional
        VPCEndpointSecurityGroupAssociationStatus defines the observed state of VPCEndpointSecurityGroupAssociation.
    """
    apiVersion : str = "ec2.aws.upbound.io/v1beta1"
    kind : str = "VPCEndpointSecurityGroupAssociation"
    metadata? : any
    spec : VpcendpointsecuritygroupassociationSpec
    status? : VpcendpointsecuritygroupassociationStatus

schema VpcendpointsecuritygroupassociationSpec:
    """
    VPCEndpointSecurityGroupAssociationSpec defines the desired state of VPCEndpointSecurityGroupAssociation

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
    forProvider : VpcendpointsecuritygroupassociationspecForprovider, required
        No description available.
    initProvider : VpcendpointsecuritygroupassociationspecInitprovider, optional
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
    providerConfigRef : VpcendpointsecuritygroupassociationspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : VpcendpointsecuritygroupassociationspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : VpcendpointsecuritygroupassociationspecForprovider
    initProvider? : VpcendpointsecuritygroupassociationspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : VpcendpointsecuritygroupassociationspecProviderconfigref
    writeConnectionSecretToRef? : VpcendpointsecuritygroupassociationspecWriteconnectionsecrettoref

schema VpcendpointsecuritygroupassociationspecForprovider:
    """
    VpcendpointsecuritygroupassociationspecForprovider schema.

    Attributes
    ----------
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    replaceDefaultAssociation : bool, optional
        Whether this association should replace the association with the VPC's default security group that is created when no security groups are specified during VPC endpoint creation. At most 1 association per-VPC endpoint should be configured with replace_default_association = true. false should be used when importing resources.
    securityGroupId : str, optional
        The ID of the security group to be associated with the VPC endpoint.
    securityGroupIdRef : VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidref, optional
        Reference to a SecurityGroup in ec2 to populate securityGroupId.
    securityGroupIdSelector : VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidselector, optional
        Selector for a SecurityGroup in ec2 to populate securityGroupId.
    vpcEndpointId : str, optional
        The ID of the VPC endpoint with which the security group will be associated.
    vpcEndpointIdRef : VpcendpointsecuritygroupassociationspecforproviderVpcendpointidref, optional
        Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.
    vpcEndpointIdSelector : VpcendpointsecuritygroupassociationspecforproviderVpcendpointidselector, optional
        Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.
    """
    region : str
    replaceDefaultAssociation? : bool
    securityGroupId? : str
    securityGroupIdRef? : VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidref
    securityGroupIdSelector? : VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidselector
    vpcEndpointId? : str
    vpcEndpointIdRef? : VpcendpointsecuritygroupassociationspecforproviderVpcendpointidref
    vpcEndpointIdSelector? : VpcendpointsecuritygroupassociationspecforproviderVpcendpointidselector

schema VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidref:
    """
    Reference to a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsecuritygroupassociationspecforprovidersecuritygroupidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsecuritygroupassociationspecforprovidersecuritygroupidrefPolicy

schema VpcendpointsecuritygroupassociationspecforprovidersecuritygroupidrefPolicy:
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

schema VpcendpointsecuritygroupassociationspecforproviderSecuritygroupidselector:
    """
    Selector for a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsecuritygroupassociationspecforprovidersecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsecuritygroupassociationspecforprovidersecuritygroupidselectorPolicy

schema VpcendpointsecuritygroupassociationspecforprovidersecuritygroupidselectorPolicy:
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

schema VpcendpointsecuritygroupassociationspecforproviderVpcendpointidref:
    """
    Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsecuritygroupassociationspecforprovidervpcendpointidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsecuritygroupassociationspecforprovidervpcendpointidrefPolicy

schema VpcendpointsecuritygroupassociationspecforprovidervpcendpointidrefPolicy:
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

schema VpcendpointsecuritygroupassociationspecforproviderVpcendpointidselector:
    """
    Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsecuritygroupassociationspecforprovidervpcendpointidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsecuritygroupassociationspecforprovidervpcendpointidselectorPolicy

schema VpcendpointsecuritygroupassociationspecforprovidervpcendpointidselectorPolicy:
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

schema VpcendpointsecuritygroupassociationspecInitprovider:
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
    replaceDefaultAssociation : bool, optional
        Whether this association should replace the association with the VPC's default security group that is created when no security groups are specified during VPC endpoint creation. At most 1 association per-VPC endpoint should be configured with replace_default_association = true. false should be used when importing resources.
    securityGroupId : str, optional
        The ID of the security group to be associated with the VPC endpoint.
    securityGroupIdRef : VpcendpointsecuritygroupassociationspecinitproviderSecuritygroupidref, optional
        Reference to a SecurityGroup in ec2 to populate securityGroupId.
    securityGroupIdSelector : VpcendpointsecuritygroupassociationspecinitproviderSecuritygroupidselector, optional
        Selector for a SecurityGroup in ec2 to populate securityGroupId.
    vpcEndpointId : str, optional
        The ID of the VPC endpoint with which the security group will be associated.
    vpcEndpointIdRef : VpcendpointsecuritygroupassociationspecinitproviderVpcendpointidref, optional
        Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.
    vpcEndpointIdSelector : VpcendpointsecuritygroupassociationspecinitproviderVpcendpointidselector, optional
        Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.
    """
    replaceDefaultAssociation? : bool
    securityGroupId? : str
    securityGroupIdRef? : VpcendpointsecuritygroupassociationspecinitproviderSecuritygroupidref
    securityGroupIdSelector? : VpcendpointsecuritygroupassociationspecinitproviderSecuritygroupidselector
    vpcEndpointId? : str
    vpcEndpointIdRef? : VpcendpointsecuritygroupassociationspecinitproviderVpcendpointidref
    vpcEndpointIdSelector? : VpcendpointsecuritygroupassociationspecinitproviderVpcendpointidselector

schema VpcendpointsecuritygroupassociationspecinitproviderSecuritygroupidref:
    """
    Reference to a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsecuritygroupassociationspecinitprovidersecuritygroupidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsecuritygroupassociationspecinitprovidersecuritygroupidrefPolicy

schema VpcendpointsecuritygroupassociationspecinitprovidersecuritygroupidrefPolicy:
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

schema VpcendpointsecuritygroupassociationspecinitproviderSecuritygroupidselector:
    """
    Selector for a SecurityGroup in ec2 to populate securityGroupId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsecuritygroupassociationspecinitprovidersecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsecuritygroupassociationspecinitprovidersecuritygroupidselectorPolicy

schema VpcendpointsecuritygroupassociationspecinitprovidersecuritygroupidselectorPolicy:
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

schema VpcendpointsecuritygroupassociationspecinitproviderVpcendpointidref:
    """
    Reference to a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsecuritygroupassociationspecinitprovidervpcendpointidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsecuritygroupassociationspecinitprovidervpcendpointidrefPolicy

schema VpcendpointsecuritygroupassociationspecinitprovidervpcendpointidrefPolicy:
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

schema VpcendpointsecuritygroupassociationspecinitproviderVpcendpointidselector:
    """
    Selector for a VPCEndpoint in ec2 to populate vpcEndpointId.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : VpcendpointsecuritygroupassociationspecinitprovidervpcendpointidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : VpcendpointsecuritygroupassociationspecinitprovidervpcendpointidselectorPolicy

schema VpcendpointsecuritygroupassociationspecinitprovidervpcendpointidselectorPolicy:
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

schema VpcendpointsecuritygroupassociationspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : VpcendpointsecuritygroupassociationspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : VpcendpointsecuritygroupassociationspecproviderconfigrefPolicy

schema VpcendpointsecuritygroupassociationspecproviderconfigrefPolicy:
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

schema VpcendpointsecuritygroupassociationspecWriteconnectionsecrettoref:
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

schema VpcendpointsecuritygroupassociationStatus:
    """
    VPCEndpointSecurityGroupAssociationStatus defines the observed state of VPCEndpointSecurityGroupAssociation.

    Attributes
    ----------
    atProvider : VpcendpointsecuritygroupassociationstatusAtprovider, optional
        No description available.
    conditions : [VpcendpointsecuritygroupassociationstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : VpcendpointsecuritygroupassociationstatusAtprovider
    conditions? : [VpcendpointsecuritygroupassociationstatusConditionsitem]
    observedGeneration? : int

schema VpcendpointsecuritygroupassociationstatusAtprovider:
    """
    VpcendpointsecuritygroupassociationstatusAtprovider schema.

    Attributes
    ----------
    id : str, optional
        The ID of the association.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    replaceDefaultAssociation : bool, optional
        Whether this association should replace the association with the VPC's default security group that is created when no security groups are specified during VPC endpoint creation. At most 1 association per-VPC endpoint should be configured with replace_default_association = true. false should be used when importing resources.
    securityGroupId : str, optional
        The ID of the security group to be associated with the VPC endpoint.
    vpcEndpointId : str, optional
        The ID of the VPC endpoint with which the security group will be associated.
    """
    id? : str
    region? : str
    replaceDefaultAssociation? : bool
    securityGroupId? : str
    vpcEndpointId? : str

schema VpcendpointsecuritygroupassociationstatusConditionsitem:
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