# CLI Reference

Reference for the AMDF command-line interface.

## Installation

```bash
pip install amdf
```

## Global Options

| Option | Description |
|--------|-------------|
| `--help` | Show help message |
| `--version` | Show version information |

## Commands

### `amdf version`

Show AMDF version information.

```bash
amdf version
```

**Output:**
```
AMDF version: x.y.z
```

### `amdf list-crds`

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

### `amdf list-k8s`

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

### `amdf generate`

Generate KCL schema and blueprint from a Custom Resource Definition.

```bash
amdf generate CRD_NAME [OPTIONS]
```

**Options:**

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--output` | `-o` | TEXT | `.` | Output directory |
| `--context` | `-c` | TEXT | None | Kubernetes context |
| `--blueprint/--no-blueprint` | | BOOL | `True` | Generate blueprint |
| `--policy-template/--no-policy-template` | | BOOL | `True` | Generate policy template |

**Examples:**

```bash
# Generate from CRD (includes schema, blueprint, policy, and main.k)
amdf generate instances.ec2.aws.upbound.io

# Generate without blueprint
amdf generate instances.ec2.aws.upbound.io --no-blueprint

# Generate without policy template
amdf generate instances.ec2.aws.upbound.io --no-policy-template

# Custom output directory
amdf generate instances.ec2.aws.upbound.io --output ./schemas
```

**Output:**
```
Generating schema for CRD: instances.ec2.aws.upbound.io
✅ Schema generated: library/models/ec2_aws_upbound_io/v1beta1/...
✅ Blueprint generated: library/blueprints/Instance.k
✅ Policy template created: library/policies/InstancePolicy.k
✅ Example main.k generated: library/main.k

🎉 Generation completed successfully!
```

### `amdf generate-k8s`

Generate KCL schema and blueprint from native Kubernetes objects.

```bash
amdf generate-k8s KIND [OPTIONS]
```

!!! note "Kind Names"
    Kind names are case-sensitive and must match exactly (e.g., `Service` not `service`). Use `amdf list-k8s` to see available kinds.

**Options:**

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--version` | `-v` | TEXT | `1.35.0` | Kubernetes version |
| `--output` | `-o` | TEXT | `.` | Output directory |
| `--blueprint/--no-blueprint` | | BOOL | `True` | Generate blueprint |
| `--policy-template/--no-policy-template` | | BOOL | `True` | Generate policy template |

**Examples:**

```bash
# Generate Pod schema (latest K8s version)
amdf generate-k8s Pod

# Generate Service schema for specific K8s version
amdf generate-k8s Service --version 1.30.0

# Generate without blueprint
amdf generate-k8s Deployment --no-blueprint

# Generate without policy template
amdf generate-k8s Pod --no-policy-template

# Custom output directory
amdf generate-k8s ConfigMap --output ./k8s-schemas
```

**Supported Kubernetes Objects:**
- **Core**: Pod, Service, ConfigMap, Secret, ServiceAccount, PersistentVolume, PersistentVolumeClaim, Namespace, Node
- **Apps**: Deployment, ReplicaSet, DaemonSet, StatefulSet
- **Networking**: Ingress, NetworkPolicy, IngressClass
- **Storage**: StorageClass, VolumeAttachment, CSIDriver
- **RBAC**: Role, RoleBinding, ClusterRole, ClusterRoleBinding
- **Batch**: Job, CronJob
- **Autoscaling**: HorizontalPodAutoscaler
- **Policy**: PodDisruptionBudget
- And many more...

**Output:**
```
Generating schema for Kubernetes Pod (v1.35.0)
✅ Schema generated: library/models/k8s/v1/k8s_v1_Pod.k
✅ Blueprint generated: library/blueprints/Pod.k
✅ Policy template created: library/policies/PodPolicy.k
✅ Example main.k generated: library/main.k

🎉 Generation completed successfully!
```

### `amdf mcp-server`

Start the Model Context Protocol server.

```bash
amdf mcp-server
```

Exposes AMDF functionality through the MCP interface, enabling AI assistants and development tools to discover CRDs and generate schemas programmatically.

**MCP Client Configuration:**

```json
{
  "mcpServers": {
    "amdf": {
      "command": "amdf",
      "args": ["mcp-server"]
    }
  }
}
```

### `amdf guided`

Interactive schema generation with step-by-step workflow.

```bash
amdf guided [OPTIONS]
```

**Options:**

| Option | Type | Description |
|--------|------|-------------|
| `--ai-model` | TEXT | Enable AI explanations with specified Ollama model |

**Workflow:**

1. Choose resource type (CRD or Kubernetes native)
2. Filter and select resource
3. Generate schema, blueprint, and policies
4. (Optional) Get AI explanation of generated files

**Example:**

```bash
# Basic mode
amdf guided

# With AI explanations (requires Ollama)
amdf guided --ai-model qwen3-coder:30b
```

**Output:**
```
Step 1: Choose Resource Type
1. CRD (Custom Resource Definition)
2. Kubernetes Native (Pod, Service, Deployment, etc.)
Select type [1/2] (1): 2

Step 3: Select Resource
┏━━━━━━┳━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━┓
┃ #    ┃ Kind       ┃ API Group/Version ┃
┡━━━━━━╇━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━┩
│ 1    │ Pod        │ v1                │
│ 2    │ Service    │ v1                │
└──────┴────────────┴───────────────────┘
Select number (1-2): 1

⚙️ Generating for: Pod (v1.35.0)...
✅ Schema: library/models/k8s/v1/k8s_v1_Pod.k
✅ Blueprint: library/blueprints/Pod.k
✅ Policy template: library/policies/PodPolicy.k
✅ Example main.k: library/main.k

🎉 Complete!
```

### `amdf validate`

Validate Kubernetes manifests against Kyverno policies.

```bash
amdf validate MANIFEST [OPTIONS]
```

**Arguments:**

| Argument | Type | Required | Description |
|----------|------|----------|-------------|
| `MANIFEST` | PATH | Yes | Path to Kubernetes YAML manifest |

**Options:**

| Option | Short | Type | Description |
|--------|-------|------|-------------|
| `--policy` | `-p` | TEXT | Path to policy file/directory or URL (default: validates against cluster) |

**Examples:**

```bash
# Validate against cluster policies (default)
amdf validate deployment.yaml

# Validate against local policy file
amdf validate deployment.yaml --policy ./policies/require-labels.yaml

# Validate against policy directory
amdf validate deployment.yaml --policy ./policies/

# Validate against remote policy
amdf validate deployment.yaml --policy https://raw.githubusercontent.com/kyverno/policies/main/pod-security/baseline/disallow-privileged-containers/disallow-privileged-containers.yaml
```

**Output (Success):**
```
✅ Validation passed

Applying 1 policy rule(s) to 1 resource(s)...

pass: 1, fail: 0, warn: 0, error: 0, skip: 0
```

**Output (Failure):**
```
❌ Validation failed

Applying 1 policy rule(s) to 1 resource(s)...

fail: 1, pass: 0, warn: 0, error: 0, skip: 0

Policy require-labels -> Resource default/Deployment/nginx
  autogen-require-labels: validation error: Label 'app' is required. Rule autogen-require-labels failed
```

**Prerequisites:**

Kyverno CLI must be installed:

```bash
# macOS
brew install kyverno

# Linux
curl -LO https://github.com/kyverno/kyverno/releases/download/v1.11.0/kyverno-cli_v1.11.0_linux_x86_64.tar.gz
tar -xzf kyverno-cli_v1.11.0_linux_x86_64.tar.gz
sudo mv kyverno /usr/local/bin/
```

---

## Troubleshooting

### Common Issues

**Command not found:**
```bash
# Check installation
pip list | grep amdf

# Reinstall if needed
pip install -e . --force-reinstall
```

**No CRDs found:**
```bash
# Verify cluster access
kubectl get crds

# Check context
kubectl config current-context
```

**Permission denied:**
```bash
# Check CRD permissions
kubectl auth can-i get customresourcedefinitions
```


## See Also

- [MCP Integration](mcp.md) - Using AMDF with MCP
- [Examples](../examples/basic.md) - Practical examples
