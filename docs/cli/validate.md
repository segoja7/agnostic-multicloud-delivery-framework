# amdf validate

!!! warning "Preview Feature"
    The `amdf validate` command is in preview and experimental. Use at your own discretion. This feature may change or be removed in future versions.

Validate Kubernetes manifests against Kyverno policies before deployment.

## Synopsis

```bash
amdf validate MANIFEST_PATH [OPTIONS]
```

## Description

The `validate` command provides optional pre-deployment validation using Kyverno CLI. By default, it validates against policies deployed in your Kubernetes cluster. You can also validate against specific local policy files or directories.

## Prerequisites

Install Kyverno CLI:

```bash
# macOS
brew install kyverno

# Linux
curl -L https://github.com/kyverno/kyverno/releases/latest/download/kyverno-cli_linux_x86_64.tar.gz | tar -xz
sudo mv kyverno /usr/local/bin/

# Windows
# Download from: https://github.com/kyverno/kyverno/releases/latest
```

## Options

| Option | Short | Description |
|--------|-------|-------------|
| `--policy` | `-p` | Path to specific policy file/directory. If not provided, validates against cluster policies |

## Examples

### Validate Against Cluster Policies

```bash
# Validate against policies deployed in your cluster
amdf validate deployment.yaml
```

### Validate Against Local Policies

```bash
# Validate against single policy file
amdf validate manifest.yaml --policy policy.yaml

# Validate against policy directory
amdf validate manifest.yaml --policy ./policies/
```

### Validate Against Remote Policies

```bash
# Validate against Git repository
amdf validate manifest.yaml --policy https://github.com/kyverno/policies/pod-security/baseline/
```

## Workflow Integration

The `validate` command fits into the AMDF workflow as an optional pre-deployment check:

```bash
# 1. Generate KCL schemas
amdf generate deployments.apps

# 2. Create your configuration
kcl library/main.k -S items > deployment.yaml

# 3. Optional: Validate before deployment
amdf validate deployment.yaml

# 4. Deploy to cluster
kubectl apply -f deployment.yaml
```

## Policy Strategy

For organizations with existing Kyverno policies:

- **Keep Kyverno policies** as the source of truth for organizational rules
- **Use KCL policies** for team-specific validation and fast feedback
- **Use `amdf validate`** as a bridge to catch organizational policy violations early

This approach avoids duplicating policies while providing fast local validation.

## Resources

- [Kyverno Policies Repository](https://github.com/kyverno/policies)
- [Kyverno CLI Documentation](https://kyverno.io/docs/kyverno-cli/)
- [Policy Templates Guide](../user-guide/policy-templates.md)
