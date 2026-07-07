"""End-to-end regression tests: CRD fixture -> schema -> blueprint -> policy -> kcl run.

Requires the `kcl` binary; skipped when unavailable. No cluster needed
(the kubectl fetch is stubbed with a fixture CRD).
"""

import shutil
import subprocess
from pathlib import Path

import pytest

from amdf.core.logic.generator import KCLSchemaGenerator
from amdf.core.logic.blueprint import generate_blueprint_from_schema

pytestmark = pytest.mark.skipif(shutil.which("kcl") is None, reason="kcl binary not installed")

# CRD with a hyphenated group (regression: hyphens must not leak into KCL
# module paths), one required spec field and optional fields for policy tests.
CRD_FIXTURE = {
    "spec": {
        "group": "test-group.example.io",
        "names": {"kind": "Widget"},
        "versions": [
            {
                "name": "v1",
                "served": True,
                "schema": {
                    "openAPIV3Schema": {
                        "type": "object",
                        "properties": {
                            "spec": {
                                "type": "object",
                                "required": ["size"],
                                "properties": {
                                    "size": {"type": "string", "description": "Widget size."},
                                    "mode": {"type": "string", "description": "Operating mode."},
                                    "replicas": {"type": "integer", "description": "Replicas."},
                                },
                            }
                        },
                    }
                },
            }
        ],
    }
}


def kcl_run(library_dir: Path):
    return subprocess.run(["kcl", "run", "."], cwd=library_dir, capture_output=True, text=True)


@pytest.fixture
def library(tmp_path, monkeypatch):
    """Generate schema + blueprint + policy + main.k from the fixture CRD."""
    def fake_get_crd_json(self):
        self.crd_json = CRD_FIXTURE

    monkeypatch.setattr(KCLSchemaGenerator, "_get_crd_json", fake_get_crd_json)

    generator = KCLSchemaGenerator(crd_name="widgets.test-group.example.io")
    schema_path, schema_content = generator.generate(base_dir=str(tmp_path))

    blueprint_code, bp_name, main_schema_name = generate_blueprint_from_schema(
        schema_content, Path(schema_path)
    )
    assert bp_name == "WidgetBlueprint"
    blueprint_dir = tmp_path / "library" / "blueprints"
    blueprint_dir.mkdir(parents=True, exist_ok=True)
    (blueprint_dir / f"{main_schema_name}.k").write_text(blueprint_code, encoding="utf-8")

    return tmp_path / "library"


def test_hyphenated_group_produces_valid_module_path(library):
    # Hyphens are invalid in KCL import paths; they must be sanitized.
    schema_file = library / "models" / "test_group_example_io" / "v1" / "test_group_example_io_v1_Widget.k"
    assert schema_file.exists()


def test_generated_main_k_compiles_out_of_the_box(library):
    # Regression: resources with required spec fields used to produce a
    # main.k instance that failed compilation with "attribute is required".
    result = kcl_run(library)
    assert result.returncode == 0, result.stderr


def test_enabled_required_policy_check_actually_fails_when_field_unset(library):
    # THE regression test for the policy bug: `"mode" in spec` was always
    # true (Undefined value still registers the key), so enabled required
    # checks could never fail. The fixed pattern must fail when unset.
    policy_file = library / "policies" / "WidgetPolicy.k"
    policy = policy_file.read_text(encoding="utf-8")
    enabled = policy.replace(
        '# spec.mode != Undefined, "mode is required"',
        'spec.mode != Undefined, "mode is required"',
    )
    assert enabled != policy, "expected required-check suggestion not found in policy"
    policy_file.write_text(enabled, encoding="utf-8")

    main_k = library / "main.k"

    main_k.write_text(
        """
import blueprints.Widget
import policies.WidgetPolicy

schema ValidatedWidget(Widget.WidgetBlueprint):
    mixin [WidgetPolicy.WidgetPolicyMixin]

w = ValidatedWidget {
    _metadataName = "w1"
    _size = "big"
}
""",
        encoding="utf-8",
    )
    result = kcl_run(library)
    assert result.returncode != 0, "policy check passed but 'mode' is unset — bug regressed"
    assert "mode is required" in (result.stderr + result.stdout)

    main_k.write_text(
        """
import blueprints.Widget
import policies.WidgetPolicy

schema ValidatedWidget(Widget.WidgetBlueprint):
    mixin [WidgetPolicy.WidgetPolicyMixin]

w = ValidatedWidget {
    _metadataName = "w1"
    _size = "big"
    _mode = "auto"
}
""",
        encoding="utf-8",
    )
    result = kcl_run(library)
    assert result.returncode == 0, result.stderr
    assert "mode: auto" in result.stdout
