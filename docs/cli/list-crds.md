# amdf list-crds

List available Custom Resource Definitions in the cluster.

```bash
amdf list-crds [OPTIONS]
```

**Options:**

| Option | Short | Type | Description |
|--------|-------|------|-------------|
| `--filter` | `-f` | TEXT | Filter CRDs by text |
| `--context` | `-c` | TEXT | Kubernetes context |

**Examples:**

```bash
# List all CRDs
amdf list-crds

# Filter by AWS resources
amdf list-crds --filter aws

# Use specific context
amdf list-crds --context my-cluster
```