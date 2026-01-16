# --- High-Level Blueprint (Auto-Generated) ---

import models.k8s.v1.k8s_v1_Service as service_schema

schema ServiceBlueprint(service_schema.Service):
    """This Blueprint simplifies the creation of a Service resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _allocateLoadBalancerNodePorts? : bool
    _clusterIP? : str
    _clusterIPs? : [str]
    _externalIPs? : [str]
    _externalName? : str
    _externalTrafficPolicy? : str
    _healthCheckNodePort? : int
    _internalTrafficPolicy? : str
    _ipFamilies? : [str]
    _ipFamilyPolicy? : str
    _loadBalancerClass? : str
    _loadBalancerIP? : str
    _loadBalancerSourceRanges? : [str]
    _ports? : [any]
    _publishNotReadyAddresses? : bool
    _selector? : {str:str}
    _sessionAffinity? : str
    _sessionAffinityConfig? : any
    _trafficDistribution? : str
    _type? : str

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        allocateLoadBalancerNodePorts = _allocateLoadBalancerNodePorts
        clusterIP = _clusterIP
        clusterIPs = _clusterIPs
        externalIPs = _externalIPs
        externalName = _externalName
        externalTrafficPolicy = _externalTrafficPolicy
        healthCheckNodePort = _healthCheckNodePort
        internalTrafficPolicy = _internalTrafficPolicy
        ipFamilies = _ipFamilies
        ipFamilyPolicy = _ipFamilyPolicy
        loadBalancerClass = _loadBalancerClass
        loadBalancerIP = _loadBalancerIP
        loadBalancerSourceRanges = _loadBalancerSourceRanges
        ports = _ports
        publishNotReadyAddresses = _publishNotReadyAddresses
        selector = _selector
        sessionAffinity = _sessionAffinity
        sessionAffinityConfig = _sessionAffinityConfig
        trafficDistribution = _trafficDistribution
        type = _type
    }
