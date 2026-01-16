# CLI Reference

Complete reference for the AMDF command-line interface.

## Installation

```bash
pip install -e .
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
AMDF version: 0.1.0
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

### `amdf generate`

Generate KCL schema and blueprint from a Custom Resource Definition.

```bash
amdf generate CRD_NAME [OPTIONS]
```

**Options:**

| Option | Short | Type | Description |
|--------|-------|------|-------------|
| `--output` | `-o` | TEXT | Output directory (default: .) |
| `--context` | `-c` | TEXT | Kubernetes context |
| `--blueprint/--no-blueprint` | | BOOL | Generate blueprint (default: True) |

**Examples:**

```bash
# Generate from CRD
amdf generate instances.ec2.aws.upbound.io

# Generate without blueprint
amdf generate instances.ec2.aws.upbound.io --no-blueprint

# Custom output directory
amdf generate instances.ec2.aws.upbound.io --output ./schemas
```

### `amdf generate-k8s`

Generate KCL schema and blueprint from native Kubernetes objects.

```bash
amdf generate-k8s KIND [OPTIONS]
```

**Options:**

| Option | Short | Type | Description |
|--------|-------|------|-------------|
| `--version` | `-v` | TEXT | Kubernetes version (default: 1.35.0) |
| `--output` | `-o` | TEXT | Output directory (default: .) |
| `--blueprint/--no-blueprint` | | BOOL | Generate blueprint (default: True) |

**Examples:**

```bash
# Generate Pod schema (latest K8s version)
amdf generate-k8s Pod

# Generate Service schema for specific K8s version
amdf generate-k8s Service --version 1.30.0

# Generate without blueprint
amdf generate-k8s Deployment --no-blueprint

# Custom output directory
amdf generate-k8s ConfigMap --output ./k8s-schemas
```

**Supported Kubernetes Objects:**
- Core: Pod, Service, ConfigMap, Secret, ServiceAccount
- Apps: Deployment, ReplicaSet, DaemonSet, StatefulSet
- Networking: Ingress, NetworkPolicy
- Storage: PersistentVolume, PersistentVolumeClaim
- And many more...

**Output:**
```
                          Available CRDs
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CRD Name                                                       ┃
┡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ instances.ec2.aws.upbound.io                                   │
│ vpcs.ec2.aws.upbound.io                                        │
│ virtualservices.networking.istio.io                            │
└────────────────────────────────────────────────────────────────┘

Found 3 CRDs
```

### `amdf generate`

Generate KCL schema and blueprint from a CRD.

```bash
amdf generate [OPTIONS] CRD_NAME
```

**Arguments:**

| Argument | Type | Required | Description |
|----------|------|----------|-------------|
| `CRD_NAME` | TEXT | Yes | Name of the CRD to generate schema for |

**Options:**

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--output` | `-o` | PATH | `.` | Output directory |
| `--context` | `-c` | TEXT | None | Kubernetes context |
| `--blueprint/--no-blueprint` | | BOOL | `True` | Generate blueprint |

**Examples:**

```bash
# Basic generation
amdf generate instances.ec2.aws.upbound.io

# Custom output directory
amdf generate instances.ec2.aws.upbound.io --output ./my-schemas

# Skip blueprint generation
amdf generate instances.ec2.aws.upbound.io --no-blueprint

# Use specific context
amdf generate instances.ec2.aws.upbound.io --context staging-cluster
```

**Output:**
```
Generating schema for CRD: instances.ec2.aws.upbound.io
✅ Schema generated: library/models/ec2_aws_upbound_io/v1beta1/ec2_aws_upbound_io_v1beta1_Instance.k
Generating blueprint...
✅ Blueprint generated: library/blueprints/Instance.k

🎉 Generation completed successfully!
```

**Generated Files:**

1. **Detailed Schema**: `library/models/{group}_{version}/{group}_{version}_{Kind}.k`
   - Complete KCL schema with all fields
   - Type-safe definitions
   - Full documentation

2. **Simple Blueprint**: `library/blueprints/{Kind}.k`
   - User-friendly interface
   - Common parameters exposed
   - Simplified usage

### `amdf mcp-server`

Start the MCP server for integration with MCP clients.

```bash
amdf mcp-server
```

**Usage:**
This command starts the MCP server that can be used with MCP clients like Kiro CLI.

**Configuration:**
Configure the MCP server in your MCP client configuration:
```json
{
  "mcpServers": {
    "amdf": {
      "command": "amdf-mcp",
      "autoApprove": ["list_k8s_crds", "process_crd_to_kcl"]
    }
  }
}
```

### `amdf guided`

Guided schema generation with step-by-step workflow.

```bash
amdf guided [OPTIONS]
```

**Options:**

| Option | Type | Description |
|--------|------|-------------|
| `--ai-model` | TEXT | Enable AI explanations with specified Ollama model |

#### Basic Guided Mode

Interactive wizard that guides you through schema generation:

```bash
amdf guided
```

**Workflow:**

1. **Filter CRDs** - Search by keyword or browse all
2. **Select CRD** - Choose from numbered list
3. **Generate Schema** - Automatic schema and blueprint creation
4. **Summary** - Review generated files

#### AI-Enhanced Mode

Add AI explanations and usage examples:

```bash
amdf guided --ai-model qwen3-coder:30b
```

**Prerequisites:**

- [Ollama](https://ollama.ai) installed and running
- Model downloaded: `ollama pull qwen3-coder:30b`

**Additional Step:**

**AI Explanation** - Detailed explanation of generated files with usage examples

**Example Session:**

```bash
$ amdf guided --ai-model qwen3-coder:30b
🤖 Starting AMDF Guided Mode with qwen3-coder:30b

Step 1: Filter CRDs
Filter CRDs (or Enter for all): ec2

Step 2: Select CRD (45 found)
┌────┬─────────────────────────────────────┐
│ #  │ CRD Name                            │
├────┼─────────────────────────────────────┤
│ 1  │ instances.ec2.aws.upbound.io        │
│ 2  │ vpcs.ec2.aws.upbound.io             │
└────┴─────────────────────────────────────┘
Select number (1-2) or full name: 1

Step 3: Generate Schema
⚙️ Generating for: instances.ec2.aws.upbound.io...
✅ Schema: library/models/.../Instance.k
✅ Blueprint: library/blueprints/Instance.k

Step 4: AI Explanation
🤖 Getting explanation from qwen3-coder:30b...
[AI provides detailed explanation and usage examples]

🎉 Complete!
```

## Workflows

### Basic Workflow

```bash
# 1. Discover CRDs
amdf list-crds --filter argo
# 2. Generate schema
amdf generate applicationsets.argoproj.io

# 3. Use in KCL
cat > appset.k << EOF
import blueprints.Applicationset as appset

app = appset.ApplicationsetBlueprint {
    _metadataName = "myappset"
    _namespace = "argocd"
    _goTemplate = True
    _goTemplateOptions = [
        "missingkey=error"
    ]
    #omitted for brevity
}
EOF

# 4. Render and apply
kcl run appset.k | kubectl apply -f -
```

### Guided Workflow

```bash
# Interactive guided generation
amdf guided

# With AI explanations
amdf guided --ai-model qwen3-coder:30b

# Follow the prompts:
# 1. Filter: "argo"
# 2. Select: Choose from numbered list
# 3. Generated files ready to use
```

### Multi-Service Setup

```bash
# Generate multiple related schemas
amdf generate vpcs.ec2.aws.upbound.io
amdf generate subnets.ec2.aws.upbound.io
amdf generate instances.ec2.aws.upbound.io

# Create infrastructure stack
cat > infrastructure.k << EOF
import library.blueprints.Vpc
import library.blueprints.Subnet
import library.blueprints.Instance

vpc = Vpc.VpcBlueprint {
    _metadataName = "main-vpc"
    _cidrBlock = "10.0.0.0/16"
}

subnet = Subnet.SubnetBlueprint {
    _metadataName = "public-subnet"
    _cidrBlock = "10.0.1.0/24"
}

instance = Instance.InstanceBlueprint {
    _metadataName = "web-server"
    _instanceType = "t3.medium"
}
EOF
```


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
