# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_NATGateway as natgateway_schema

schema NatgatewayBlueprint(natgateway_schema.Natgateway):
    """This Blueprint simplifies the creation of a Natgateway resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : natgateway_schema.NatgatewayspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : natgateway_schema.NatgatewayspecWriteconnectionsecrettoref
    _allocationId? : str
    _allocationIdRef? : natgateway_schema.NatgatewayspecforproviderAllocationidref
    _allocationIdSelector? : natgateway_schema.NatgatewayspecforproviderAllocationidselector
    _connectivityType? : str
    _privateIp? : str
    _region : str
    _secondaryAllocationIds? : [str]
    _secondaryAllocationIdsRefs? : [natgateway_schema.NatgatewayspecforproviderSecondaryallocationidsrefsitem]
    _secondaryAllocationIdsSelector? : natgateway_schema.NatgatewayspecforproviderSecondaryallocationidsselector
    _secondaryPrivateIpAddressCount? : float
    _secondaryPrivateIpAddresses? : [str]
    _subnetId? : str
    _subnetIdRef? : natgateway_schema.NatgatewayspecforproviderSubnetidref
    _subnetIdSelector? : natgateway_schema.NatgatewayspecforproviderSubnetidselector
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
            allocationId = _allocationId
            allocationIdRef = _allocationIdRef
            allocationIdSelector = _allocationIdSelector
            connectivityType = _connectivityType
            privateIp = _privateIp
            region = _region
            secondaryAllocationIds = _secondaryAllocationIds
            secondaryAllocationIdsRefs = _secondaryAllocationIdsRefs
            secondaryAllocationIdsSelector = _secondaryAllocationIdsSelector
            secondaryPrivateIpAddressCount = _secondaryPrivateIpAddressCount
            secondaryPrivateIpAddresses = _secondaryPrivateIpAddresses
            subnetId = _subnetId
            subnetIdRef = _subnetIdRef
            subnetIdSelector = _subnetIdSelector
            tags = _tags
        }
        providerConfigRef.name = _providerConfig
    }
