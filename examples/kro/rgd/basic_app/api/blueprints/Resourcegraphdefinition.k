# --- High-Level Blueprint (Auto-Generated) ---

import models.kro_run.v1alpha1.kro_run_v1alpha1_ResourceGraphDefinition as resourcegraphdefinition_schema

schema ResourcegraphdefinitionBlueprint(resourcegraphdefinition_schema.Resourcegraphdefinition):
    """This Blueprint simplifies the creation of a Resourcegraphdefinition resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _resources? : [resourcegraphdefinition_schema.ResourcegraphdefinitionspecResourcesitem]
    _schema : resourcegraphdefinition_schema.ResourcegraphdefinitionspecSchema

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        resources = _resources
        schema = _schema
    }
