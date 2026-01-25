# Installation

## Prerequisites

### Required Dependencies

- **Python 3.10+**
- **kubectl** configured and accessible
- **Kubernetes cluster** with CRDs installed
- **KCL** (optional, for schema validation)

### Kubernetes Setup

AMDF works with any Kubernetes cluster running operators that provide Custom Resource Definitions (CRDs).

**Compatible with:**

- **Cloud Providers**: ACK (AWS), Config Connector (GCP), Azure Service Operator
- **Abstraction Layers**: Crossplane, KRO, KubeVela
- **Databases**: PostgreSQL, MongoDB, Redis, CockroachDB operators
- **Networking**: Istio, Cilium, Calico, Linkerd
- **Observability**: Prometheus, Grafana, Jaeger operators
- **CI/CD**: ArgoCD, Tekton, Flux
- **Storage**: Rook, OpenEBS, Longhorn
- **Any operator**: AMDF is operator-agnostic and works with any CRD-compliant operator

## Installation Methods

### Method 1: PyPI Install (Recommended)

```bash
# Install from PyPI
pip install amdf

# Verify installation
amdf --version
```

## Verify Installation

### CLI Interface

```bash
# Check version
amdf version

# List available commands
amdf --help

# Test cluster access
amdf list-crds
```

### MCP Interface

Add to your MCP client configuration:

```json
{
  "mcpServers": {
    "amdf": {
      "command": "amdf-mcp"
    }
  }
}
```

For specific MCP clients, refer to their documentation for configuration file locations.

## Environment Configuration

### Kubernetes Access

AMDF uses your current kubectl configuration automatically:

```bash
# Verify cluster access
kubectl config current-context

# List available CRDs
kubectl get crds

# Test cluster connectivity
kubectl cluster-info
```

### Optional: Switch Context

```bash
# List available contexts
kubectl config get-contexts

# Switch context
kubectl config use-context <context-name>

# Verify the switch
kubectl config current-context
```

## Troubleshooting

!!! tip "No CRDs Found"
    Make sure your cluster has operators installed:
    ```bash
    # Check for any CRDs
    kubectl get crds

    # Check common operators
    kubectl get pods -A | grep -E "(operator|controller)"

    # Examples of operator namespaces to check:
    kubectl get pods -n crossplane-system     # Crossplane
    kubectl get pods -n istio-system          # Istio
    kubectl get pods -n prometheus-operator   # Prometheus
    kubectl get pods -n argocd                # ArgoCD
    ```

!!! warning "Permission Issues"
    Verify you have permission to access CRDs:
    ```bash
    kubectl auth can-i list crds
    ```

!!! danger "Command Not Found"
    If `amdf` command is not found:
    ```bash
    # Check if installed
    pip list | grep amdf

    # Reinstall if needed
    pip install -e . --force-reinstall
    ```

## Next Steps

- [Quick Start](quick-start.md) - Generate your first schema
