# --- High-Level Blueprint (Auto-Generated) ---

import models.k8s.v1.k8s_v1_ServiceAccount as serviceaccount_schema

schema ServiceAccountBlueprint(serviceaccount_schema.ServiceAccount):
    """This Blueprint simplifies the creation of a ServiceAccount resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _automountServiceAccountToken? : bool
    _imagePullSecrets? : [serviceaccount_schema.ServiceaccountImagepullsecretsitem]
    _secrets? : [serviceaccount_schema.ServiceaccountSecretsitem]

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    automountServiceAccountToken = _automountServiceAccountToken
    imagePullSecrets = _imagePullSecrets
    secrets = _secrets
