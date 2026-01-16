"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Virtualservice:
    """
    Virtualservice schema.

    Attributes
    ----------
    spec : VirtualserviceSpec, optional
        Configuration affecting label/content routing, sni routing, etc. See more details at: https://istio.io/docs/reference/config/networking/virtual-service.html
    status : VirtualserviceStatus, optional
        No description available.
    """
    apiVersion : str = "networking.istio.io/v1"
    kind : str = "VirtualService"
    metadata? : any
    spec? : VirtualserviceSpec
    status? : VirtualserviceStatus

schema VirtualserviceSpec:
    """
    Configuration affecting label/content routing, sni routing, etc. See more details at: https://istio.io/docs/reference/config/networking/virtual-service.html

    Attributes
    ----------
    exportTo : [str], optional
        A list of namespaces to which this virtual service is exported.
    gateways : [str], optional
        The names of gateways and sidecars that should apply these routes.
    hosts : [str], optional
        The destination hosts to which traffic is being sent.
    http : [VirtualservicespecHttpitem], optional
        An ordered list of route rules for HTTP traffic.
    tcp : [VirtualservicespecTcpitem], optional
        An ordered list of route rules for opaque TCP traffic.
    tls : [VirtualservicespecTlsitem], optional
        An ordered list of route rule for non-terminated TLS & HTTPS traffic.
    """
    exportTo? : [str]
    gateways? : [str]
    hosts? : [str]
    http? : [VirtualservicespecHttpitem]
    tcp? : [VirtualservicespecTcpitem]
    tls? : [VirtualservicespecTlsitem]

schema VirtualservicespecHttpitem:
    """
    VirtualservicespecHttpitem schema.

    Attributes
    ----------
    corsPolicy : VirtualservicespechttpitemCorspolicy, optional
        Cross-Origin Resource Sharing policy (CORS).
    delegate : VirtualservicespechttpitemDelegate, optional
        Delegate is used to specify the particular VirtualService which can be used to define delegate HTTPRoute.
    directResponse : VirtualservicespechttpitemDirectresponse, optional
        A HTTP rule can either return a direct_response, redirect or forward (default) traffic.
    fault : VirtualservicespechttpitemFault, optional
        Fault injection policy to apply on HTTP traffic at the client side.
    headers : VirtualservicespechttpitemHeaders, optional
        No description available.
    match : [VirtualservicespechttpitemMatchitem], optional
        Match conditions to be satisfied for the rule to be activated.
    mirror : VirtualservicespechttpitemMirror, optional
        Mirror HTTP traffic to a another destination in addition to forwarding the requests to the intended destination.
    mirrorPercent : int, optional
        No description available.
    mirrorPercentage : VirtualservicespechttpitemMirrorpercentage, optional
        Percentage of the traffic to be mirrored by the `mirror` field.
    mirror_percent : int, optional
        No description available.
    mirrors : [VirtualservicespechttpitemMirrorsitem], optional
        Specifies the destinations to mirror HTTP traffic in addition to the original destination.
    name : str, optional
        The name assigned to the route for debugging purposes.
    redirect : VirtualservicespechttpitemRedirect, optional
        A HTTP rule can either return a direct_response, redirect or forward (default) traffic.
    retries : VirtualservicespechttpitemRetries, optional
        Retry policy for HTTP requests.
    rewrite : VirtualservicespechttpitemRewrite, optional
        Rewrite HTTP URIs and Authority headers.
    route : [VirtualservicespechttpitemRouteitem], optional
        A HTTP rule can either return a direct_response, redirect or forward (default) traffic.
    timeout : str, optional
        Timeout for HTTP requests, default is disabled.
    """
    corsPolicy? : VirtualservicespechttpitemCorspolicy
    delegate? : VirtualservicespechttpitemDelegate
    directResponse? : VirtualservicespechttpitemDirectresponse
    fault? : VirtualservicespechttpitemFault
    headers? : VirtualservicespechttpitemHeaders
    match? : [VirtualservicespechttpitemMatchitem]
    mirror? : VirtualservicespechttpitemMirror
    mirrorPercent? : int
    mirrorPercentage? : VirtualservicespechttpitemMirrorpercentage
    mirror_percent? : int
    mirrors? : [VirtualservicespechttpitemMirrorsitem]
    name? : str
    redirect? : VirtualservicespechttpitemRedirect
    retries? : VirtualservicespechttpitemRetries
    rewrite? : VirtualservicespechttpitemRewrite
    route? : [VirtualservicespechttpitemRouteitem]
    timeout? : str

schema VirtualservicespechttpitemCorspolicy:
    """
    Cross-Origin Resource Sharing policy (CORS).

    Attributes
    ----------
    allowCredentials : bool, optional
        Indicates whether the caller is allowed to send the actual request (not the preflight) using credentials.
    allowHeaders : [str], optional
        List of HTTP headers that can be used when requesting the resource.
    allowMethods : [str], optional
        List of HTTP methods allowed to access the resource.
    allowOrigin : [str], optional
        No description available.
    allowOrigins : [VirtualservicespechttpitemcorspolicyAlloworiginsitem], optional
        String patterns that match allowed origins.
    exposeHeaders : [str], optional
        A list of HTTP headers that the browsers are allowed to access.
    maxAge : str, optional
        Specifies how long the results of a preflight request can be cached.
    unmatchedPreflights : "UNSPECIFIED" | "FORWARD" | "IGNORE", optional
        Indicates whether preflight requests not matching the configured allowed origin shouldn't be forwarded to the upstream.

        Valid Options: FORWARD, IGNORE
    """
    allowCredentials? : bool
    allowHeaders? : [str]
    allowMethods? : [str]
    allowOrigin? : [str]
    allowOrigins? : [VirtualservicespechttpitemcorspolicyAlloworiginsitem]
    exposeHeaders? : [str]
    maxAge? : str
    unmatchedPreflights? : "UNSPECIFIED" | "FORWARD" | "IGNORE"

schema VirtualservicespechttpitemcorspolicyAlloworiginsitem:
    """
    VirtualservicespechttpitemcorspolicyAlloworiginsitem schema.

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemDelegate:
    """
    Delegate is used to specify the particular VirtualService which can be used to define delegate HTTPRoute.

    Attributes
    ----------
    name : str, optional
        Name specifies the name of the delegate VirtualService.
    namespace : str, optional
        Namespace specifies the namespace where the delegate VirtualService resides.
    """
    name? : str
    namespace? : str

schema VirtualservicespechttpitemDirectresponse:
    """
    A HTTP rule can either return a direct_response, redirect or forward (default) traffic.

    Attributes
    ----------
    body : VirtualservicespechttpitemdirectresponseBody, optional
        Specifies the content of the response body.
    status : int, required
        Specifies the HTTP response status to be returned.
    """
    body? : VirtualservicespechttpitemdirectresponseBody
    status : int

schema VirtualservicespechttpitemdirectresponseBody:
    """
    Specifies the content of the response body.

    Attributes
    ----------
    bytes : str, optional
        response body as base64 encoded bytes.
    string : str, optional
        No description available.
    """
    bytes? : str
    string? : str

schema VirtualservicespechttpitemFault:
    """
    Fault injection policy to apply on HTTP traffic at the client side.

    Attributes
    ----------
    abort : VirtualservicespechttpitemfaultAbort, optional
        Abort Http request attempts and return error codes back to downstream service, giving the impression that the upstream service is faulty.
    delay : VirtualservicespechttpitemfaultDelay, optional
        Delay requests before forwarding, emulating various failures such as network issues, overloaded upstream service, etc.
    """
    abort? : VirtualservicespechttpitemfaultAbort
    delay? : VirtualservicespechttpitemfaultDelay

schema VirtualservicespechttpitemfaultAbort:
    """
    Abort Http request attempts and return error codes back to downstream service, giving the impression that the upstream service is faulty.

    Attributes
    ----------
    grpcStatus : str, optional
        GRPC status code to use to abort the request.
    http2Error : str, optional
        No description available.
    httpStatus : int, optional
        HTTP status code to use to abort the Http request.
    percentage : VirtualservicespechttpitemfaultabortPercentage, optional
        Percentage of requests to be aborted with the error code provided.
    """
    grpcStatus? : str
    http2Error? : str
    httpStatus? : int
    percentage? : VirtualservicespechttpitemfaultabortPercentage

schema VirtualservicespechttpitemfaultabortPercentage:
    """
    Percentage of requests to be aborted with the error code provided.

    Attributes
    ----------
    value : float, optional
        No description available.
    """
    value? : float

schema VirtualservicespechttpitemfaultDelay:
    """
    Delay requests before forwarding, emulating various failures such as network issues, overloaded upstream service, etc.

    Attributes
    ----------
    exponentialDelay : str, optional
        No description available.
    fixedDelay : str, optional
        Add a fixed delay before forwarding the request.
    percent : int, optional
        Percentage of requests on which the delay will be injected (0-100).
    percentage : VirtualservicespechttpitemfaultdelayPercentage, optional
        Percentage of requests on which the delay will be injected.
    """
    exponentialDelay? : str
    fixedDelay? : str
    percent? : int
    percentage? : VirtualservicespechttpitemfaultdelayPercentage

schema VirtualservicespechttpitemfaultdelayPercentage:
    """
    Percentage of requests on which the delay will be injected.

    Attributes
    ----------
    value : float, optional
        No description available.
    """
    value? : float

schema VirtualservicespechttpitemHeaders:
    """
    VirtualservicespechttpitemHeaders schema.

    Attributes
    ----------
    request : VirtualservicespechttpitemheadersRequest, optional
        No description available.
    response : VirtualservicespechttpitemheadersResponse, optional
        No description available.
    """
    request? : VirtualservicespechttpitemheadersRequest
    response? : VirtualservicespechttpitemheadersResponse

schema VirtualservicespechttpitemheadersRequest:
    """
    VirtualservicespechttpitemheadersRequest schema.

    Attributes
    ----------
    add : {str:str}, optional
        No description available.
    remove : [str], optional
        No description available.
    set : {str:str}, optional
        No description available.
    """
    add? : {str:str}
    remove? : [str]
    set? : {str:str}

schema VirtualservicespechttpitemheadersResponse:
    """
    VirtualservicespechttpitemheadersResponse schema.

    Attributes
    ----------
    add : {str:str}, optional
        No description available.
    remove : [str], optional
        No description available.
    set : {str:str}, optional
        No description available.
    """
    add? : {str:str}
    remove? : [str]
    set? : {str:str}

schema VirtualservicespechttpitemMatchitem:
    """
    VirtualservicespechttpitemMatchitem schema.

    Attributes
    ----------
    authority : VirtualservicespechttpitemmatchitemAuthority, optional
        HTTP Authority values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    gateways : [str], optional
        Names of gateways where the rule should be applied.
    headers : {str:VirtualservicespechttpitemmatchitemHeadersvalue}, optional
        The header keys must be lowercase and use hyphen as the separator, e.g.
    ignoreUriCase : bool, optional
        Flag to specify whether the URI matching should be case-insensitive.
    method : VirtualservicespechttpitemmatchitemMethod, optional
        HTTP Method values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    name : str, optional
        The name assigned to a match.
    port : int, optional
        Specifies the ports on the host that is being addressed.
    queryParams : {str:VirtualservicespechttpitemmatchitemQueryparamsvalue}, optional
        Query parameters for matching.
    scheme : VirtualservicespechttpitemmatchitemScheme, optional
        URI Scheme values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    sourceLabels : {str:str}, optional
        One or more labels that constrain the applicability of a rule to source (client) workloads with the given labels.
    sourceNamespace : str, optional
        Source namespace constraining the applicability of a rule to workloads in that namespace.
    statPrefix : str, optional
        The human readable prefix to use when emitting statistics for this route.
    uri : VirtualservicespechttpitemmatchitemUri, optional
        URI to match values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    withoutHeaders : {str:VirtualservicespechttpitemmatchitemWithoutheadersvalue}, optional
        withoutHeader has the same syntax with the header, but has opposite meaning.
    """
    authority? : VirtualservicespechttpitemmatchitemAuthority
    gateways? : [str]
    headers? : {str:VirtualservicespechttpitemmatchitemHeadersvalue}
    ignoreUriCase? : bool
    method? : VirtualservicespechttpitemmatchitemMethod
    name? : str
    port? : int
    queryParams? : {str:VirtualservicespechttpitemmatchitemQueryparamsvalue}
    scheme? : VirtualservicespechttpitemmatchitemScheme
    sourceLabels? : {str:str}
    sourceNamespace? : str
    statPrefix? : str
    uri? : VirtualservicespechttpitemmatchitemUri
    withoutHeaders? : {str:VirtualservicespechttpitemmatchitemWithoutheadersvalue}

schema VirtualservicespechttpitemmatchitemAuthority:
    """
    HTTP Authority values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemmatchitemHeadersvalue:
    """
    VirtualservicespechttpitemmatchitemHeadersvalue schema.

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemmatchitemMethod:
    """
    HTTP Method values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemmatchitemQueryparamsvalue:
    """
    VirtualservicespechttpitemmatchitemQueryparamsvalue schema.

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemmatchitemScheme:
    """
    URI Scheme values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemmatchitemUri:
    """
    URI to match values are case-sensitive and formatted as follows: - `exact: "value"` for exact string match - `prefix: "value"` for prefix-based match - `regex: "value"` for [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemmatchitemWithoutheadersvalue:
    """
    VirtualservicespechttpitemmatchitemWithoutheadersvalue schema.

    Attributes
    ----------
    exact : str, optional
        No description available.
    prefix : str, optional
        No description available.
    regex : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    """
    exact? : str
    prefix? : str
    regex? : str

schema VirtualservicespechttpitemMirror:
    """
    Mirror HTTP traffic to a another destination in addition to forwarding the requests to the intended destination.

    Attributes
    ----------
    host : str, required
        The name of a service from the service registry.
    port : VirtualservicespechttpitemmirrorPort, optional
        Specifies the port on the host that is being addressed.
    subset : str, optional
        The name of a subset within the service.
    """
    host : str
    port? : VirtualservicespechttpitemmirrorPort
    subset? : str

schema VirtualservicespechttpitemmirrorPort:
    """
    Specifies the port on the host that is being addressed.

    Attributes
    ----------
    number : int, optional
        No description available.
    """
    number? : int

schema VirtualservicespechttpitemMirrorpercentage:
    """
    Percentage of the traffic to be mirrored by the `mirror` field.

    Attributes
    ----------
    value : float, optional
        No description available.
    """
    value? : float

schema VirtualservicespechttpitemMirrorsitem:
    """
    VirtualservicespechttpitemMirrorsitem schema.

    Attributes
    ----------
    destination : VirtualservicespechttpitemmirrorsitemDestination, required
        Destination specifies the target of the mirror operation.
    percentage : VirtualservicespechttpitemmirrorsitemPercentage, optional
        Percentage of the traffic to be mirrored by the `destination` field.
    """
    destination : VirtualservicespechttpitemmirrorsitemDestination
    percentage? : VirtualservicespechttpitemmirrorsitemPercentage

schema VirtualservicespechttpitemmirrorsitemDestination:
    """
    Destination specifies the target of the mirror operation.

    Attributes
    ----------
    host : str, required
        The name of a service from the service registry.
    port : VirtualservicespechttpitemmirrorsitemdestinationPort, optional
        Specifies the port on the host that is being addressed.
    subset : str, optional
        The name of a subset within the service.
    """
    host : str
    port? : VirtualservicespechttpitemmirrorsitemdestinationPort
    subset? : str

schema VirtualservicespechttpitemmirrorsitemdestinationPort:
    """
    Specifies the port on the host that is being addressed.

    Attributes
    ----------
    number : int, optional
        No description available.
    """
    number? : int

schema VirtualservicespechttpitemmirrorsitemPercentage:
    """
    Percentage of the traffic to be mirrored by the `destination` field.

    Attributes
    ----------
    value : float, optional
        No description available.
    """
    value? : float

schema VirtualservicespechttpitemRedirect:
    """
    A HTTP rule can either return a direct_response, redirect or forward (default) traffic.

    Attributes
    ----------
    authority : str, optional
        On a redirect, overwrite the Authority/Host portion of the URL with this value.
    derivePort : "FROM_PROTOCOL_DEFAULT" | "FROM_REQUEST_PORT", optional
        On a redirect, dynamically set the port: * FROM_PROTOCOL_DEFAULT: automatically set to 80 for HTTP and 443 for HTTPS.

        Valid Options: FROM_PROTOCOL_DEFAULT, FROM_REQUEST_PORT
    port : int, optional
        On a redirect, overwrite the port portion of the URL with this value.
    redirectCode : int, optional
        On a redirect, Specifies the HTTP status code to use in the redirect response.
    scheme : str, optional
        On a redirect, overwrite the scheme portion of the URL with this value.
    uri : str, optional
        On a redirect, overwrite the Path portion of the URL with this value.
    """
    authority? : str
    derivePort? : "FROM_PROTOCOL_DEFAULT" | "FROM_REQUEST_PORT"
    port? : int
    redirectCode? : int
    scheme? : str
    uri? : str

schema VirtualservicespechttpitemRetries:
    """
    Retry policy for HTTP requests.

    Attributes
    ----------
    attempts : int, optional
        Number of retries to be allowed for a given request.
    backoff : str, optional
        Specifies the minimum duration between retry attempts.
    perTryTimeout : str, optional
        Timeout per attempt for a given request, including the initial call and any retries.
    retryIgnorePreviousHosts : bool, optional
        Flag to specify whether the retries should ignore previously tried hosts during retry.
    retryOn : str, optional
        Specifies the conditions under which retry takes place.
    retryRemoteLocalities : bool, optional
        Flag to specify whether the retries should retry to other localities.
    """
    attempts? : int
    backoff? : str
    perTryTimeout? : str
    retryIgnorePreviousHosts? : bool
    retryOn? : str
    retryRemoteLocalities? : bool

schema VirtualservicespechttpitemRewrite:
    """
    Rewrite HTTP URIs and Authority headers.

    Attributes
    ----------
    authority : str, optional
        rewrite the Authority/Host header with this value.
    uri : str, optional
        rewrite the path (or the prefix) portion of the URI with this value.
    uriRegexRewrite : VirtualservicespechttpitemrewriteUriregexrewrite, optional
        rewrite the path portion of the URI with the specified regex.
    """
    authority? : str
    uri? : str
    uriRegexRewrite? : VirtualservicespechttpitemrewriteUriregexrewrite

schema VirtualservicespechttpitemrewriteUriregexrewrite:
    """
    rewrite the path portion of the URI with the specified regex.

    Attributes
    ----------
    match : str, optional
        [RE2 style regex-based match](https://github.com/google/re2/wiki/Syntax).
    rewrite : str, optional
        The string that should replace into matching portions of original URI.
    """
    match? : str
    rewrite? : str

schema VirtualservicespechttpitemRouteitem:
    """
    VirtualservicespechttpitemRouteitem schema.

    Attributes
    ----------
    destination : VirtualservicespechttpitemrouteitemDestination, required
        Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to.
    headers : VirtualservicespechttpitemrouteitemHeaders, optional
        No description available.
    weight : int, optional
        Weight specifies the relative proportion of traffic to be forwarded to the destination.
    """
    destination : VirtualservicespechttpitemrouteitemDestination
    headers? : VirtualservicespechttpitemrouteitemHeaders
    weight? : int

schema VirtualservicespechttpitemrouteitemDestination:
    """
    Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to.

    Attributes
    ----------
    host : str, required
        The name of a service from the service registry.
    port : VirtualservicespechttpitemrouteitemdestinationPort, optional
        Specifies the port on the host that is being addressed.
    subset : str, optional
        The name of a subset within the service.
    """
    host : str
    port? : VirtualservicespechttpitemrouteitemdestinationPort
    subset? : str

schema VirtualservicespechttpitemrouteitemdestinationPort:
    """
    Specifies the port on the host that is being addressed.

    Attributes
    ----------
    number : int, optional
        No description available.
    """
    number? : int

schema VirtualservicespechttpitemrouteitemHeaders:
    """
    VirtualservicespechttpitemrouteitemHeaders schema.

    Attributes
    ----------
    request : VirtualservicespechttpitemrouteitemheadersRequest, optional
        No description available.
    response : VirtualservicespechttpitemrouteitemheadersResponse, optional
        No description available.
    """
    request? : VirtualservicespechttpitemrouteitemheadersRequest
    response? : VirtualservicespechttpitemrouteitemheadersResponse

schema VirtualservicespechttpitemrouteitemheadersRequest:
    """
    VirtualservicespechttpitemrouteitemheadersRequest schema.

    Attributes
    ----------
    add : {str:str}, optional
        No description available.
    remove : [str], optional
        No description available.
    set : {str:str}, optional
        No description available.
    """
    add? : {str:str}
    remove? : [str]
    set? : {str:str}

schema VirtualservicespechttpitemrouteitemheadersResponse:
    """
    VirtualservicespechttpitemrouteitemheadersResponse schema.

    Attributes
    ----------
    add : {str:str}, optional
        No description available.
    remove : [str], optional
        No description available.
    set : {str:str}, optional
        No description available.
    """
    add? : {str:str}
    remove? : [str]
    set? : {str:str}

schema VirtualservicespecTcpitem:
    """
    VirtualservicespecTcpitem schema.

    Attributes
    ----------
    match : [VirtualservicespectcpitemMatchitem], optional
        Match conditions to be satisfied for the rule to be activated.
    route : [VirtualservicespectcpitemRouteitem], optional
        The destination to which the connection should be forwarded to.
    """
    match? : [VirtualservicespectcpitemMatchitem]
    route? : [VirtualservicespectcpitemRouteitem]

schema VirtualservicespectcpitemMatchitem:
    """
    VirtualservicespectcpitemMatchitem schema.

    Attributes
    ----------
    destinationSubnets : [str], optional
        IPv4 or IPv6 ip addresses of destination with optional subnet.
    gateways : [str], optional
        Names of gateways where the rule should be applied.
    port : int, optional
        Specifies the port on the host that is being addressed.
    sourceLabels : {str:str}, optional
        One or more labels that constrain the applicability of a rule to workloads with the given labels.
    sourceNamespace : str, optional
        Source namespace constraining the applicability of a rule to workloads in that namespace.
    sourceSubnet : str, optional
        No description available.
    """
    destinationSubnets? : [str]
    gateways? : [str]
    port? : int
    sourceLabels? : {str:str}
    sourceNamespace? : str
    sourceSubnet? : str

schema VirtualservicespectcpitemRouteitem:
    """
    VirtualservicespectcpitemRouteitem schema.

    Attributes
    ----------
    destination : VirtualservicespectcpitemrouteitemDestination, required
        Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to.
    weight : int, optional
        Weight specifies the relative proportion of traffic to be forwarded to the destination.
    """
    destination : VirtualservicespectcpitemrouteitemDestination
    weight? : int

schema VirtualservicespectcpitemrouteitemDestination:
    """
    Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to.

    Attributes
    ----------
    host : str, required
        The name of a service from the service registry.
    port : VirtualservicespectcpitemrouteitemdestinationPort, optional
        Specifies the port on the host that is being addressed.
    subset : str, optional
        The name of a subset within the service.
    """
    host : str
    port? : VirtualservicespectcpitemrouteitemdestinationPort
    subset? : str

schema VirtualservicespectcpitemrouteitemdestinationPort:
    """
    Specifies the port on the host that is being addressed.

    Attributes
    ----------
    number : int, optional
        No description available.
    """
    number? : int

schema VirtualservicespecTlsitem:
    """
    VirtualservicespecTlsitem schema.

    Attributes
    ----------
    match : [VirtualservicespectlsitemMatchitem], required
        Match conditions to be satisfied for the rule to be activated.
    route : [VirtualservicespectlsitemRouteitem], optional
        The destination to which the connection should be forwarded to.
    """
    match : [VirtualservicespectlsitemMatchitem]
    route? : [VirtualservicespectlsitemRouteitem]

schema VirtualservicespectlsitemMatchitem:
    """
    VirtualservicespectlsitemMatchitem schema.

    Attributes
    ----------
    destinationSubnets : [str], optional
        IPv4 or IPv6 ip addresses of destination with optional subnet.
    gateways : [str], optional
        Names of gateways where the rule should be applied.
    port : int, optional
        Specifies the port on the host that is being addressed.
    sniHosts : [str], required
        SNI (server name indicator) to match on.
    sourceLabels : {str:str}, optional
        One or more labels that constrain the applicability of a rule to workloads with the given labels.
    sourceNamespace : str, optional
        Source namespace constraining the applicability of a rule to workloads in that namespace.
    """
    destinationSubnets? : [str]
    gateways? : [str]
    port? : int
    sniHosts : [str]
    sourceLabels? : {str:str}
    sourceNamespace? : str

schema VirtualservicespectlsitemRouteitem:
    """
    VirtualservicespectlsitemRouteitem schema.

    Attributes
    ----------
    destination : VirtualservicespectlsitemrouteitemDestination, required
        Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to.
    weight : int, optional
        Weight specifies the relative proportion of traffic to be forwarded to the destination.
    """
    destination : VirtualservicespectlsitemrouteitemDestination
    weight? : int

schema VirtualservicespectlsitemrouteitemDestination:
    """
    Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to.

    Attributes
    ----------
    host : str, required
        The name of a service from the service registry.
    port : VirtualservicespectlsitemrouteitemdestinationPort, optional
        Specifies the port on the host that is being addressed.
    subset : str, optional
        The name of a subset within the service.
    """
    host : str
    port? : VirtualservicespectlsitemrouteitemdestinationPort
    subset? : str

schema VirtualservicespectlsitemrouteitemdestinationPort:
    """
    Specifies the port on the host that is being addressed.

    Attributes
    ----------
    number : int, optional
        No description available.
    """
    number? : int

schema VirtualserviceStatus:
    """
    VirtualserviceStatus schema.

    Attributes
    ----------
    conditions : [VirtualservicestatusConditionsitem], optional
        Current service state of the resource.
    observedGeneration : any, optional
        No description available.
    validationMessages : [VirtualservicestatusValidationmessagesitem], optional
        Includes any errors or warnings detected by Istio's analyzers.
    """
    conditions? : [VirtualservicestatusConditionsitem]
    observedGeneration? : any
    validationMessages? : [VirtualservicestatusValidationmessagesitem]

schema VirtualservicestatusConditionsitem:
    """
    VirtualservicestatusConditionsitem schema.

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

schema VirtualservicestatusValidationmessagesitem:
    """
    VirtualservicestatusValidationmessagesitem schema.

    Attributes
    ----------
    documentationUrl : str, optional
        A url pointing to the Istio documentation for this specific error type.
    level : "UNKNOWN" | "ERROR" | "WARNING" | "INFO", optional
        Represents how severe a message is.

        Valid Options: UNKNOWN, ERROR, WARNING, INFO
    type : VirtualservicestatusvalidationmessagesitemType, optional
        No description available.
    """
    documentationUrl? : str
    level? : "UNKNOWN" | "ERROR" | "WARNING" | "INFO"
    type? : VirtualservicestatusvalidationmessagesitemType

schema VirtualservicestatusvalidationmessagesitemType:
    """
    VirtualservicestatusvalidationmessagesitemType schema.

    Attributes
    ----------
    code : str, optional
        A 7 character code matching `^IST[0-9]{4}$` intended to uniquely identify the message type.
    name : str, optional
        A human-readable name for the message type.
    """
    code? : str
    name? : str