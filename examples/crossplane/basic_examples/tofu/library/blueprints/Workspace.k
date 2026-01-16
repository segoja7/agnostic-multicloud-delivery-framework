# --- High-Level Blueprint (Auto-Generated) ---

import models.opentofu_upbound_io.v1beta1.opentofu_upbound_io_v1beta1_Workspace as workspace_schema

schema WorkspaceBlueprint(workspace_schema.Workspace):
    """This Blueprint simplifies the creation of a Workspace resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy? : "Orphan" | "Delete"
    _managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef? : workspace_schema.WorkspacespecWriteconnectionsecrettoref
    _applyArgs? : [str]
    _destroyArgs? : [str]
    _enableTofuCLILogging? : bool
    _entrypoint? : str
    _env? : [workspace_schema.WorkspacespecforproviderEnvitem]
    _initArgs? : [str]
    _inlineFormat? : "HCL"
    _module : str
    _planArgs? : [str]
    _source : "Remote"
    _varFiles? : [workspace_schema.WorkspacespecforproviderVarfilesitem]
    _varmap? : any
    _vars? : [workspace_schema.WorkspacespecforproviderVarsitem]

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
        managementPolicies = _managementPolicies
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            applyArgs = _applyArgs
            destroyArgs = _destroyArgs
            enableTofuCLILogging = _enableTofuCLILogging
            entrypoint = _entrypoint
            env = _env
            initArgs = _initArgs
            inlineFormat = _inlineFormat
            module = _module
            planArgs = _planArgs
            source = _source
            varFiles = _varFiles
            varmap = _varmap
            vars = _vars
        }
        providerConfigRef.name = _providerConfig
    }
