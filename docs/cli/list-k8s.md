# amdf list-k8s

List available native Kubernetes resources.

```bash
amdf list-k8s [OPTIONS]
```

**Options:**

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--filter` | `-f` | TEXT | None | Filter by kind or group |
| `--version` | `-v` | TEXT | `1.35.0` | Kubernetes version |

**Examples:**

```bash
# List all native K8s resources
amdf list-k8s

# Filter by resource type
amdf list-k8s --filter pod
amdf list-k8s --filter deployment
amdf list-k8s --filter storage

# Specify Kubernetes version
amdf list-k8s --version 1.30.0

# Combine filter and version
amdf list-k8s --version 1.30.0 --filter networking
```

**Output:**
```
        Available Kubernetes Resources (v1.35.0)
┏━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━┓
┃ Kind                 ┃ API Group/Version ┃
┡━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━┩
│ Pod                  │ v1                │
│ Service              │ v1                │
│ Deployment           │ apps/v1           │
│ NetworkPolicy        │ networking/v1     │
└──────────────────────┴───────────────────┘

Found 79 Kubernetes resources
```