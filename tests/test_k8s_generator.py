"""Unit tests for the native Kubernetes generator's $ref resolution and typing.

Regression context: nested $refs (selector, template, containers) used to type
as `any` because _resolve_schema only inlined one level and _get_kcl_type had
no $ref branch. Recursive definitions must also terminate via a cycle guard.
All fixtures are inline OpenAPI stubs — no network, no cluster.
"""

from amdf.core.logic.k8s_generator import K8SNativeGenerator


def make_generator(definitions):
    gen = K8SNativeGenerator(kind="Widget", k8s_version="0.0.0")
    # Inject the spec so _load_openapi_spec() short-circuits (no download).
    gen.openapi_spec = {"definitions": definitions}
    return gen


def test_nested_ref_is_inlined_not_any():
    defs = {
        "io.k8s.example.Widget": {
            "type": "object",
            "properties": {
                "spec": {"$ref": "#/definitions/io.k8s.example.WidgetSpec"},
            },
        },
        "io.k8s.example.WidgetSpec": {
            "type": "object",
            "properties": {
                "selector": {"$ref": "#/definitions/io.k8s.example.Selector"},
            },
        },
        "io.k8s.example.Selector": {
            "type": "object",
            "properties": {"matchName": {"type": "string"}},
        },
    }
    gen = make_generator(defs)
    resolved = gen._resolve_schema(defs["io.k8s.example.Widget"])
    selector = resolved["properties"]["spec"]["properties"]["selector"]
    # Fully inlined: the deep object survived, not left as a bare $ref.
    assert "$ref" not in selector
    assert selector["properties"]["matchName"]["type"] == "string"
    # And it types as a nested schema, never `any`.
    kcl_type = gen._get_kcl_type("selector", selector, "WidgetSpec")
    assert kcl_type != "any"


def test_recursive_definition_terminates_via_cycle_guard():
    # A self-referential definition (like JSONSchemaProps) must not loop forever.
    defs = {
        "io.k8s.example.Node": {
            "type": "object",
            "properties": {
                "value": {"type": "string"},
                "child": {"$ref": "#/definitions/io.k8s.example.Node"},
            },
        },
    }
    gen = make_generator(defs)
    # The root is passed already-dereferenced, so Node enters the seen-path only
    # when the first $ref is followed; the cycle is cut one level deeper.
    resolved = gen._resolve_schema(defs["io.k8s.example.Node"])
    cut = resolved["properties"]["child"]["properties"]["child"]
    # Cycle collapses to an open object with no properties -> types as `any`.
    assert "properties" not in cut
    assert gen._get_kcl_type("child", cut, "Node") == "any"


def test_int_or_string_format_types_as_union():
    gen = make_generator({})
    prop = {"type": "string", "format": "int-or-string"}
    assert gen._get_kcl_type("targetPort", prop, "ServicePort") == "int | str"


def test_use_site_description_wins_over_type_description():
    defs = {
        "io.k8s.example.Root": {
            "type": "object",
            "properties": {
                "sel": {
                    "$ref": "#/definitions/io.k8s.example.Selector",
                    "description": "use-site description",
                },
            },
        },
        "io.k8s.example.Selector": {
            "type": "object",
            "description": "type description",
            "properties": {"a": {"type": "string"}},
        },
    }
    gen = make_generator(defs)
    resolved = gen._resolve_schema(defs["io.k8s.example.Root"])
    assert resolved["properties"]["sel"]["description"] == "use-site description"
