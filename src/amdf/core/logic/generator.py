import json
import os
import subprocess
import textwrap
from pathlib import Path

# Format constants
INDENT = "    "
MODELS_DIR_NAME = "models"  # Directory name for generated schemas

def init_kcl_module_if_needed(base_dir: str):
    """
    Initialize KCL module in library directory if it doesn't exist.
    """
    library_dir = Path(base_dir) / "library"
    kcl_mod_file = library_dir / "kcl.mod"
    
    # If kcl.mod file already exists, do nothing
    if kcl_mod_file.exists():
        return
    
    # If library directory doesn't exist, create it
    if not library_dir.exists():
        library_dir.mkdir(parents=True, exist_ok=True)
    
    # Execute kcl mod init library from base directory
    try:
        result = subprocess.run(
            ["kcl", "mod", "init", "library"],
            cwd=base_dir,
            capture_output=True,
            text=True,
            check=True
        )
        print(f"✅ KCL module initialized: {result.stdout}")
    except subprocess.CalledProcessError as e:
        print(f"⚠️ Error initializing KCL module: {e.stderr}")
    except FileNotFoundError:
        print("⚠️ 'kcl' command not found. Make sure KCL is installed.")

def to_pascal_case(name):
    """Convert a string to PascalCase."""
    return name.replace("_", " ").title().replace(" ", "")

class KCLSchemaGenerator:
    """
    Generate a KCL schema from a CRD definition in JSON OpenAPI format.
    Adapted for library use.
    """

    def __init__(self, crd_name, context=None):
        self.crd_name = crd_name
        self.context = context
        self.crd_json = None
        self.schemas_to_generate = {}
        self.generated_schemas = set()

    def _get_crd_json(self):
        """Get CRD definition from Kubernetes."""
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
            raise RuntimeError(f"Could not get CRD '{self.crd_name}'. Stderr: {e.stderr}")
        except json.JSONDecodeError:
            raise ValueError("kubectl output is not valid JSON.")

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
            elif prop_type == "object" and "additionalProperties" in prop_def:
                # Handle dictionaries with typed values
                additional_props = prop_def["additionalProperties"]
                if additional_props.get("type") == "object" and "properties" in additional_props:
                    nested_schema_name = to_pascal_case(f"{schema_name}_{prop_name}Value")
                    self._find_all_schemas(nested_schema_name, additional_props)
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

        # For root schemas, always add Kubernetes standard fields first
        if is_root:
            api_version_val = f"{group}/{version}"
            attributes.append(f'apiVersion : str = "{api_version_val}"')
            attributes.append(f'kind : str = "{kind}"')
            # metadata is always present in Kubernetes resources
            if "metadata" not in properties:
                attributes.append("metadata? : any")

        for prop_name, prop_def in properties.items():
            # Skip if already added as root field
            if is_root and prop_name in ["apiVersion", "kind"]:
                continue
                
            kcl_type = self._get_kcl_type(prop_name, prop_def, schema_name)
            is_required = prop_name in required_fields
            attr_name = prop_name
            attr_line = f"{attr_name}{ '' if is_required else '?'} : {kcl_type}"
            attributes.append(attr_line)

        schema_body = textwrap.indent("\n".join(attributes), INDENT)
        self.generated_schemas.add(schema_name)
        return "schema " + schema_name + ":\n" + textwrap.indent(docstring, INDENT) + "\n" + schema_body

    def generate(self, base_dir=""):
        """Return the path of the generated file and its content."""
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
            raise ValueError(f"CRD JSON does not have expected structure: {e}")

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
        
        # Initialize KCL module if needed
        init_kcl_module_if_needed(base_dir)
        
        # Structure library/<MODELS_DIR_NAME>/group/version/file.k
        output_dir = Path(base_dir) / "library" / MODELS_DIR_NAME / group_path / version
        output_path = output_dir / filename

        os.makedirs(output_dir, exist_ok=True)
        
        with open(output_path, "w", encoding='utf-8') as f:
            f.write(file_content)

        return str(output_path), file_content

def list_available_crds(context=None):
    """List all available CRDs in the cluster."""
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
        raise RuntimeError(f"Error listing CRDs: {e.stderr}")
