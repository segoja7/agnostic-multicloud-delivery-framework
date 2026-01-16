# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_Subnet as subnet_schema

schema SubnetBlueprint(subnet_schema.Subnet):
    """This Blueprint simplifies the creation of a Subnet resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : subnet_schema.SubnetspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : subnet_schema.SubnetspecWriteconnectionsecrettoref
    _assignIpv6AddressOnCreation? : bool
    _availabilityZone? : str
    _availabilityZoneId? : str
    _cidrBlock? : str
    _customerOwnedIpv4Pool? : str
    _enableDns64? : bool
    _enableLniAtDeviceIndex? : float
    _enableResourceNameDnsARecordOnLaunch? : bool
    _enableResourceNameDnsAaaaRecordOnLaunch? : bool
    _ipv6CidrBlock? : str
    _ipv6Native? : bool
    _mapCustomerOwnedIpOnLaunch? : bool
    _mapPublicIpOnLaunch? : bool
    _outpostArn? : str
    _privateDnsHostnameTypeOnLaunch? : str
    _region : str
    _tags? : {str:str}
    _vpcId? : str
    _vpcIdRef? : subnet_schema.SubnetspecforproviderVpcidref
    _vpcIdSelector? : subnet_schema.SubnetspecforproviderVpcidselector

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
            assignIpv6AddressOnCreation = _assignIpv6AddressOnCreation
            availabilityZone = _availabilityZone
            availabilityZoneId = _availabilityZoneId
            cidrBlock = _cidrBlock
            customerOwnedIpv4Pool = _customerOwnedIpv4Pool
            enableDns64 = _enableDns64
            enableLniAtDeviceIndex = _enableLniAtDeviceIndex
            enableResourceNameDnsARecordOnLaunch = _enableResourceNameDnsARecordOnLaunch
            enableResourceNameDnsAaaaRecordOnLaunch = _enableResourceNameDnsAaaaRecordOnLaunch
            ipv6CidrBlock = _ipv6CidrBlock
            ipv6Native = _ipv6Native
            mapCustomerOwnedIpOnLaunch = _mapCustomerOwnedIpOnLaunch
            mapPublicIpOnLaunch = _mapPublicIpOnLaunch
            outpostArn = _outpostArn
            privateDnsHostnameTypeOnLaunch = _privateDnsHostnameTypeOnLaunch
            region = _region
            tags = _tags
            vpcId = _vpcId
            vpcIdRef = _vpcIdRef
            vpcIdSelector = _vpcIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
