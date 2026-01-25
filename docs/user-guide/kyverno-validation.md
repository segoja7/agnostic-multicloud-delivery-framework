# Kyverno Validation

!!! warning "Preview Feature"
    The `amdf validate` command is in preview and experimental. Use at your own discretion. This feature may change or be removed in future versions.

The `amdf validate` command provides optional pre-deployment validation using Kyverno CLI.

## Prerequisites

```bash
# Install Kyverno CLI
brew install kyverno  # macOS
```

## Usage

```bash
# Validate against local policy file
amdf validate manifest.yaml --policy policy.yaml

# Validate against policy directory
amdf validate manifest.yaml --policy ./policies/

# Validate against Git repository
amdf validate manifest.yaml --policy https://github.com/kyverno/policies/pod-security/baseline/

# Validate against cluster policies (requires Kyverno in cluster)
amdf validate manifest.yaml
```

## Resources

- [Kyverno Policies](https://github.com/kyverno/policies)
- [Kyverno CLI](https://kyverno.io/docs/kyverno-cli/)
- [Policy Templates](policy-templates.md)
- [Examples](../examples/basic.md)
