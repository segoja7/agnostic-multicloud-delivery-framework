import re
from pathlib import Path

def generate_blueprint_from_schema(detailed_kcl_schema: str, input_filepath: Path) -> tuple[str, str, str]:
    """
    Generate a high-level Blueprint from detailed KCL schema.
    Returns: (blueprint_code, blueprint_name, main_schema_name)
    """
    
    schemas = {match.group(1): match.group(2) for match in re.finditer(r"schema\s+(\w+):\s*((?:[\s\S])*?)(?=\n\nschema|\Z)", detailed_kcl_schema)}
    if not schemas:
        return "# ERROR: No schemas found.", "", ""

    # Find main schema
    main_schema_name = next((name for name, body in schemas.items() 
                           if all(re.search(r"^\s*" + attr + r"\s*\??\s*:", body, re.MULTILINE | re.IGNORECASE) 
                                 for attr in ["apiVersion", "kind", "spec"])), None) 
    
    if not main_schema_name:
        return "# ERROR: Could not identify main schema.", "", ""
    
    main_schema_text = schemas[main_schema_name]
    blueprint_name = f"{main_schema_name}Blueprint"
    
    # Generate relative import path based on actual folder structure
    try:
        # Get absolute path to ensure we have all segments
        abs_path = input_filepath.resolve()
        path_parts = abs_path.parts
        
        # Look for 'library' as master anchor point
        # This makes the code agnostic to the 'models' name. If you change it to 'schemas', it will work the same.
        if "library" in path_parts:
            lib_index = path_parts.index("library")
            # Take everything INSIDE library (models/group/version/...)
            relevant_parts = path_parts[lib_index + 1:]
            # Join with dots and remove .k extension from last segment if it exists
            # This converts /home/.../models/group/version/file.k to models.group.version.file
            clean_parts = [p.replace(".k", "") if p.endswith(".k") else p for p in relevant_parts]
            import_path = ".".join(clean_parts)
        else:
            # Fallback: if we don't detect the models structure, use the filename
            import_path = input_filepath.stem
    except Exception:
        # In case of any error with paths, safe fallback
        import_path = input_filepath.stem
    
    schema_alias = main_schema_name.lower() + "_schema"
    
    # Find spec schema
    spec_match = re.search(r"^\s*spec\s*:\s*(\w+)", main_schema_text, re.MULTILINE | re.IGNORECASE)
    if not spec_match:
        return f"# ERROR: Could not find 'spec' in '{main_schema_name}'.", "", ""
    
    spec_schema_name = spec_match.group(1)
    spec_schema_text = schemas.get(spec_schema_name, "")
    
    # Look for forProvider
    for_provider_match = re.search(r"^\s*forProvider\s*:\s*(\w+)", spec_schema_text, re.MULTILINE | re.IGNORECASE)
    
    # Basic blueprint parameters
    blueprint_params = {
        "_metadataName": "str",
        "_namespace?": "str", 
        "_labels?": "{str:str}", 
        "_annotations?": "{str:str}", 
        "_finalizers?": "[str]"
    }
    
    if "providerConfigRef" in spec_schema_text:
        blueprint_params["_providerConfig"] = "str"
    
    # Extract spec fields (excluding forProvider)
    spec_param_mappings = {}
    code_only_body = re.sub(r'"""[\s\S]*?"""', '', spec_schema_text)
    lines = code_only_body.split('\n')
    
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        match = re.match(r'^([a-zA-Z0-9_]+)(\??)\s+:\s*(.+)', line)
        if match:
            name, optional_marker, type_part = match.groups()
            if name in ["forProvider", "providerConfigRef"]: 
                i += 1
                continue
                
            # Handle multi-line types
            if '[' in type_part and ']' not in type_part:
                j = i + 1
                while j < len(lines) and ']' not in type_part:
                    next_line = lines[j].strip()
                    if next_line:
                        type_part += ' ' + next_line
                    j += 1
                i = j
            else:
                i += 1
                
            param_name = f"_{name}"
            spec_param_mappings[name] = param_name
            is_required = not bool(optional_marker)
            type_clean = type_part.strip().rstrip(',')
            
            # Map basic types correctly
            if type_clean in ["str", "int", "bool", "any", "float"]:
                display_type = type_clean
            elif "|" in type_clean or type_clean.startswith('"'):
                display_type = type_clean
            elif type_clean.startswith("[") and type_clean.endswith("]"):
                inner_type = type_clean[1:-1]
                if inner_type in ["str", "int", "bool", "any", "float"]:
                    display_type = type_clean
                else:
                    display_type = f"[{schema_alias}.{inner_type}]"
            elif type_clean.startswith("{") and type_clean.endswith("}"):
                # Handle typed dictionaries: {str:Type}
                dict_match = re.match(r'\{([^:]+):([^}]+)\}', type_clean)
                if dict_match:
                    key_type, val_type = dict_match.groups()
                    val_type = val_type.strip()
                    if val_type in ["str", "int", "bool", "any", "float"]:
                        display_type = type_clean
                    else:
                        display_type = f"{{{key_type}:{schema_alias}.{val_type}}}"
                else:
                    display_type = type_clean
            else:
                display_type = f"{schema_alias}.{type_clean}"
                
            blueprint_params[f"{param_name}{'' if is_required else '?'} "] = display_type
        else:
            i += 1
    
    # Extract forProvider fields
    for_provider_param_mappings = {}
    if for_provider_match:
        for_provider_schema_name = for_provider_match.group(1)
        for_provider_schema_text = schemas.get(for_provider_schema_name, "")
        
        if for_provider_schema_text:
            code_only_body = re.sub(r'"""[\s\S]*?"""', '', for_provider_schema_text)
            for_provider_fields = re.findall(r"^\s*([a-zA-Z0-9_]+)(\??)\s+:\s*(.+)", code_only_body, re.MULTILINE)
            
            for name, optional_marker, type_str in for_provider_fields:
                param_name = f"_{name}"
                for_provider_param_mappings[name] = param_name
                is_required = not bool(optional_marker)
                type_clean = type_str.strip().split(" ")[0].rstrip(",")
                
                if (type_clean.split('.')[-1] in schemas or 
                    (type_clean.startswith('[') and type_clean.strip('[]').split('.')[-1] in schemas)):
                    if type_clean.startswith('[') and type_clean.endswith(']'):
                        inner_type = type_clean[1:-1]
                        display_type = f"[{schema_alias}.{inner_type}]"
                    else:
                        display_type = f"{schema_alias}.{type_clean}"
                elif type_clean in ["str", "int", "bool", "any", "float"] or "|" in type_clean or type_clean.startswith('"'):
                    display_type = type_clean
                elif type_clean.startswith("[") and type_clean.endswith("]"):
                    inner_type = type_clean[1:-1]
                    if inner_type in ["str", "int", "bool", "any", "float"] or "|" in inner_type or '"' in type_clean:
                        display_type = type_clean
                    else:
                        display_type = "any"
                elif type_clean.startswith("{") and type_clean.endswith("}"):
                    display_type = type_clean
                else:
                    display_type = "any"
                
                blueprint_params[f"{param_name}{'' if is_required else '?'} "] = display_type
    
    params_definitions = "\n".join([f"    {name}: {stype}" for name, stype in blueprint_params.items()])
    
    spec_mappings_str = "\n".join([f"        {field} = {param}" for field, param in spec_param_mappings.items()])
    for_provider_mappings_str = "\n".join([f"            {field} = {param}" for field, param in for_provider_param_mappings.items()])
    
    spec_block_parts = []
    if spec_mappings_str: 
        spec_block_parts.append(spec_mappings_str)
    if for_provider_mappings_str:
        spec_block_parts.append(f"        forProvider = {{\n{for_provider_mappings_str}\n        }}")
    if "_providerConfig" in blueprint_params:
        spec_block_parts.append("        providerConfigRef.name = _providerConfig")
    
    spec_block = f"\n    spec = {{\n" + "\n".join(spec_block_parts) + "\n    }" if spec_block_parts else ""
    
    blueprint_code = f'''# --- High-Level Blueprint (Auto-Generated) ---

import {import_path} as {schema_alias}

schema {blueprint_name}({schema_alias}.{main_schema_name}):
    """This Blueprint simplifies the creation of a {main_schema_name} resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
{params_definitions}

    # Mapping logic from simple parameters to complex structure
    metadata = {{
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }}{spec_block}
'''
    return blueprint_code, blueprint_name, main_schema_name
