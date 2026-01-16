"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Workspace:
    """
    A Workspace of OpenTofu Configuration.

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
    spec : WorkspaceSpec, required
        A WorkspaceSpec defines the desired state of a Workspace.
    status : WorkspaceStatus, optional
        A WorkspaceStatus represents the observed state of a Workspace.
    """
    apiVersion : str = "opentofu.upbound.io/v1beta1"
    kind : str = "Workspace"
    metadata? : any
    spec : WorkspaceSpec
    status? : WorkspaceStatus

schema WorkspaceSpec:
    """
    A WorkspaceSpec defines the desired state of a Workspace.

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
    forProvider : WorkspacespecForprovider, required
        WorkspaceParameters are the configurable fields of a Workspace.
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
    providerConfigRef : WorkspacespecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : WorkspacespecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : WorkspacespecForprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : WorkspacespecProviderconfigref
    writeConnectionSecretToRef? : WorkspacespecWriteconnectionsecrettoref

schema WorkspacespecForprovider:
    """
    WorkspaceParameters are the configurable fields of a Workspace.

    Attributes
    ----------
    applyArgs : [str], optional
        Arguments to be included in the tofu apply CLI command
    destroyArgs : [str], optional
        Arguments to be included in the tofu destroy CLI command
    enableTofuCLILogging : bool, optional
        Boolean value to indicate CLI logging of tofu execution is enabled or not
    entrypoint : str, optional
        Entrypoint for `tofu init` within the module
    env : [WorkspacespecforproviderEnvitem], optional
        Environment variables.
    initArgs : [str], optional
        Arguments to be included in the tofu init CLI command
    inlineFormat : "HCL" | "JSON", optional
        Specifies the format of the inline Terraform content
        if Source is 'Inline'
    module : str, required
        The root module of this workspace; i.e. the module containing its main.tf
        file. When the workspace's source is 'Remote' (the default) this can be
        any address supported by tofu init -from-module, for example a git
        repository or an S3 bucket. When the workspace's source is 'Inline' the
        content of a simple main.tf or main.tf.json file may be written inline.
    planArgs : [str], optional
        Arguments to be included in the tofu plan CLI command
    source : "Remote" | "Inline", required
        Source of the root module of this workspace.
    varFiles : [WorkspacespecforproviderVarfilesitem], optional
        Files of configuration variables. Explicitly declared vars take
        precedence.
    varmap : any, optional
        Terraform Variable Map. Should be a valid JSON representation of the input vars
    vars : [WorkspacespecforproviderVarsitem], optional
        Configuration variables.
    """
    applyArgs? : [str]
    destroyArgs? : [str]
    enableTofuCLILogging? : bool
    entrypoint? : str
    env? : [WorkspacespecforproviderEnvitem]
    initArgs? : [str]
    inlineFormat? : "HCL" | "JSON"
    module : str
    planArgs? : [str]
    source : "Remote" | "Inline"
    varFiles? : [WorkspacespecforproviderVarfilesitem]
    varmap? : any
    vars? : [WorkspacespecforproviderVarsitem]

schema WorkspacespecforproviderEnvitem:
    """
    An EnvVar specifies an environment variable to be set for the workspace.

    Attributes
    ----------
    configMapKeyRef : WorkspacespecforproviderenvitemConfigmapkeyref, optional
        A ConfigMap key containing the desired env var value.
    name : str, required
        No description available.
    secretKeyRef : WorkspacespecforproviderenvitemSecretkeyref, optional
        A Secret key containing the desired env var value.
    value : str, optional
        No description available.
    """
    configMapKeyRef? : WorkspacespecforproviderenvitemConfigmapkeyref
    name : str
    secretKeyRef? : WorkspacespecforproviderenvitemSecretkeyref
    value? : str

schema WorkspacespecforproviderenvitemConfigmapkeyref:
    """
    A ConfigMap key containing the desired env var value.

    Attributes
    ----------
    key : str, required
        Key within the referenced resource.
    name : str, required
        Name of the referenced resource.
    namespace : str, required
        Namespace of the referenced resource.
    """
    key : str
    name : str
    namespace : str

schema WorkspacespecforproviderenvitemSecretkeyref:
    """
    A Secret key containing the desired env var value.

    Attributes
    ----------
    key : str, required
        Key within the referenced resource.
    name : str, required
        Name of the referenced resource.
    namespace : str, required
        Namespace of the referenced resource.
    """
    key : str
    name : str
    namespace : str

schema WorkspacespecforproviderVarfilesitem:
    """
    A VarFile is a file containing many Terraform variables.

    Attributes
    ----------
    configMapKeyRef : WorkspacespecforprovidervarfilesitemConfigmapkeyref, optional
        A ConfigMap key containing the vars file.
    format : "HCL" | "JSON", optional
        Format of this vars file.
    secretKeyRef : WorkspacespecforprovidervarfilesitemSecretkeyref, optional
        A Secret key containing the vars file.
    source : "ConfigMapKey" | "SecretKey", required
        Source of this vars file.
    """
    configMapKeyRef? : WorkspacespecforprovidervarfilesitemConfigmapkeyref
    format? : "HCL" | "JSON"
    secretKeyRef? : WorkspacespecforprovidervarfilesitemSecretkeyref
    source : "ConfigMapKey" | "SecretKey"

schema WorkspacespecforprovidervarfilesitemConfigmapkeyref:
    """
    A ConfigMap key containing the vars file.

    Attributes
    ----------
    key : str, required
        Key within the referenced resource.
    name : str, required
        Name of the referenced resource.
    namespace : str, required
        Namespace of the referenced resource.
    """
    key : str
    name : str
    namespace : str

schema WorkspacespecforprovidervarfilesitemSecretkeyref:
    """
    A Secret key containing the vars file.

    Attributes
    ----------
    key : str, required
        Key within the referenced resource.
    name : str, required
        Name of the referenced resource.
    namespace : str, required
        Namespace of the referenced resource.
    """
    key : str
    name : str
    namespace : str

schema WorkspacespecforproviderVarsitem:
    """
    A Var represents a tofu configuration variable.

    Attributes
    ----------
    key : str, required
        No description available.
    value : str, required
        No description available.
    """
    key : str
    value : str

schema WorkspacespecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : WorkspacespecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : WorkspacespecproviderconfigrefPolicy

schema WorkspacespecproviderconfigrefPolicy:
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

schema WorkspacespecWriteconnectionsecrettoref:
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

schema WorkspaceStatus:
    """
    A WorkspaceStatus represents the observed state of a Workspace.

    Attributes
    ----------
    atProvider : WorkspacestatusAtprovider, optional
        WorkspaceObservation are the observable fields of a Workspace.
    conditions : [WorkspacestatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : WorkspacestatusAtprovider
    conditions? : [WorkspacestatusConditionsitem]
    observedGeneration? : int

schema WorkspacestatusAtprovider:
    """
    WorkspaceObservation are the observable fields of a Workspace.

    Attributes
    ----------
    checksum : str, optional
        No description available.
    outputs : {str:any}, optional
        No description available.
    """
    checksum? : str
    outputs? : {str:any}

schema WorkspacestatusConditionsitem:
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