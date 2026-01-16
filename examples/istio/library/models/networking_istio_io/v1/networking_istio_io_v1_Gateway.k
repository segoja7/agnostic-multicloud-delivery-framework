"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Gateway:
    """
    Gateway schema.

    Attributes
    ----------
    spec : GatewaySpec, optional
        Configuration affecting edge load balancer. See more details at: https://istio.io/docs/reference/config/networking/gateway.html
    status : GatewayStatus, optional
        No description available.
    """
    apiVersion : str = "networking.istio.io/v1"
    kind : str = "Gateway"
    metadata? : any
    spec? : GatewaySpec
    status? : GatewayStatus

schema GatewaySpec:
    """
    Configuration affecting edge load balancer. See more details at: https://istio.io/docs/reference/config/networking/gateway.html

    Attributes
    ----------
    selector : {str:str}, optional
        One or more labels that indicate a specific set of pods/VMs on which this gateway configuration should be applied.
    servers : [GatewayspecServersitem], optional
        A list of server specifications.
    """
    selector? : {str:str}
    servers? : [GatewayspecServersitem]

schema GatewayspecServersitem:
    """
    GatewayspecServersitem schema.

    Attributes
    ----------
    bind : str, optional
        The ip or the Unix domain socket to which the listener should be bound to.
    defaultEndpoint : str, optional
        No description available.
    hosts : [str], required
        One or more hosts exposed by this gateway.
    name : str, optional
        An optional name of the server, when set must be unique across all servers.
    port : GatewayspecserversitemPort, required
        The Port on which the proxy should listen for incoming connections.
    tls : GatewayspecserversitemTls, optional
        Set of TLS related options that govern the server's behavior.
    """
    bind? : str
    defaultEndpoint? : str
    hosts : [str]
    name? : str
    port : GatewayspecserversitemPort
    tls? : GatewayspecserversitemTls

schema GatewayspecserversitemPort:
    """
    The Port on which the proxy should listen for incoming connections.

    Attributes
    ----------
    name : str, required
        Label assigned to the port.
    number : int, required
        A valid non-negative integer port number.
    protocol : str, required
        The protocol exposed on the port.
    targetPort : int, optional
        No description available.
    """
    name : str
    number : int
    protocol : str
    targetPort? : int

schema GatewayspecserversitemTls:
    """
    Set of TLS related options that govern the server's behavior.

    Attributes
    ----------
    caCertCredentialName : str, optional
        For mutual TLS, the name of the secret or the configmap that holds CA certificates.
    caCertificates : str, optional
        REQUIRED if mode is `MUTUAL` or `OPTIONAL_MUTUAL`.
    caCrl : str, optional
        OPTIONAL: The path to the file containing the certificate revocation list (CRL) to use in verifying a presented client side certificate.
    cipherSuites : [str], optional
        Optional: If specified, only support the specified cipher list.
    credentialName : str, optional
        For gateways running on Kubernetes, the name of the secret that holds the TLS certs including the CA certificates.
    credentialNames : [str], optional
        Same as CredentialName but for multiple certificates.
    httpsRedirect : bool, optional
        If set to true, the load balancer will send a 301 redirect for all http connections, asking the clients to use HTTPS.
    maxProtocolVersion : "TLS_AUTO" | "TLSV1_0" | "TLSV1_1" | "TLSV1_2" | "TLSV1_3", optional
        Optional: Maximum TLS protocol version.

        Valid Options: TLS_AUTO, TLSV1_0, TLSV1_1, TLSV1_2, TLSV1_3
    minProtocolVersion : "TLS_AUTO" | "TLSV1_0" | "TLSV1_1" | "TLSV1_2" | "TLSV1_3", optional
        Optional: Minimum TLS protocol version.

        Valid Options: TLS_AUTO, TLSV1_0, TLSV1_1, TLSV1_2, TLSV1_3
    mode : "PASSTHROUGH" | "SIMPLE" | "MUTUAL" | "AUTO_PASSTHROUGH" | "ISTIO_MUTUAL" | "OPTIONAL_MUTUAL", optional
        Optional: Indicates whether connections to this port should be secured using TLS.

        Valid Options: PASSTHROUGH, SIMPLE, MUTUAL, AUTO_PASSTHROUGH, ISTIO_MUTUAL, OPTIONAL_MUTUAL
    privateKey : str, optional
        REQUIRED if mode is `SIMPLE` or `MUTUAL`.
    serverCertificate : str, optional
        REQUIRED if mode is `SIMPLE` or `MUTUAL`.
    subjectAltNames : [str], optional
        A list of alternate names to verify the subject identity in the certificate presented by the client.
    tlsCertificates : [GatewayspecserversitemtlsTlscertificatesitem], optional
        Only one of `server_certificate`, `private_key` or `credential_name` or `credential_names` or `tls_certificates` should be specified.
    verifyCertificateHash : [str], optional
        An optional list of hex-encoded SHA-256 hashes of the authorized client certificates.
    verifyCertificateSpki : [str], optional
        An optional list of base64-encoded SHA-256 hashes of the SPKIs of authorized client certificates.
    """
    caCertCredentialName? : str
    caCertificates? : str
    caCrl? : str
    cipherSuites? : [str]
    credentialName? : str
    credentialNames? : [str]
    httpsRedirect? : bool
    maxProtocolVersion? : "TLS_AUTO" | "TLSV1_0" | "TLSV1_1" | "TLSV1_2" | "TLSV1_3"
    minProtocolVersion? : "TLS_AUTO" | "TLSV1_0" | "TLSV1_1" | "TLSV1_2" | "TLSV1_3"
    mode? : "PASSTHROUGH" | "SIMPLE" | "MUTUAL" | "AUTO_PASSTHROUGH" | "ISTIO_MUTUAL" | "OPTIONAL_MUTUAL"
    privateKey? : str
    serverCertificate? : str
    subjectAltNames? : [str]
    tlsCertificates? : [GatewayspecserversitemtlsTlscertificatesitem]
    verifyCertificateHash? : [str]
    verifyCertificateSpki? : [str]

schema GatewayspecserversitemtlsTlscertificatesitem:
    """
    GatewayspecserversitemtlsTlscertificatesitem schema.

    Attributes
    ----------
    caCertificates : str, optional
        No description available.
    privateKey : str, optional
        REQUIRED if mode is `SIMPLE` or `MUTUAL`.
    serverCertificate : str, optional
        REQUIRED if mode is `SIMPLE` or `MUTUAL`.
    """
    caCertificates? : str
    privateKey? : str
    serverCertificate? : str

schema GatewayStatus:
    """
    GatewayStatus schema.

    Attributes
    ----------
    conditions : [GatewaystatusConditionsitem], optional
        Current service state of the resource.
    observedGeneration : any, optional
        No description available.
    validationMessages : [GatewaystatusValidationmessagesitem], optional
        Includes any errors or warnings detected by Istio's analyzers.
    """
    conditions? : [GatewaystatusConditionsitem]
    observedGeneration? : any
    validationMessages? : [GatewaystatusValidationmessagesitem]

schema GatewaystatusConditionsitem:
    """
    GatewaystatusConditionsitem schema.

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

schema GatewaystatusValidationmessagesitem:
    """
    GatewaystatusValidationmessagesitem schema.

    Attributes
    ----------
    documentationUrl : str, optional
        A url pointing to the Istio documentation for this specific error type.
    level : "UNKNOWN" | "ERROR" | "WARNING" | "INFO", optional
        Represents how severe a message is.

        Valid Options: UNKNOWN, ERROR, WARNING, INFO
    type : GatewaystatusvalidationmessagesitemType, optional
        No description available.
    """
    documentationUrl? : str
    level? : "UNKNOWN" | "ERROR" | "WARNING" | "INFO"
    type? : GatewaystatusvalidationmessagesitemType

schema GatewaystatusvalidationmessagesitemType:
    """
    GatewaystatusvalidationmessagesitemType schema.

    Attributes
    ----------
    code : str, optional
        A 7 character code matching `^IST[0-9]{4}$` intended to uniquely identify the message type.
    name : str, optional
        A human-readable name for the message type.
    """
    code? : str
    name? : str