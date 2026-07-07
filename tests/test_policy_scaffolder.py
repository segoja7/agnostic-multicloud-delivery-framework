"""Unit tests for PolicyScaffolder and main.k template generation.

Regression context: KCL's `in` operator returns True for keys whose value is
Undefined, and blueprints assign every spec key unconditionally. Checks like
`"field" in spec` could therefore never fail. Scaffolded checks must use
`!= Undefined` (required) or an `== Undefined or` guard (constraints).
"""

from amdf.core.logic.policy_scaffolder import PolicyScaffolder, generate_main_k_template

SCHEMA = {
    "type": "object",
    "properties": {
        "spec": {
            "type": "object",
            "required": ["size"],
            "properties": {
                "size": {"type": "string", "description": "Widget size."},
                "mode": {"type": "string", "enum": ["auto", "manual"], "description": "Mode."},
                "replicas": {"type": "integer", "description": "Replica count."},
                "tags": {"type": "array", "items": {"type": "string"}, "description": "Tags."},
                "image": {"type": "string", "description": "Container image."},
            },
        }
    },
}


def scaffold():
    return PolicyScaffolder().generate("Widget", SCHEMA)


def test_no_broken_in_spec_membership_checks():
    # The old pattern `"field" in spec` is always true for blueprint-built specs.
    assert '" in spec' not in scaffold()


def test_required_string_check_uses_undefined():
    assert '# spec.size != Undefined, "size is required"' in scaffold()


def test_constraint_checks_are_guarded_for_unset_fields():
    policy = scaffold()
    assert '# spec.replicas == Undefined or spec.replicas >= 1' in policy
    assert "# spec.mode == Undefined or spec.mode in ['auto', 'manual']" in policy
    assert '# spec.image == Undefined or not spec.image.endswith(":latest")' in policy


def test_array_checks_tolerate_undefined():
    # len(Undefined) is an evaluation error; the emitted check must not crash.
    policy = scaffold()
    assert '# len(spec.tags or []) > 0' in policy
    assert '# len(spec.tags) > 0' not in policy


def test_main_k_without_required_fields_has_active_instance():
    content = generate_main_k_template("Widget", has_policies=True, required_fields=[])
    assert "myWidget = ValidatedWidget {" in content
    assert "items = [myWidget]" in content
    assert "# myWidget = ValidatedWidget" not in content


def test_main_k_with_required_fields_is_fully_commented():
    # A resource with required fields cannot have a valid default instance;
    # the example must be commented out so generated main.k always compiles.
    content = generate_main_k_template("Deployment", has_policies=True,
                                       required_fields=["selector", "template"])
    assert "# myDeployment = ValidatedDeployment {" in content
    assert "#     _selector = None  # TODO: required field, set a value" in content
    assert "#     _template = None  # TODO: required field, set a value" in content
    assert "# items = [myDeployment]" in content
    # No active (uncommented) instance or items assignment
    active = [l for l in content.splitlines() if not l.lstrip().startswith("#")]
    assert not any("myDeployment =" in l or "items =" in l for l in active)
