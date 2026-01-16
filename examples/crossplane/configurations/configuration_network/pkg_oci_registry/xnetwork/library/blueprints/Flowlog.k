# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_FlowLog as flowlog_schema

schema FlowlogBlueprint(flowlog_schema.Flowlog):
    """This Blueprint simplifies the creation of a Flowlog resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : flowlog_schema.FlowlogspecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : flowlog_schema.FlowlogspecWriteconnectionsecrettoref
    _deliverCrossAccountRole? : str
    _deliverCrossAccountRoleRef? : flowlog_schema.FlowlogspecforproviderDelivercrossaccountroleref
    _deliverCrossAccountRoleSelector? : flowlog_schema.FlowlogspecforproviderDelivercrossaccountroleselector
    _destinationOptions? : [flowlog_schema.FlowlogspecforproviderDestinationoptionsitem]
    _eniId? : str
    _iamRoleArn? : str
    _iamRoleArnRef? : flowlog_schema.FlowlogspecforproviderIamrolearnref
    _iamRoleArnSelector? : flowlog_schema.FlowlogspecforproviderIamrolearnselector
    _logDestination? : str
    _logDestinationRef? : flowlog_schema.FlowlogspecforproviderLogdestinationref
    _logDestinationSelector? : flowlog_schema.FlowlogspecforproviderLogdestinationselector
    _logDestinationType? : str
    _logFormat? : str
    _maxAggregationInterval? : float
    _region : str
    _subnetId? : str
    _subnetIdRef? : flowlog_schema.FlowlogspecforproviderSubnetidref
    _subnetIdSelector? : flowlog_schema.FlowlogspecforproviderSubnetidselector
    _tags? : {str:str}
    _trafficType? : str
    _transitGatewayAttachmentId? : str
    _transitGatewayId? : str
    _vpcId? : str
    _vpcIdRef? : flowlog_schema.FlowlogspecforproviderVpcidref
    _vpcIdSelector? : flowlog_schema.FlowlogspecforproviderVpcidselector

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
            deliverCrossAccountRole = _deliverCrossAccountRole
            deliverCrossAccountRoleRef = _deliverCrossAccountRoleRef
            deliverCrossAccountRoleSelector = _deliverCrossAccountRoleSelector
            destinationOptions = _destinationOptions
            eniId = _eniId
            iamRoleArn = _iamRoleArn
            iamRoleArnRef = _iamRoleArnRef
            iamRoleArnSelector = _iamRoleArnSelector
            logDestination = _logDestination
            logDestinationRef = _logDestinationRef
            logDestinationSelector = _logDestinationSelector
            logDestinationType = _logDestinationType
            logFormat = _logFormat
            maxAggregationInterval = _maxAggregationInterval
            region = _region
            subnetId = _subnetId
            subnetIdRef = _subnetIdRef
            subnetIdSelector = _subnetIdSelector
            tags = _tags
            trafficType = _trafficType
            transitGatewayAttachmentId = _transitGatewayAttachmentId
            transitGatewayId = _transitGatewayId
            vpcId = _vpcId
            vpcIdRef = _vpcIdRef
            vpcIdSelector = _vpcIdSelector
        }
        providerConfigRef.name = _providerConfig
    }
