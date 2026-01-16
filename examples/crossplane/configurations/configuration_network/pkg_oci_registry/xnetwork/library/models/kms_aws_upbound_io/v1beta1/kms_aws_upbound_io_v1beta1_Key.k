"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.
DO NOT EDIT MANUALLY.
"""

schema Key:
    """
    Key is the Schema for the Keys API. Manages a single-Region or multi-Region primary KMS key.

    Attributes
    ----------
    apiVersion : str, optional
        APIVersion defines the versioned schema of this representation of an object.
        Servers should convert recognized schemas to the latest internal value, and
        may reject unrecognized values.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, optional
        Kind is a string value representing the REST resource this object represents.
        Servers may infer this from the endpoint the client submits requests to.
        Cannot be updated.
        In CamelCase.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : any, optional
        No description available.
    spec : KeySpec, required
        KeySpec defines the desired state of Key
    status : KeyStatus, optional
        KeyStatus defines the observed state of Key.
    """
    apiVersion : str = "kms.aws.upbound.io/v1beta1"
    kind : str = "Key"
    metadata? : any
    spec : KeySpec
    status? : KeyStatus

schema KeySpec:
    """
    KeySpec defines the desired state of Key

    Attributes
    ----------
    deletionPolicy : "Orphan" | "Delete", optional
        DeletionPolicy specifies what will happen to the underlying external
        when this managed resource is deleted - either "Delete" or "Orphan" the
        external resource.
        This field is planned to be deprecated in favor of the ManagementPolicies
        field in a future release. Currently, both could be set independently and
        non-default values would be honored if the feature flag is enabled.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
    forProvider : KeyspecForprovider, required
        No description available.
    initProvider : KeyspecInitprovider, optional
        THIS IS A BETA FIELD. It will be honored
        unless the Management Policies feature flag is disabled.
        InitProvider holds the same fields as ForProvider, with the exception
        of Identifier and other resource reference fields. The fields that are
        in InitProvider are merged into ForProvider when the resource is created.
        The same fields are also added to the terraform ignore_changes hook, to
        avoid updating them after creation. This is useful for fields that are
        required on creation, but we do not desire to update them after creation,
        for example because of an external controller is managing them, like an
        autoscaler.
    managementPolicies : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"], optional
        THIS IS A BETA FIELD. It is on by default but can be opted out
        through a Crossplane feature flag.
        ManagementPolicies specify the array of actions Crossplane is allowed to
        take on the managed and external resources.
        This field is planned to replace the DeletionPolicy field in a future
        release. Currently, both could be set independently and non-default
        values would be honored if the feature flag is enabled. If both are
        custom, the DeletionPolicy field will be ignored.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
        and this one: https://github.com/crossplane/crossplane/blob/444267e84783136daa93568b364a5f01228cacbe/design/one-pager-ignore-changes.md
    providerConfigRef : KeyspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : KeyspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : KeyspecForprovider
    initProvider? : KeyspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : KeyspecProviderconfigref
    writeConnectionSecretToRef? : KeyspecWriteconnectionsecrettoref

schema KeyspecForprovider:
    """
    KeyspecForprovider schema.

    Attributes
    ----------
    bypassPolicyLockoutSafetyCheck : bool, optional
        A flag to indicate whether to bypass the key policy lockout safety check.
        Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.
        For more information, refer to the scenario in the Default Key Policy section in the AWS Key Management Service Developer Guide.
        The default value is false.
    customKeyStoreId : str, optional
        ID of the KMS Custom Key Store where the key will be stored instead of KMS (eg CloudHSM).
    customerMasterKeySpec : str, optional
        Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports.
        Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_224, HMAC_256, HMAC_384, HMAC_512, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, ECC_SECG_P256K1, ML_DSA_44, ML_DSA_65, ML_DSA_87, or SM2 (China Regions only). Defaults to SYMMETRIC_DEFAULT. For help with choosing a key spec, see the AWS KMS Developer Guide.
    deletionWindowInDays : float, optional
        The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key.
        If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30.
        If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.
    description : str, optional
        The description of the key as viewed in AWS console.
    enableKeyRotation : bool, optional
        Specifies whether key rotation is enabled. Defaults to false.
    isEnabled : bool, optional
        Specifies whether the key is enabled. Defaults to true.
    keyUsage : str, optional
        Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC.
        Defaults to ENCRYPT_DECRYPT.
    multiRegion : bool, optional
        Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false.
    policy : str, optional
        A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    rotationPeriodInDays : float, optional
        Custom period of time between each rotation date. Must be a number between 90 and 2560 (inclusive).
    tags : {str:str}, optional
        Key-value map of resource tags.
    xksKeyId : str, optional
        Identifies the external key that serves as key material for the KMS key in an external key store.
    """
    bypassPolicyLockoutSafetyCheck? : bool
    customKeyStoreId? : str
    customerMasterKeySpec? : str
    deletionWindowInDays? : float
    description? : str
    enableKeyRotation? : bool
    isEnabled? : bool
    keyUsage? : str
    multiRegion? : bool
    policy? : str
    region : str
    rotationPeriodInDays? : float
    tags? : {str:str}
    xksKeyId? : str

schema KeyspecInitprovider:
    """
    THIS IS A BETA FIELD. It will be honored
    unless the Management Policies feature flag is disabled.
    InitProvider holds the same fields as ForProvider, with the exception
    of Identifier and other resource reference fields. The fields that are
    in InitProvider are merged into ForProvider when the resource is created.
    The same fields are also added to the terraform ignore_changes hook, to
    avoid updating them after creation. This is useful for fields that are
    required on creation, but we do not desire to update them after creation,
    for example because of an external controller is managing them, like an
    autoscaler.

    Attributes
    ----------
    bypassPolicyLockoutSafetyCheck : bool, optional
        A flag to indicate whether to bypass the key policy lockout safety check.
        Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.
        For more information, refer to the scenario in the Default Key Policy section in the AWS Key Management Service Developer Guide.
        The default value is false.
    customKeyStoreId : str, optional
        ID of the KMS Custom Key Store where the key will be stored instead of KMS (eg CloudHSM).
    customerMasterKeySpec : str, optional
        Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports.
        Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_224, HMAC_256, HMAC_384, HMAC_512, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, ECC_SECG_P256K1, ML_DSA_44, ML_DSA_65, ML_DSA_87, or SM2 (China Regions only). Defaults to SYMMETRIC_DEFAULT. For help with choosing a key spec, see the AWS KMS Developer Guide.
    deletionWindowInDays : float, optional
        The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key.
        If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30.
        If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.
    description : str, optional
        The description of the key as viewed in AWS console.
    enableKeyRotation : bool, optional
        Specifies whether key rotation is enabled. Defaults to false.
    isEnabled : bool, optional
        Specifies whether the key is enabled. Defaults to true.
    keyUsage : str, optional
        Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC.
        Defaults to ENCRYPT_DECRYPT.
    multiRegion : bool, optional
        Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false.
    policy : str, optional
        A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used.
    rotationPeriodInDays : float, optional
        Custom period of time between each rotation date. Must be a number between 90 and 2560 (inclusive).
    tags : {str:str}, optional
        Key-value map of resource tags.
    xksKeyId : str, optional
        Identifies the external key that serves as key material for the KMS key in an external key store.
    """
    bypassPolicyLockoutSafetyCheck? : bool
    customKeyStoreId? : str
    customerMasterKeySpec? : str
    deletionWindowInDays? : float
    description? : str
    enableKeyRotation? : bool
    isEnabled? : bool
    keyUsage? : str
    multiRegion? : bool
    policy? : str
    rotationPeriodInDays? : float
    tags? : {str:str}
    xksKeyId? : str

schema KeyspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : KeyspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : KeyspecproviderconfigrefPolicy

schema KeyspecproviderconfigrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema KeyspecWriteconnectionsecrettoref:
    """
    WriteConnectionSecretToReference specifies the namespace and name of a
    Secret to which any connection details for this managed resource should
    be written. Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    name : str
    namespace : str

schema KeyStatus:
    """
    KeyStatus defines the observed state of Key.

    Attributes
    ----------
    atProvider : KeystatusAtprovider, optional
        No description available.
    conditions : [KeystatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : KeystatusAtprovider
    conditions? : [KeystatusConditionsitem]
    observedGeneration? : int

schema KeystatusAtprovider:
    """
    KeystatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        The Amazon Resource Name (ARN) of the key.
    bypassPolicyLockoutSafetyCheck : bool, optional
        A flag to indicate whether to bypass the key policy lockout safety check.
        Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.
        For more information, refer to the scenario in the Default Key Policy section in the AWS Key Management Service Developer Guide.
        The default value is false.
    customKeyStoreId : str, optional
        ID of the KMS Custom Key Store where the key will be stored instead of KMS (eg CloudHSM).
    customerMasterKeySpec : str, optional
        Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports.
        Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_224, HMAC_256, HMAC_384, HMAC_512, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, ECC_SECG_P256K1, ML_DSA_44, ML_DSA_65, ML_DSA_87, or SM2 (China Regions only). Defaults to SYMMETRIC_DEFAULT. For help with choosing a key spec, see the AWS KMS Developer Guide.
    deletionWindowInDays : float, optional
        The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key.
        If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30.
        If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.
    description : str, optional
        The description of the key as viewed in AWS console.
    enableKeyRotation : bool, optional
        Specifies whether key rotation is enabled. Defaults to false.
    id : str, optional
        (String) ID of the KMS key.
    isEnabled : bool, optional
        Specifies whether the key is enabled. Defaults to true.
    keyId : str, optional
        The globally unique identifier for the key.
    keyUsage : str, optional
        Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC.
        Defaults to ENCRYPT_DECRYPT.
    multiRegion : bool, optional
        Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false.
    policy : str, optional
        A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    rotationPeriodInDays : float, optional
        Custom period of time between each rotation date. Must be a number between 90 and 2560 (inclusive).
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    xksKeyId : str, optional
        Identifies the external key that serves as key material for the KMS key in an external key store.
    """
    arn? : str
    bypassPolicyLockoutSafetyCheck? : bool
    customKeyStoreId? : str
    customerMasterKeySpec? : str
    deletionWindowInDays? : float
    description? : str
    enableKeyRotation? : bool
    id? : str
    isEnabled? : bool
    keyId? : str
    keyUsage? : str
    multiRegion? : bool
    policy? : str
    region? : str
    rotationPeriodInDays? : float
    tags? : {str:str}
    tagsAll? : {str:str}
    xksKeyId? : str

schema KeystatusConditionsitem:
    """
    A Condition that may apply to a resource.

    Attributes
    ----------
    lastTransitionTime : str, required
        LastTransitionTime is the last time this condition transitioned from one
        status to another.
    message : str, optional
        A Message containing details about this condition's last transition from
        one status to another, if any.
    observedGeneration : int, optional
        ObservedGeneration represents the .metadata.generation that the condition was set based upon.
        For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
        with respect to the current state of the instance.
    reason : str, required
        A Reason for this condition's last transition from one status to another.
    status : str, required
        Status of this condition; is it currently True, False, or Unknown?
    type : str, required
        Type of this condition. At most one of each condition type may apply to
        a resource at any point in time.
    """
    lastTransitionTime : str
    message? : str
    observedGeneration? : int
    reason : str
    status : str
    type : str