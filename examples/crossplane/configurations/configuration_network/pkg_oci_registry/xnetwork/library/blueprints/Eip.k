# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_EIP as eip_schema

schema EipBlueprint(eip_schema.Eip):
    """This Blueprint simplifies the creation of a Eip resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : eip_schema.EipspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : eip_schema.EipspecWriteconnectionsecrettoref
    _address? : str
    _associateWithPrivateIp? : str
    _customerOwnedIpv4Pool? : str
    _domain? : str
    _instance? : str
    _instanceRef? : eip_schema.EipspecforproviderInstanceref
    _instanceSelector? : eip_schema.EipspecforproviderInstanceselector
    _ipamPoolId? : str
    _networkBorderGroup? : str
    _networkInterface? : str
    _networkInterfaceRef? : eip_schema.EipspecforproviderNetworkinterfaceref
    _networkInterfaceSelector? : eip_schema.EipspecforproviderNetworkinterfaceselector
    _publicIpv4Pool? : str
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
            address = _address
            associateWithPrivateIp = _associateWithPrivateIp
            customerOwnedIpv4Pool = _customerOwnedIpv4Pool
            domain = _domain
            instance = _instance
            instanceRef = _instanceRef
            instanceSelector = _instanceSelector
            ipamPoolId = _ipamPoolId
            networkBorderGroup = _networkBorderGroup
            networkInterface = _networkInterface
            networkInterfaceRef = _networkInterfaceRef
            networkInterfaceSelector = _networkInterfaceSelector
            publicIpv4Pool = _publicIpv4Pool
            region = _region
            tags = _tags
        }
        providerConfigRef.name = _providerConfig
    }
