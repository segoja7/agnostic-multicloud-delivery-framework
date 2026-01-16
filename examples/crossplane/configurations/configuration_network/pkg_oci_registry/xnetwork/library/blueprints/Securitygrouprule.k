# --- High-Level Blueprint (Auto-Generated) ---

import models.ec2_aws_upbound_io.v1beta1.ec2_aws_upbound_io_v1beta1_SecurityGroupRule as securitygrouprule_schema

schema SecuritygroupruleBlueprint(securitygrouprule_schema.Securitygrouprule):
    """This Blueprint simplifies the creation of a Securitygrouprule resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _initProvider? : securitygrouprule_schema.SecuritygrouprulespecInitprovider
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : securitygrouprule_schema.SecuritygrouprulespecWriteconnectionsecrettoref
    _cidrBlocks? : [str]
    _cidrBlocksRefs? : [securitygrouprule_schema.SecuritygrouprulespecforproviderCidrblocksrefsitem]
    _cidrBlocksSelector? : securitygrouprule_schema.SecuritygrouprulespecforproviderCidrblocksselector
    _description? : str
    _fromPort? : float
    _ipv6CidrBlocks? : [str]
    _ipv6CidrBlocksRefs? : [securitygrouprule_schema.SecuritygrouprulespecforproviderIpv6Cidrblocksrefsitem]
    _ipv6CidrBlocksSelector? : securitygrouprule_schema.SecuritygrouprulespecforproviderIpv6Cidrblocksselector
    _prefixListIdRefs? : [securitygrouprule_schema.SecuritygrouprulespecforproviderPrefixlistidrefsitem]
    _prefixListIdSelector? : securitygrouprule_schema.SecuritygrouprulespecforproviderPrefixlistidselector
    _prefixListIds? : [str]
    _protocol? : str
    _region : str
    _securityGroupId? : str
    _securityGroupIdRef? : securitygrouprule_schema.SecuritygrouprulespecforproviderSecuritygroupidref
    _securityGroupIdSelector? : securitygrouprule_schema.SecuritygrouprulespecforproviderSecuritygroupidselector
    _self? : bool
    _sourceSecurityGroupId? : str
    _sourceSecurityGroupIdRef? : securitygrouprule_schema.SecuritygrouprulespecforproviderSourcesecuritygroupidref
    _sourceSecurityGroupIdSelector? : securitygrouprule_schema.SecuritygrouprulespecforproviderSourcesecuritygroupidselector
    _toPort? : float
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
        deletionPolicy = _deletionPolicy
        initProvider = _initProvider
        managementPolicies = _managementPolicies
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            cidrBlocks = _cidrBlocks
            cidrBlocksRefs = _cidrBlocksRefs
            cidrBlocksSelector = _cidrBlocksSelector
            description = _description
            fromPort = _fromPort
            ipv6CidrBlocks = _ipv6CidrBlocks
            ipv6CidrBlocksRefs = _ipv6CidrBlocksRefs
            ipv6CidrBlocksSelector = _ipv6CidrBlocksSelector
            prefixListIdRefs = _prefixListIdRefs
            prefixListIdSelector = _prefixListIdSelector
            prefixListIds = _prefixListIds
            protocol = _protocol
            region = _region
            securityGroupId = _securityGroupId
            securityGroupIdRef = _securityGroupIdRef
            securityGroupIdSelector = _securityGroupIdSelector
            self = _self
            sourceSecurityGroupId = _sourceSecurityGroupId
            sourceSecurityGroupIdRef = _sourceSecurityGroupIdRef
            sourceSecurityGroupIdSelector = _sourceSecurityGroupIdSelector
            toPort = _toPort
            type = _type
        }
        providerConfigRef.name = _providerConfig
    }
