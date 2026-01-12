# Quick Start

Start abstracting your infrastructure immediately using either the CLI or MCP interface.

## Choose Your Interface

=== "CLI Interface"
    Perfect for command-line workflows and automation.

    ```bash
    # Install AMDF
    pip install amdf

    # Verify installation
    amdf version
    ```

=== "MCP Interface"

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

## Step 1: Verify Prerequisites

Ensure you have access to a Kubernetes cluster with CRDs:

```bash
# Check cluster access
kubectl cluster-info

# List available CRDs
kubectl get crds | head -10
```

## Step 2: Discover CRDs

=== "CLI"
    ```bash
    # List all CRDs
    amdf list-crds

    # Filter by service
    amdf list-crds --filter ec2
    amdf list-crds --filter istio
    ```

=== "MCP"
    ```
    "List all CRDs in my cluster"
    "List CRDs containing 'ec2'"
    "Show me Istio-related CRDs"
    ```

Expected output:
```
instances.ec2.aws.upbound.io
vpcs.ec2.aws.upbound.io
virtualservices.networking.istio.io
```

## Step 3: Generate Your First Schema

=== "CLI"
    ```bash
    # Generate schema + blueprint
    amdf generate instances.ec2.aws.upbound.io

    # Generate without blueprint
    amdf generate instances.ec2.aws.upbound.io --no-blueprint

    # Custom output directory
    amdf generate instances.ec2.aws.upbound.io --output ./my-schemas
    ```

=== "MCP"
    ```
    "Generate schema for instances.ec2.aws.upbound.io"
    ```

This creates:

- **Detailed Schema**: `library/models/ec2_aws_upbound_io/v1beta1/ec2_aws_upbound_io_v1beta1_Instance.k`

- **Simple Blueprint**: `library/blueprints/Instance.k`

## Step 4: Use the Generated Blueprint

Create your first infrastructure configuration:

```kcl
import library.blueprints.Instance

# Production EC2
webServer = Instance.InstanceBlueprint {
    _metadataName = "my-web-server"
    _providerConfig = "default"
    _instanceType = "t3.medium"
    _region = "us-east-1"

    # Security best practices
    _metadataOptions = [{
        httpTokens = "required"  # IMDSv2
    }]
    _rootBlockDevice = [{
        encrypted = True
    }]

    _tags = {
        Name = "my-web-server"
        Environment = "production"
    }
}
```

## Step 5: Deploy and Distribute

Once you have your KCL configuration, you have multiple deployment and distribution options:

=== "Direct Deployment"
    ```bash
    # Render and apply to Kubernetes
    kcl run my-config.k | kubectl apply -f -

    # Or save first, then apply
    kcl run my-config.k > resources.yaml
    kubectl apply -f resources.yaml
    ```

=== "Version Control (GitOps)"
    ```bash
    # Commit to Git for GitOps workflows
    git add .
    git commit -m "Add infrastructure configuration"
    git push origin main

    # ArgoCD/Flux will automatically sync
    ```

=== "OCI Registry Distribution"
    ```bash
    # Package and share via OCI registry
    kcl mod init
    kcl mod push oci://registry.example.com/my-schemas:v1.0.0

    # Others can consume your package
    kcl mod add oci://registry.example.com/my-schemas:v1.0.0
    ```

### Distribution Patterns

AMDF generates KCL modules that can be distributed using standard KCL package management:

- **OCI Registries**: Platform teams generate and publish schemas to any OCI registries
- **GitOps**: Commit to repositories for automatic sync
- **Multi-Environment**: Use different versions for dev/staging/production

!!! info "KCL Package Management"
    For comprehensive documentation on KCL package management, distribution, and deployment patterns, see the official [KCL Package Management Guide](https://www.kcl-lang.io/docs/user_docs/guides/package-management/quick-start).

    Key topics include:

    - [OCI Registry Usage](https://www.kcl-lang.io/docs/user_docs/guides/package-management/how-to/kpm_oci)
    - [Git Repository Integration](https://www.kcl-lang.io/docs/user_docs/guides/package-management/how-to/kpm_git)
    - [Publishing to ArtifactHub](https://www.kcl-lang.io/docs/user_docs/guides/package-management/how-to/publish_pkg_to_ah)
    - [GitHub Actions Integration](https://www.kcl-lang.io/docs/user_docs/guides/package-management/how-to/push_github_action)
    - [Share docker.io](https://www.kcl-lang.io/docs/user_docs/guides/package-management/how-to/share_your_pkg_docker)
    - [Share ghcr.io](https://www.kcl-lang.io/docs/user_docs/guides/package-management/how-to/share_your_pkg)

## Common Workflows

### Multi-Service Infrastructure

=== "CLI"
    ```bash
    # Generate VPC components
    amdf generate vpcs.ec2.aws.upbound.io
    amdf generate subnets.ec2.aws.upbound.io
    amdf generate internetgateways.ec2.aws.upbound.io
    ```

=== "MCP"
    ```
    "Generate schemas for VPC, subnets, and internet gateway"
    "Create networking blueprints for AWS"
    ```

### Service Mesh Setup

=== "CLI"
    ```bash
    # Istio resources
    amdf list-crds --filter istio
    amdf generate virtualservices.networking.istio.io
    amdf generate gateways.networking.istio.io
    ```

=== "MCP"
    ```
    "List Istio CRDs"
    "Generate Istio VirtualService schema"
    ```

### Monitoring Stack

=== "CLI"
    ```bash
    # Prometheus Operator
    amdf list-crds --filter prometheus
    amdf generate prometheuses.monitoring.coreos.com
    amdf generate servicemonitors.monitoring.coreos.com
    ```

=== "MCP"
    ```
    "Show me Prometheus operator CRDs"
    "Generate monitoring schemas"
    ```

## Example Conversations (MCP)

### Scenario 1: New Infrastructure

```
User: "I need to create AWS infrastructure with Crossplane"
Assistant: [Lists AWS CRDs available]

User: "Generate schemas for EC2 and VPC"
Assistant: [Generates schemas and blueprints]

```

### Scenario 2: Service Mesh

```
User: "Show me Istio CRDs"
Assistant: [Lists Istio-related CRDs]

User: "Generate schema for VirtualService"
Assistant: [Generates Istio VirtualService schema]

```

## Next Steps

- [CLI Reference](../user-guide/cli.md) - Complete CLI documentation
- [MCP Integration](../user-guide/mcp.md) - Advanced MCP usage
- [Examples](../examples/basic.md) - More detailed examples

## Troubleshooting

!!! tip "No CRDs Found"
    Make sure your cluster has operators installed:
    ```bash
    # Check for any CRDs
    kubectl get crds

    # Check common operators
    kubectl get pods -A | grep -E "(operator|controller)"
    ```

!!! warning "Permission Issues"
    Verify you have permission to access CRDs using the auth API:
    ```bash
    # Should return "yes"
    kubectl auth can-i list crds
    ```
