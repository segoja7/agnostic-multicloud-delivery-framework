# Policy Templates

AMDF generates policy templates for compile-time validation with KCL. These templates provide fast feedback during development with type-safe checks.

## Quick Start

### 1. Generate with Policy Template

```bash
# Native Kubernetes resource
amdf generate-k8s Deployment

# Custom Resource Definition
amdf generate virtualservices.networking.istio.io
```

**Generated structure:**
```
library/
├── blueprints/
│   └── Deployment.k          # Simplified interface
├── models/
│   └── k8s/apps_v1/          # Complete schema
├── policies/
│   └── DeploymentPolicy.k    # Policy template
└── main.k                     # Example usage
```

### 2. Customize Policy Checks

Edit `policies/DeploymentPolicy.k`:

```kcl
schema DeploymentPolicyMixin:
    check:
        # Uncomment checks you want to enforce
        _replicas >= 2, "Minimum 2 replicas for HA"

        all container in _template.spec.containers {
            not container.image.endswith(":latest")
        }, "Using :latest tag not allowed"
```

### 3. Apply Policy in Configuration

Edit `main.k`:

```kcl
import blueprints.Deployment
import policies.DeploymentPolicy

# Create validated schema
schema ValidatedDeployment(Deployment.DeploymentBlueprint):
    mixin [DeploymentPolicy.DeploymentPolicyMixin]

# Use it
app = ValidatedDeployment {
    _metadataName = "nginx"
    _replicas = 3
    _selector = {matchLabels = {app = "nginx"}}
    _template = {
        spec = {
            containers = [{
                name = "nginx"
                image = "nginx:1.21"
            }]
        }
    }
}

items = [app]
```

### 4. Validate Configuration

KCL validates automatically when you compile:

```bash
# This validates your policy checks
kcl library/main.k
```

**If validation fails:**
```
Error: EvaluationError
 --> library/main.k:9:7
  |
9 | app = ValidatedDeployment {
  |       ^ Instance check failed
  |
 --> library/policies/DeploymentPolicy.k:8:1
  |
8 |         }, "Using :latest tag not allowed"
  |  Check failed on the condition: Using :latest tag not allowed
```

Fix the issue and run again. **No YAML generation needed for policy validation** - KCL checks run at compile-time.

### 5. Generate YAML (After Validation Passes)

```bash
# Generate clean YAML
kcl library/main.k -S items > deployment.yaml
```

### 6. Validate with Kyverno (Optional)

```bash
# Against cluster policies (default)
amdf validate deployment.yaml

# Against local policy file
amdf validate deployment.yaml --policy policy.yaml
```

### 7. Apply to Cluster

```bash
kubectl apply -f deployment.yaml
```

## Policy Templates

### What They Are

Policy templates provide compile-time validation in KCL. Generated with common checks commented out, ready to enable based on your requirements.

### Common Checks by Resource

#### Pod

```kcl
# Security: Disallow privileged containers
# all container in _containers {
#     not (container?.securityContext?.privileged == True)
# }, "Privileged containers not allowed"

# Security: Require non-root user
# all container in _containers {
#     container?.securityContext?.runAsNonRoot == True
# }, "Containers must run as non-root"

# Best practice: Disallow latest tag
# all container in _containers {
#     not container.image.endswith(":latest")
# }, "Using :latest tag not allowed"

# Resource limits
# all container in _containers {
#     "memory" in (container?.resources?.limits or {})
# }, "Memory limits required"
```

#### Deployment

```kcl
# Replicas validation
# _replicas >= 2, "Minimum 2 replicas for HA"

# Security: Disallow privileged containers
# all container in _template.spec.containers {
#     not (container?.securityContext?.privileged == True)
# }, "Privileged containers not allowed"

# Best practice: Require resource limits
# all container in _template.spec.containers {
#     "memory" in (container?.resources?.limits or {})
# }, "Memory limits required"
```

#### Service

```kcl
# Type validation
# _type in ["ClusterIP", "NodePort", "LoadBalancer"],
#     "Invalid service type"

# Port validation
# len(_ports) > 0, "At least one port required"
```

#### CRDs (Auto-generated from schema)

```kcl
# Example: Istio VirtualService
# len(spec?.hosts or []) > 0, "hosts list required"
# len(spec?.gateways or []) > 0, "gateways list required"
# len(spec?.http or []) > 0, "http routes required"
```

### Custom Checks

Add your own validation logic:

```kcl
schema DeploymentPolicyMixin:
    check:
        # Built-in suggestions
        _replicas >= 2, "Minimum 2 replicas"

        # Your custom checks
        _namespace in ["prod", "staging"], "Invalid namespace"
        "team" in _labels, "Team label required"

        all container in _template.spec.containers {
            container.image.startswith("myregistry.io/")
        }, "Must use approved registry"
```

### Conditional Checks

```kcl
schema PodPolicyMixin:
    check:
        # Only enforce in production
        _namespace != "prod" or all container in _containers {
            "memory" in (container?.resources?.limits or {})
        }, "Memory limits required in prod"
```

### Disabling Policy Templates

Generate without policy templates:

```bash
amdf generate-k8s Pod --no-policy-template
```

Or don't use the mixin:

```kcl
# No validation
app = Deployment.DeploymentBlueprint {
    # ...
}
```
