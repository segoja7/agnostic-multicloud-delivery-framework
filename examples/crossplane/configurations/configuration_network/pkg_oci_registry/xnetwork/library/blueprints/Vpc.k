# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_VPC as vpc_schema

schema VpcBlueprint(vpc_schema.Vpc):
    """This Blueprint simplifies the creation of a Vpc resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : vpc_schema.VpcspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : vpc_schema.VpcspecWriteconnectionsecrettoref
    _assignGeneratedIpv6CidrBlock? : bool
    _cidrBlock? : str
    _enableDnsHostnames? : bool
    _enableDnsSupport? : bool
    _enableNetworkAddressUsageMetrics? : bool
    _instanceTenancy? : str
    _ipv4IpamPoolId? : str
    _ipv4IpamPoolIdRef? : vpc_schema.VpcspecforproviderIpv4Ipampoolidref
    _ipv4IpamPoolIdSelector? : vpc_schema.VpcspecforproviderIpv4Ipampoolidselector
    _ipv4NetmaskLength? : float
    _ipv6CidrBlock? : str
    _ipv6CidrBlockNetworkBorderGroup? : str
    _ipv6IpamPoolId? : str
    _ipv6NetmaskLength? : float
    _region : str
    _tags? : {str:str}

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        deletionPolicy = _deletionPolicy
        initProvider = _initProvider
        managementPolicies = _managementPolicies
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            assignGeneratedIpv6CidrBlock = _assignGeneratedIpv6CidrBlock
            cidrBlock = _cidrBlock
            enableDnsHostnames = _enableDnsHostnames
            enableDnsSupport = _enableDnsSupport
            enableNetworkAddressUsageMetrics = _enableNetworkAddressUsageMetrics
            instanceTenancy = _instanceTenancy
            ipv4IpamPoolId = _ipv4IpamPoolId
            ipv4IpamPoolIdRef = _ipv4IpamPoolIdRef
            ipv4IpamPoolIdSelector = _ipv4IpamPoolIdSelector
            ipv4NetmaskLength = _ipv4NetmaskLength
            ipv6CidrBlock = _ipv6CidrBlock
            ipv6CidrBlockNetworkBorderGroup = _ipv6CidrBlockNetworkBorderGroup
            ipv6IpamPoolId = _ipv6IpamPoolId
            ipv6NetmaskLength = _ipv6NetmaskLength
            region = _region
            tags = _tags
        }
        providerConfigRef.name = _providerConfig
    }
