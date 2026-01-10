import json
import os
import subprocess
import textwrap
from pathlib import Path

# Constantes de formato
INDENT = "    "
MODELS_DIR_NAME = "models" # Nombre del directorio para los schemas generados

def init_kcl_module_if_needed(base_dir: str):
    """
    Inicializa el módulo KCL en el directorio library si no existe.
    """
    library_dir = Path(base_dir) / "library"
    kcl_mod_file = library_dir / "kcl.mod"
    
    # Si ya existe el archivo kcl.mod, no hacer nada
    if kcl_mod_file.exists():
        return
    
    # Si el directorio library no existe, crearlo
    if not library_dir.exists():
        library_dir.mkdir(parents=True, exist_ok=True)
    
    # Ejecutar kcl mod init library desde el directorio base
    try:
        result = subprocess.run(
            ["kcl", "mod", "init", "library"],
            cwd=base_dir,
            capture_output=True,
            text=True,
            check=True
        )
        print(f"✅ Módulo KCL inicializado: {result.stdout}")
    except subprocess.CalledProcessError as e:
        print(f"⚠️ Error al inicializar módulo KCL: {e.stderr}")
    except FileNotFoundError:
        print("⚠️ Comando 'kcl' no encontrado. Asegúrate de que KCL esté instalado.")

def to_pascal_case(name):
    """Convierte un string a PascalCase."""
    return name.replace("_", " ").title().replace(" ", "")

class KCLSchemaGenerator:
    """
    Genera un schema KCL a partir de una definición de CRD en formato JSON OpenAPI.
    Adaptado para uso como librería.
    """

    def __init__(self, crd_name, context=None):
        self.crd_name = crd_name
        self.context = context
        self.crd_json = None
        self.schemas_to_generate = {}
        self.generated_schemas = set()

    def _get_crd_json(self):
        """Obtiene la definición del CRD desde Kubernetes."""
        try:
            command = ["kubectl"]
            if self.context:
                command.extend(["--context", self.context])
            command.extend(["get", "crd", self.crd_name, "-o", "json"])

            result = subprocess.run(
                command,
                capture_output=True,
                text=True,
                check=True,
            )
            self.crd_json = json.loads(result.stdout)
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"No se pudo obtener el CRD '{self.crd_name}'. Stderr: {e.stderr}")
        except json.JSONDecodeError:
            raise ValueError("La salida de kubectl no es un JSON válido.")

    def _find_all_schemas(self, schema_name, schema_def):
        if not schema_def or schema_name in self.schemas_to_generate:
            return

        self.schemas_to_generate[schema_name] = schema_def

        properties = schema_def.get("properties", {})
        for prop_name, prop_def in properties.items():
            prop_type = prop_def.get("type")

            if prop_type == "object" and "properties" in prop_def:
                nested_schema_name = to_pascal_case(f"{schema_name}_{prop_name}")
                self._find_all_schemas(nested_schema_name, prop_def)
            elif prop_type == "array" and prop_def.get("items", {}).get("type") == "object":
                items_def = prop_def.get("items", {})
                if "properties" in items_def:
                    nested_schema_name = to_pascal_case(f"{schema_name}_{prop_name}Item")
                    self._find_all_schemas(nested_schema_name, items_def)

    def _get_kcl_type(self, prop_name, prop_def, parent_schema_name):
        prop_type = prop_def.get("type")
        if prop_type == "string":
            if "enum" in prop_def:
                return " | ".join([f'\"{e}\"' for e in prop_def["enum"]])
            return "str"
        if prop_type == "boolean":
            return "bool"
        if prop_type == "integer":
            return "int"
        if prop_type == "number":
            return "float"
        if prop_type == "array":
            items = prop_def.get("items", {})
            item_type = self._get_kcl_type(f"{prop_name}Item", items, parent_schema_name)
            return f"[{item_type}]"
        if prop_type == "object":
            if "properties" in prop_def:
                return to_pascal_case(f"{parent_schema_name}_{prop_name}")
            if "additionalProperties" in prop_def:
                val_type = self._get_kcl_type(
                    f"{prop_name}Value", prop_def["additionalProperties"], parent_schema_name
                )
                return f"{{str:{val_type}}}"
        if "$ref" in prop_def:
            ref_name = prop_def["$ref"].split("/")[-1]
            if "io.k8s.apimachinery.pkg.apis.meta.v1" in prop_def["$ref"]:
                return f'''meta.{ref_name.split(".")[-1]}'''
            return to_pascal_case(ref_name.split(".")[-1])

        return "any"

    def _generate_docstring(self, schema_name, schema_def):
        description = textwrap.dedent(schema_def.get("description", f"{schema_name} schema.")).strip()
        lines = ['"""', description, '']
        properties = schema_def.get("properties", {})
        if properties:
            lines.append('Attributes')
            lines.append('----------')
            required_fields = schema_def.get("required", [])

            for prop_name, prop_def in properties.items():
                kcl_type = self._get_kcl_type(prop_name, prop_def, schema_name)
                req_opt = "required" if prop_name in required_fields else "optional"
                attr_line = f"{prop_name} : {kcl_type}, {req_opt}"
                prop_desc = textwrap.dedent(prop_def.get("description", "No description available.")).strip()
                indented_desc = textwrap.indent(prop_desc, INDENT)
                lines.append(attr_line + "\n" + indented_desc)
        lines.append('"""')
        return "\n".join(lines)

    def _generate_single_schema(self, schema_name, schema_def, is_root=False, group=None, version=None, kind=None):
        if schema_name in self.generated_schemas:
            return ""

        docstring = self._generate_docstring(schema_name, schema_def)
        attributes = []
        properties = schema_def.get("properties", {})
        required_fields = schema_def.get("required", [])

        for prop_name, prop_def in properties.items():
            kcl_type = self._get_kcl_type(prop_name, prop_def, schema_name)
            if is_root and prop_name in ["apiVersion", "kind"]:
                is_required = True
            else:
                is_required = prop_name in required_fields

            attr_name = prop_name
            attr_line = f"{attr_name}{ '' if is_required else '?'} : {kcl_type}"

            if is_root and prop_name == "apiVersion":
                api_version_val = f"{group}/{version}"
                attr_line += f' = "{api_version_val}"'
            elif is_root and prop_name == "kind":
                attr_line += f' = "{kind}"'

            attributes.append(attr_line)

        schema_body = textwrap.indent("\n".join(attributes), INDENT)
        self.generated_schemas.add(schema_name)
        return "schema " + schema_name + ":\n" + textwrap.indent(docstring, INDENT) + "\n" + schema_body

    def generate(self, base_dir=""):
        """Devuelve la ruta del archivo generado y su contenido."""
        self._get_crd_json()

        try:
            crd_spec = self.crd_json["spec"]
            gvk_info = crd_spec["versions"][0]
            for v in crd_spec["versions"]:
                if v.get("served", True):
                    gvk_info = v
                    break

            spec_schema = gvk_info["schema"]["openAPIV3Schema"]
            group = crd_spec["group"]
            version = gvk_info["name"]
            kind = crd_spec["names"]["kind"]
        except KeyError as e:
            raise ValueError(f"El JSON del CRD no tiene la estructura esperada: {e}")

        self._find_all_schemas(to_pascal_case(kind), spec_schema)

        schema_names_ordered = list(self.schemas_to_generate.keys())
        all_kcl_code = []
        for i, schema_name in enumerate(schema_names_ordered):
            schema_def = self.schemas_to_generate[schema_name]
            is_root = (i == 0)
            all_kcl_code.append(self._generate_single_schema(
                schema_name, schema_def, is_root=is_root,
                group=group, version=version, kind=kind
            ))

        file_header = textwrap.dedent('''
            """
            This file was generated automatically and is intended to be a KCL Schema
            schema representation of a Kubernetes CRD.
            DO NOT EDIT MANUALLY.
            """
        ''').strip()

        file_content = f"{file_header}\n\n" + "\n\n".join(all_kcl_code)

        group_path = group.replace(".", "_")
        filename = f"{group_path}_{version}_{kind}.k"
        
        # Inicializar módulo KCL si es necesario
        init_kcl_module_if_needed(base_dir)
        
        # Estructura library/<MODELS_DIR_NAME>/group/version/file.k
        output_dir = Path(base_dir) / "library" / MODELS_DIR_NAME / group_path / version
        output_path = output_dir / filename

        os.makedirs(output_dir, exist_ok=True)
        
        with open(output_path, "w", encoding='utf-8') as f:
            f.write(file_content)

        return str(output_path), file_content

def list_available_crds(context=None):
    """Lista todos los CRDs disponibles en el cluster."""
    try:
        command = ["kubectl"]
        if context:
            command.extend(["--context", context])
        command.extend(["get", "crd", "--no-headers", "-o", "custom-columns=NAME:.metadata.name"])

        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=True,
        )
        crds = [line.strip() for line in result.stdout.strip().split('\n') if line.strip()]
        return sorted(crds)
    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"Error listando CRDs: {e.stderr}")
