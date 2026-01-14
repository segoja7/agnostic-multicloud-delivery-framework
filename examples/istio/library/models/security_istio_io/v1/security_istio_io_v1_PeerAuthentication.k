"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Peerauthentication:
    """
    Peerauthentication schema.

    Attributes
    ----------
    spec : PeerauthenticationSpec, optional
        Peer authentication configuration for workloads. See more details at: https://istio.io/docs/reference/config/security/peer_authentication.html
    status : PeerauthenticationStatus, optional
        No description available.
    """
    apiVersion : str = "security.istio.io/v1"
    kind : str = "PeerAuthentication"
    metadata? : any
    spec? : PeerauthenticationSpec
    status? : PeerauthenticationStatus

schema PeerauthenticationSpec:
    """
    Peer authentication configuration for workloads. See more details at: https://istio.io/docs/reference/config/security/peer_authentication.html

    Attributes
    ----------
    mtls : PeerauthenticationspecMtls, optional
        Mutual TLS settings for workload.
    portLevelMtls : {str:PeerauthenticationspecPortlevelmtlsvalue}, optional
        Port specific mutual TLS settings.
    selector : PeerauthenticationspecSelector, optional
        The selector determines the workloads to apply the PeerAuthentication on.
    """
    mtls? : PeerauthenticationspecMtls
    portLevelMtls? : {str:PeerauthenticationspecPortlevelmtlsvalue}
    selector? : PeerauthenticationspecSelector

schema PeerauthenticationspecMtls:
    """
    Mutual TLS settings for workload.

    Attributes
    ----------
    mode : "UNSET" | "DISABLE" | "PERMISSIVE" | "STRICT", optional
        Defines the mTLS mode used for peer authentication.

        Valid Options: DISABLE, PERMISSIVE, STRICT
    """
    mode? : "UNSET" | "DISABLE" | "PERMISSIVE" | "STRICT"

schema PeerauthenticationspecPortlevelmtlsvalue:
    """
    PeerauthenticationspecPortlevelmtlsvalue schema.

    Attributes
    ----------
    mode : "UNSET" | "DISABLE" | "PERMISSIVE" | "STRICT", optional
        Defines the mTLS mode used for peer authentication.

        Valid Options: DISABLE, PERMISSIVE, STRICT
    """
    mode? : "UNSET" | "DISABLE" | "PERMISSIVE" | "STRICT"

schema PeerauthenticationspecSelector:
    """
    The selector determines the workloads to apply the PeerAuthentication on.

    Attributes
    ----------
    matchLabels : {str:str}, optional
        One or more labels that indicate a specific set of pods/VMs on which a policy should be applied.
    """
    matchLabels? : {str:str}

schema PeerauthenticationStatus:
    """
    PeerauthenticationStatus schema.

    Attributes
    ----------
    conditions : [PeerauthenticationstatusConditionsitem], optional
        Current service state of the resource.
    observedGeneration : any, optional
        No description available.
    validationMessages : [PeerauthenticationstatusValidationmessagesitem], optional
        Includes any errors or warnings detected by Istio's analyzers.
    """
    conditions? : [PeerauthenticationstatusConditionsitem]
    observedGeneration? : any
    validationMessages? : [PeerauthenticationstatusValidationmessagesitem]

schema PeerauthenticationstatusConditionsitem:
    """
    PeerauthenticationstatusConditionsitem schema.

    Attributes
    ----------
    lastProbeTime : str, optional
        Last time we probed the condition.
    lastTransitionTime : str, optional
        Last time the condition transitioned from one status to another.
    message : str, optional
        Human-readable message indicating details about last transition.
    observedGeneration : any, optional
        Resource Generation to which the Condition refers.
    reason : str, optional
        Unique, one-word, CamelCase reason for the condition's last transition.
    status : str, optional
        Status is the status of the condition.
    type : str, optional
        Type is the type of the condition.
    """
    lastProbeTime? : str
    lastTransitionTime? : str
    message? : str
    observedGeneration? : any
    reason? : str
    status? : str
    type? : str

schema PeerauthenticationstatusValidationmessagesitem:
    """
    PeerauthenticationstatusValidationmessagesitem schema.

    Attributes
    ----------
    documentationUrl : str, optional
        A url pointing to the Istio documentation for this specific error type.
    level : "UNKNOWN" | "ERROR" | "WARNING" | "INFO", optional
        Represents how severe a message is.

        Valid Options: UNKNOWN, ERROR, WARNING, INFO
    type : PeerauthenticationstatusvalidationmessagesitemType, optional
        No description available.
    """
    documentationUrl? : str
    level? : "UNKNOWN" | "ERROR" | "WARNING" | "INFO"
    type? : PeerauthenticationstatusvalidationmessagesitemType

schema PeerauthenticationstatusvalidationmessagesitemType:
    """
    PeerauthenticationstatusvalidationmessagesitemType schema.

    Attributes
    ----------
    code : str, optional
        A 7 character code matching `^IST[0-9]{4}$` intended to uniquely identify the message type.
    name : str, optional
        A human-readable name for the message type.
    """
    code? : str
    name? : str