# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import models.argoproj_io.v1alpha1.argoproj_io_v1alpha1_ApplicationSet as applicationset_schema

schema ApplicationsetBlueprint(applicationset_schema.Applicationset):
    """Este Blueprint simplifica la creación de un recurso Applicationset,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _applyNestedSelectors? : bool
    _generators : [applicationset_schema.ApplicationsetspecGeneratorsitem]
    _goTemplate? : bool
    _goTemplateOptions? : [str]
    _ignoreApplicationDifferences? : [applicationset_schema.ApplicationsetspecIgnoreapplicationdifferencesitem]
    _preservedFields? : applicationset_schema.ApplicationsetspecPreservedfields
    _strategy? : applicationset_schema.ApplicationsetspecStrategy
    _syncPolicy? : applicationset_schema.ApplicationsetspecSyncpolicy
    _template : applicationset_schema.ApplicationsetspecTemplate
    _templatePatch? : str

    # Lógica de mapeo de parámetros simples a la estructura compleja
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        applyNestedSelectors = _applyNestedSelectors
        generators = _generators
        goTemplate = _goTemplate
        goTemplateOptions = _goTemplateOptions
        ignoreApplicationDifferences = _ignoreApplicationDifferences
        preservedFields = _preservedFields
        strategy = _strategy
        syncPolicy = _syncPolicy
        template = _template
        templatePatch = _templatePatch
    }
