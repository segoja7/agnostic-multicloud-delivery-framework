"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Providerconfig:
    """
    A ProviderConfig configures the OpenTofu provider.

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
    spec : ProviderconfigSpec, required
        A ProviderConfigSpec defines the desired state of a ProviderConfig.
    status : ProviderconfigStatus, optional
        A ProviderConfigStatus reflects the observed state of a ProviderConfig.
    """
    apiVersion : str = "opentofu.upbound.io/v1beta1"
    kind : str = "ProviderConfig"
    metadata? : any
    spec : ProviderconfigSpec
    status? : ProviderconfigStatus

schema ProviderconfigSpec:
    """
    A ProviderConfigSpec defines the desired state of a ProviderConfig.

    Attributes
    ----------
    backendFile : str, optional
        Tofu backend file configuration content,
        it has the contents of the backend block as top-level attributes,
        without the need to wrap it in another opentofu or backend block.
        More details at https://opentofu.org/docs/language/settings/backends/configuration/#file.
    configuration : str, optional
        Configuration that should be injected into all workspaces that use
        this provider config, expressed as inline HCL. This can be used to
        automatically inject Terraform provider configuration blocks.
    credentials : [ProviderconfigspecCredentialsitem], optional
        Credentials required to authenticate to this provider.
    pluginCache : bool, optional
        PluginCache enables tofu provider plugin caching mechanism
        https://opentofu.org/docs/cli/config/config-file/#provider-plugin-cache
    """
    backendFile? : str
    configuration? : str
    credentials? : [ProviderconfigspecCredentialsitem]
    pluginCache? : bool

schema ProviderconfigspecCredentialsitem:
    """
    ProviderCredentials required to authenticate.

    Attributes
    ----------
    env : ProviderconfigspeccredentialsitemEnv, optional
        Env is a reference to an environment variable that contains credentials
        that must be used to connect to the provider.
    filename : str, required
        Filename (relative to main.tf) to which these provider credentials
        should be written.
    fs : ProviderconfigspeccredentialsitemFs, optional
        Fs is a reference to a filesystem location that contains credentials that
        must be used to connect to the provider.
    secretRef : ProviderconfigspeccredentialsitemSecretref, optional
        A SecretRef is a reference to a secret key that contains the credentials
        that must be used to connect to the provider.
    source : "None" | "Secret" | "Environment" | "Filesystem", required
        Source of the provider credentials.
    """
    env? : ProviderconfigspeccredentialsitemEnv
    filename : str
    fs? : ProviderconfigspeccredentialsitemFs
    secretRef? : ProviderconfigspeccredentialsitemSecretref
    source : "None" | "Secret" | "Environment" | "Filesystem"

schema ProviderconfigspeccredentialsitemEnv:
    """
    Env is a reference to an environment variable that contains credentials
    that must be used to connect to the provider.

    Attributes
    ----------
    name : str, required
        Name is the name of an environment variable.
    """
    name : str

schema ProviderconfigspeccredentialsitemFs:
    """
    Fs is a reference to a filesystem location that contains credentials that
    must be used to connect to the provider.

    Attributes
    ----------
    path : str, required
        Path is a filesystem path.
    """
    path : str

schema ProviderconfigspeccredentialsitemSecretref:
    """
    A SecretRef is a reference to a secret key that contains the credentials
    that must be used to connect to the provider.

    Attributes
    ----------
    key : str, required
        The key to select.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema ProviderconfigStatus:
    """
    A ProviderConfigStatus reflects the observed state of a ProviderConfig.

    Attributes
    ----------
    conditions : [ProviderconfigstatusConditionsitem], optional
        Conditions of the resource.
    users : int, optional
        Users of this provider configuration.
    """
    conditions? : [ProviderconfigstatusConditionsitem]
    users? : int

schema ProviderconfigstatusConditionsitem:
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