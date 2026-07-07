"""Unit tests for KCL schema generator helpers."""

from amdf.core.logic.generator import to_pascal_case


def test_to_pascal_case_preserves_existing_pascal_case():
    # Regression: "ExternalSecret".title() used to produce "Externalsecret",
    # breaking blueprint/schema name matching for PascalCase CRD kinds.
    assert to_pascal_case("ExternalSecret") == "ExternalSecret"
    assert to_pascal_case("ACRAccessToken") == "ACRAccessToken"


def test_to_pascal_case_converts_snake_case():
    assert to_pascal_case("acr_access_token") == "AcrAccessToken"
    assert to_pascal_case("widget_spec_item") == "WidgetSpecItem"
