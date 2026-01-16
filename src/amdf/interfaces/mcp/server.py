from mcp.server.fastmcp import FastMCP
from pathlib import Path
from ...core.logic.generator import KCLSchemaGenerator, list_available_crds, init_kcl_module_if_needed
from ...core.logic.k8s_generator import K8SNativeGenerator
from ...core.logic.blueprint import generate_blueprint_from_schema

# Definimos el servidor
server = FastMCP("kcl-schema-generator")

@server.tool()
def list_k8s_crds(filter_text: str = None, context: str = None) -> list[str]:
    """
    Lista los Custom Resource Definitions (CRDs) disponibles en el cluster de Kubernetes.
    Opcionalmente filtra por texto.
    """
    try:
        crds = list_available_crds(context)
        if filter_text:
            return [c for c in crds if filter_text.lower() in c.lower()]
        return crds
    except Exception as e:
        return [f"Error al listar CRDs: {str(e)}"]

@server.tool()
def process_crd_to_kcl(crd_name: str, context: str = None) -> str:
    """
    Flujo completo:
    1. Extrae el CRD de Kubernetes.
    2. Genera el Schema KCL detallado en 'library/models'.
    3. Genera el Blueprint KCL simplificado en 'library/blueprints'.

    Retorna la ubicación de los archivos generados.
    """
    try:
        # Step 1: Generate Detailed Schema
        # kcl_generator.py is already configured to save in 'library/models'
        base_dir = str(Path.cwd())
        generator = KCLSchemaGenerator(crd_name=crd_name, context=context)

        schema_path, schema_content = generator.generate(base_dir=base_dir)

        # Step 2: Generate Blueprint
        # Retrieve 'main_schema_name' (e.g., Vpc) to use as short filename
        blueprint_code, bp_name, main_schema_name = generate_blueprint_from_schema(schema_content, Path(schema_path))

        if not bp_name:
            return f"⚠️ Schema generated at {schema_path}, but Blueprint generation failed."

        # Initialize KCL module if needed
        init_kcl_module_if_needed(base_dir)
        
        # Save Blueprint in 'library/blueprints/' with short name (e.g., Vpc.k)
        # This dramatically simplifies the end developer experience.
        blueprint_dir = Path(base_dir) / "library" / "blueprints"
        blueprint_dir.mkdir(parents=True, exist_ok=True)

        # Clean filename: Vpc.k
        output_bp_path = blueprint_dir / f"{main_schema_name}.k"

        output_bp_path.write_text(blueprint_code, encoding='utf-8')

        return f"""✅ Proceso completado exitosamente.

1. Schema Detallado (Backend):
   {schema_path}

2. Blueprint Simplificado (Frontend):
   {output_bp_path}

Puedes usar el blueprint así:

import library.blueprints.{main_schema_name}

{main_schema_name}.{bp_name} {{
    _metadataName = "mi-recurso"
    ...
}}
"""

    except Exception as e:
        return f"❌ Critical error during process: {str(e)}"

@server.tool()
def process_k8s_to_kcl(kind: str, k8s_version: str = "1.35.0") -> str:
    """
    Complete workflow for native Kubernetes objects:
    1. Downloads the Kubernetes OpenAPI spec.
    2. Extracts the native object definition.
    3. Generates detailed KCL Schema in 'library/models'.
    4. Generates simplified KCL Blueprint in 'library/blueprints'.

    Returns the location of the generated files.
    """
    try:
        base_dir = str(Path.cwd())
        
        # Generate schema from native K8s object
        generator = K8SNativeGenerator(kind=kind, k8s_version=k8s_version)
        schema_path, schema_content = generator.generate(base_dir=base_dir)
        
        # Generate blueprint
        blueprint_code, bp_name, main_schema_name = generate_blueprint_from_schema(
            schema_content, Path(schema_path)
        )
        
        if not bp_name:
            return f"⚠️ Schema generated at {schema_path}, but Blueprint generation failed."
        
        # Save Blueprint
        blueprint_dir = Path(base_dir) / "library" / "blueprints"
        blueprint_dir.mkdir(parents=True, exist_ok=True)
        output_bp_path = blueprint_dir / f"{main_schema_name}.k"
        output_bp_path.write_text(blueprint_code, encoding='utf-8')
        
        return f"""✅ Kubernetes {kind} schema generated successfully (v{k8s_version}).

1. Detailed Schema (Backend):
   {schema_path}

2. Simplified Blueprint (Frontend):
   {output_bp_path}

Usage example:

import library.blueprints.{main_schema_name}

{main_schema_name.lower()} = {main_schema_name}.{bp_name} {{
    _metadataName = "my-{kind.lower()}"
    _namespace = "demo"
    ...
}}
"""
        
    except Exception as e:
        return f"❌ Critical error generating Kubernetes {kind} schema: {str(e)}"


def main():
    """Entry point for MCP server"""
    server.run()

if __name__ == "__main__":
    main()