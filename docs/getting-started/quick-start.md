# Quick Start

Get started with AMDF using either the CLI or MCP interface.

## Choose Your Interface

=== "CLI Interface"
    Command-line workflows and automation.

    ```bash
    # Install AMDF
    pip install amdf

    # Verify installation
    amdf version
    ```

=== "MCP Interface"

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

## Step 1: Verify Prerequisites

Ensure you have access to a Kubernetes cluster with CRDs:

```bash
# Check cluster access
kubectl cluster-info

# List available CRDs
kubectl get crds | head -10
```

## Step 2: Discover Resources

=== "CLI"
    ```bash
    # List all CRDs
    amdf list-crds

    # Filter CRDs by service
    amdf list-crds --filter ec2
    amdf list-crds --filter istio

    # List native Kubernetes resources
    amdf list-k8s

    # Filter K8s resources
    amdf list-k8s --filter pod
    amdf list-k8s --filter deployment
    amdf list-k8s --filter storage

    # Specify Kubernetes version
    amdf list-k8s --version 1.30.0 --filter networking
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
    # Generate from CRDs
    amdf generate instances.ec2.aws.upbound.io

    # Generate from native Kubernetes objects (case-sensitive)
    amdf generate-k8s Pod
    amdf generate-k8s Service

    # Generate without blueprint
    amdf generate instances.ec2.aws.upbound.io --no-blueprint

    # Custom output directory
    amdf generate-k8s Deployment --output ./my-schemas
    ```

=== "MCP"
    ```
    "Generate schema for instances.ec2.aws.upbound.io"
    "Generate schema for Kubernetes Pod"
    "Generate Service schema"
    ```

!!! note "Kubernetes Kind Names"
    Kind names are case-sensitive and must match exactly (e.g., `Service` not `service`, `Pod` not `pod`). Use `amdf list-k8s` to see the correct names.

This creates:

**For CRDs:**
```
library/
├── models/
│   └── ec2_aws_upbound_io/v1beta1/
│       └── ec2_aws_upbound_io_v1beta1_Instance.k    # Complete schema
├── blueprints/
│   └── Instance.k                                    # Simplified interface
├── policies/
│   └── InstancePolicy.k                              # Custom validation template
└── main.k                                            # Usage example
```

**For Native K8s Objects:**
```
library/
├── models/
│   └── k8s/v1/
│       └── k8s_v1_Pod.k                              # Complete schema
├── blueprints/
│   └── Pod.k                                         # Simplified interface
├── policies/
│   └── PodPolicy.k                                   # Custom validation template
└── main.k                                            # Usage example
```

## Step 4: Use the Generated Blueprints

Create your first infrastructure configuration:

=== "Crossplane Resource"
    ```kcl
    import blueprints.Instance

    # EC2 Instance configuration
    webServer = Instance.InstanceBlueprint {
        _metadataName = "web-server"
        _providerConfig = "default"
        _instanceType = "t3.medium"
        _region = "us-east-1"

        # Security configuration
        _metadataOptions = [{
            httpTokens = "required"
        }]
        _rootBlockDevice = [{
            encrypted = True
        }]

        _tags = {
            Name = "web-server"
            Environment = "production"
        }
    }
    ```

=== "Native Kubernetes"
    ```kcl
    import blueprints.Service
    import blueprints.Deployment

    # Service configuration
    service = Service.ServiceBlueprint {
        _metadataName = "nginx"
        _namespace = "demo"
        _labels = {app = "nginx"}
        _ports = [{name = "http", port = 80, protocol = "TCP", targetPort = 80}]
        _selector = {app = "nginx"}
        _type = "ClusterIP"
    }

    # Deployment configuration
    deployment = Deployment.DeploymentBlueprint {
        _metadataName = "nginx"
        _namespace = "demo"
        _labels = {app = "nginx", version = "v1"}
        _replicas = 2
        _selector = {matchLabels = {app = "nginx", version = "v1"}}
        _template = {
            metadata = {labels = {app = "nginx", version = "v1"}}
            spec = {
                containers = [{
                    name = "nginx"
                    image = "nginx:1.25"
                    ports = [{containerPort = 80}]
                }]
            }
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
    # Generate CRD components
    amdf generate vpcs.ec2.aws.upbound.io
    amdf generate subnets.ec2.aws.upbound.io
    amdf generate internetgateways.ec2.aws.upbound.io

    # Generate native K8s components
    amdf generate-k8s Pod
    amdf generate-k8s Service
    amdf generate-k8s Deployment
    ```

=== "MCP"
    ```
    "Generate schemas for VPC, subnets, and internet gateway"
    "Create networking blueprints for AWS"
    "Generate Kubernetes Pod, Service, and Deployment schemas"
    ```

### Service Mesh Setup

=== "CLI"
    ```bash
    # Istio CRDs
    amdf list-crds --filter istio
    amdf generate virtualservices.networking.istio.io
    amdf generate gateways.networking.istio.io

    # Native K8s for workloads
    amdf generate-k8s Service
    amdf generate-k8s ServiceAccount
    ```

=== "MCP"
    ```
    "List Istio CRDs"
    "Generate Istio VirtualService schema"
    "Generate Kubernetes Service and ServiceAccount schemas"
    ```

### Monitoring Stack

=== "CLI"
    ```bash
    # Prometheus Operator CRDs
    amdf list-crds --filter prometheus
    amdf generate prometheuses.monitoring.coreos.com
    amdf generate servicemonitors.monitoring.coreos.com

    # Native K8s for configuration
    amdf generate-k8s ConfigMap
    amdf generate-k8s Secret
    ```

=== "MCP"
    ```
    "Show me Prometheus operator CRDs"
    "Generate monitoring schemas"
    "Generate ConfigMap and Secret schemas for configuration"
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

User: "Generate schema for VirtualService and native Service"
Assistant: [Generates Istio VirtualService and Kubernetes Service schemas]

```

### Scenario 3: Complete Application Stack

```
User: "I need to deploy a web application with Kubernetes"
Assistant: [Shows available native K8s objects]

User: "Generate schemas for Deployment, Service, and ConfigMap"
Assistant: [Generates native Kubernetes schemas and blueprints]

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
