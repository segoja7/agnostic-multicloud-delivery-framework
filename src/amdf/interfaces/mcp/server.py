from mcp.server.fastmcp import FastMCP
from pathlib import Path
from ...core.logic.generator import KCLSchemaGenerator, list_available_crds, init_kcl_module_if_needed
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
        # Paso 1: Generar Schema Detallado
        # kcl_generator.py ya está configurado para guardar en 'library/models'
        base_dir = str(Path.cwd())
        generator = KCLSchemaGenerator(crd_name=crd_name, context=context)

        schema_path, schema_content = generator.generate(base_dir=base_dir)

        # Paso 2: Generar Blueprint
        # Recuperamos 'main_schema_name' (ej: Vpc) para usarlo como nombre de archivo corto
        blueprint_code, bp_name, main_schema_name = generate_blueprint_from_schema(schema_content, Path(schema_path))

        if not bp_name:
            return f"⚠️ Schema generado en {schema_path}, pero falló la generación del Blueprint."

        # Inicializar módulo KCL si es necesario
        init_kcl_module_if_needed(base_dir)
        
        # Guardar Blueprint en 'library/blueprints/' con nombre corto (ej: Vpc.k)
        # Esto simplifica drásticamente la experiencia del desarrollador final.
        blueprint_dir = Path(base_dir) / "library" / "blueprints"
        blueprint_dir.mkdir(parents=True, exist_ok=True)

        # Nombre de archivo limpio: Vpc.k
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
        return f"❌ Error crítico durante el proceso: {str(e)}"

def main():
    """Entry point for MCP server"""
    server.run()

if __name__ == "__main__":
    main()