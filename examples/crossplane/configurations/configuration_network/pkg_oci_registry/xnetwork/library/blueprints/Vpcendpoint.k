# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_VPCEndpoint as vpcendpoint_schema

schema VpcendpointBlueprint(vpcendpoint_schema.Vpcendpoint):
    """This Blueprint simplifies the creation of a Vpcendpoint resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : vpcendpoint_schema.VpcendpointspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : vpcendpoint_schema.VpcendpointspecWriteconnectionsecrettoref
    _autoAccept? : bool
    _dnsOptions? : [vpcendpoint_schema.VpcendpointspecforproviderDnsoptionsitem]
    _ipAddressType? : str
    _policy? : str
    _privateDnsEnabled? : bool
    _region : str
    _resourceConfigurationArn? : str
    _serviceName? : str
    _serviceNameRef? : vpcendpoint_schema.VpcendpointspecforproviderServicenameref
    _serviceNameSelector? : vpcendpoint_schema.VpcendpointspecforproviderServicenameselector
    _serviceNetworkArn? : str
    _serviceRegion? : str
    _subnetConfiguration? : [vpcendpoint_schema.VpcendpointspecforproviderSubnetconfigurationitem]
    _tags? : {str:str}
    _vpcEndpointType? : str
    _vpcId? : str
    _vpcIdRef? : vpcendpoint_schema.VpcendpointspecforproviderVpcidref
    _vpcIdSelector? : vpcendpoint_schema.VpcendpointspecforproviderVpcidselector

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
            autoAccept = _autoAccept
            dnsOptions = _dnsOptions
            ipAddressType = _ipAddressType
            policy = _policy
            privateDnsEnabled = _privateDnsEnabled
            region = _region
            resourceConfigurationArn = _resourceConfigurationArn
            serviceName = _serviceName
            serviceNameRef = _serviceNameRef
            serviceNameSelector = _serviceNameSelector
            serviceNetworkArn = _serviceNetworkArn
            serviceRegion = _serviceRegion
            subnetConfiguration = _subnetConfiguration
            tags = _tags
            vpcEndpointType = _vpcEndpointType
            vpcId = _vpcId
            vpcIdRef = _vpcIdRef
            vpcIdSelector = _vpcIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
