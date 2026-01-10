# Installation

## Prerequisites

### Required Dependencies

- **Python 3.10+** 
- **kubectl** configured and accessible
- **Kubernetes cluster** with CRDs installed
- **KCL** (optional, for schema validation)

### Kubernetes Setup

Ensure access to a Kubernetes cluster with CRDs from any operator:

- **Cloud Providers**: Crossplane (AWS/GCP/Azure), Config Connector (GCP), Azure Service Operator
- **Databases**: PostgreSQL Operator, MongoDB Operator, Redis Operator, CockroachDB Operator
- **Networking**: Istio, Cilium, Calico, Linkerd CRDs
- **Monitoring**: Prometheus Operator, Grafana Operator, Jaeger Operator
- **CI/CD**: ArgoCD, Tekton, Flux, Jenkins X CRDs
- **Storage**: Rook, OpenEBS, Longhorn, Portworx CRDs
- **Custom operators** with any CRDs

## Installation Methods

### Method 1: Development Install (Recommended)

```bash
# Clone repository
git clone https://github.com/segoja7/agnostic-multicloud-delivery-framework.git
cd agnostic-multicloud-delivery-framework

# Install in development mode
pip install -e .
```

### Method 2: Direct Install (Future)

```bash
# When published to PyPI
pip install amdf
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

Add to your `~/.kiro/settings/mcp.json`:

```json
{
  "mcpServers": {
    "amdf": {
      "command": "/path/to/amdf-mcp",
      "args": [],
      "disabled": false,
      "autoApprove": [
        "list_k8s_crds",
        "process_crd_to_kcl"
      ]
    }
  }
}
```

Find your path:
```bash
which amdf-mcp
```

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
    kubectl get crds --dry-run=server
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
