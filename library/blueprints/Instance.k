# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_Instance as instance_schema

schema InstanceBlueprint(instance_schema.Instance):
    """Este Blueprint simplifica la creación de un recurso Instance,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : instance_schema.InstancespecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : instance_schema.InstancespecWriteconnectionsecrettoref
    _ami? : str
    _associatePublicIpAddress? : bool
    _availabilityZone? : str
    _capacityReservationSpecification? : [instance_schema.InstancespecforproviderCapacityreservationspecificationitem]
    _cpuOptions? : [instance_schema.InstancespecforproviderCpuoptionsitem]
    _creditSpecification? : [instance_schema.InstancespecforproviderCreditspecificationitem]
    _disableApiStop? : bool
    _disableApiTermination? : bool
    _ebsBlockDevice? : [instance_schema.InstancespecforproviderEbsblockdeviceitem]
    _ebsOptimized? : bool
    _enablePrimaryIpv6? : bool
    _enclaveOptions? : [instance_schema.InstancespecforproviderEnclaveoptionsitem]
    _ephemeralBlockDevice? : [instance_schema.InstancespecforproviderEphemeralblockdeviceitem]
    _forceDestroy? : bool
    _getPasswordData? : bool
    _hibernation? : bool
    _hostId? : str
    _hostResourceGroupArn? : str
    _iamInstanceProfile? : str
    _instanceInitiatedShutdownBehavior? : str
    _instanceMarketOptions? : [instance_schema.InstancespecforproviderInstancemarketoptionsitem]
    _instanceType? : str
    _ipv6AddressCount? : float
    _ipv6Addresses? : [str]
    _keyName? : str
    _launchTemplate? : [instance_schema.InstancespecforproviderLaunchtemplateitem]
    _maintenanceOptions? : [instance_schema.InstancespecforproviderMaintenanceoptionsitem]
    _metadataOptions? : [instance_schema.InstancespecforproviderMetadataoptionsitem]
    _monitoring? : bool
    _networkInterface? : [instance_schema.InstancespecforproviderNetworkinterfaceitem]
    _placementGroup? : str
    _placementGroupId? : str
    _placementPartitionNumber? : float
    _primaryNetworkInterface? : [instance_schema.InstancespecforproviderPrimarynetworkinterfaceitem]
    _privateDnsNameOptions? : [instance_schema.InstancespecforproviderPrivatednsnameoptionsitem]
    _privateIp? : str
    _region : str
    _rootBlockDevice? : [instance_schema.InstancespecforproviderRootblockdeviceitem]
    _secondaryPrivateIps? : [str]
    _sourceDestCheck? : bool
    _subnetId? : str
    _subnetIdRef? : instance_schema.InstancespecforproviderSubnetidref
    _subnetIdSelector? : instance_schema.InstancespecforproviderSubnetidselector
    _tags? : {str:str}
    _tenancy? : str
    _userData? : str
    _userDataBase64? : str
    _userDataReplaceOnChange? : bool
    _volumeTags? : {str:str}
    _vpcSecurityGroupIdRefs? : [instance_schema.InstancespecforproviderVpcsecuritygroupidrefsitem]
    _vpcSecurityGroupIdSelector? : instance_schema.InstancespecforproviderVpcsecuritygroupidselector
    _vpcSecurityGroupIds? : [str]

    # Lógica de mapeo de parámetros simples a la estructura compleja
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
            ami = _ami
            associatePublicIpAddress = _associatePublicIpAddress
            availabilityZone = _availabilityZone
            capacityReservationSpecification = _capacityReservationSpecification
            cpuOptions = _cpuOptions
            creditSpecification = _creditSpecification
            disableApiStop = _disableApiStop
            disableApiTermination = _disableApiTermination
            ebsBlockDevice = _ebsBlockDevice
            ebsOptimized = _ebsOptimized
            enablePrimaryIpv6 = _enablePrimaryIpv6
            enclaveOptions = _enclaveOptions
            ephemeralBlockDevice = _ephemeralBlockDevice
            forceDestroy = _forceDestroy
            getPasswordData = _getPasswordData
            hibernation = _hibernation
            hostId = _hostId
            hostResourceGroupArn = _hostResourceGroupArn
            iamInstanceProfile = _iamInstanceProfile
            instanceInitiatedShutdownBehavior = _instanceInitiatedShutdownBehavior
            instanceMarketOptions = _instanceMarketOptions
            instanceType = _instanceType
            ipv6AddressCount = _ipv6AddressCount
            ipv6Addresses = _ipv6Addresses
            keyName = _keyName
            launchTemplate = _launchTemplate
            maintenanceOptions = _maintenanceOptions
            metadataOptions = _metadataOptions
            monitoring = _monitoring
            networkInterface = _networkInterface
            placementGroup = _placementGroup
            placementGroupId = _placementGroupId
            placementPartitionNumber = _placementPartitionNumber
            primaryNetworkInterface = _primaryNetworkInterface
            privateDnsNameOptions = _privateDnsNameOptions
            privateIp = _privateIp
            region = _region
            rootBlockDevice = _rootBlockDevice
            secondaryPrivateIps = _secondaryPrivateIps
            sourceDestCheck = _sourceDestCheck
            subnetId = _subnetId
            subnetIdRef = _subnetIdRef
            subnetIdSelector = _subnetIdSelector
            tags = _tags
            tenancy = _tenancy
            userData = _userData
            userDataBase64 = _userDataBase64
            userDataReplaceOnChange = _userDataReplaceOnChange
            volumeTags = _volumeTags
            vpcSecurityGroupIdRefs = _vpcSecurityGroupIdRefs
            vpcSecurityGroupIdSelector = _vpcSecurityGroupIdSelector
            vpcSecurityGroupIds = _vpcSecurityGroupIds
        }
        providerConfigRef.name = _providerConfig
    }
