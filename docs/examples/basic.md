# Examples

Practical examples of using AMDF with different Kubernetes operators and resources.

## AWS Infrastructure (Crossplane)

```bash
# Generate schemas
amdf generate instances.ec2.aws.upbound.io
amdf generate vpcs.ec2.aws.upbound.io
```

```kcl
import library.blueprints.Vpc
import library.blueprints.Instance

vpc = Vpc.VpcBlueprint {
    _metadataName = "main-vpc"
    _cidrBlock = "10.0.0.0/16"
    _region = "us-east-1"
}

server = Instance.InstanceBlueprint {
    _metadataName = "web-server"
    _instanceType = "t3.medium"
    _ami = "ami-0c02fb55956c7d316"
}
```

## Native Kubernetes

```bash
# Generate schemas
amdf generate-k8s Deployment
amdf generate-k8s Service
```

```kcl
import library.blueprints.Deployment
import library.blueprints.Service

app = Deployment.DeploymentBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _replicas = 2
    _selector = {matchLabels = {app = "nginx"}}
    _template = {
        spec = {
            containers = [{
                name = "nginx"
                image = "nginx:1.21"
                ports = [{containerPort = 80}]
            }]
        }
    }
}

svc = Service.ServiceBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _ports = [{port = 80, targetPort = 80}]
    _selector = {app = "nginx"}
}
```

## Service Mesh (Istio)

```bash
# Generate schemas
amdf generate virtualservices.networking.istio.io
amdf generate gateways.networking.istio.io
```

```kcl
import library.blueprints.Gateway
import library.blueprints.Virtualservice

gateway = Gateway.GatewayBlueprint {
    _metadataName = "app-gateway"
    _selector = {istio = "ingressgateway"}
    _servers = [{
        port = {number = 80, name = "http", protocol = "HTTP"}
        hosts = ["app.example.com"]
    }]
}

vs = Virtualservice.VirtualserviceBlueprint {
    _metadataName = "app-routes"
    _hosts = ["app.example.com"]
    _gateways = ["app-gateway"]
    _http = [{
        route = [{
            destination = {
                host = "api-service"
                port = {number = 8080}
            }
        }]
    }]
}
```

## GitOps (ArgoCD)

```bash
# Generate schemas
amdf generate applications.argoproj.io
```

```kcl
import library.blueprints.Application

app = Application.ApplicationBlueprint {
    _metadataName = "monitoring"
    _namespace = "argocd"
    _project = "platform"
    _source = {
        repoURL = "https://github.com/team/monitoring"
        path = "manifests"
        targetRevision = "main"
    }
    _destination = {
        server = "https://kubernetes.default.svc"
        namespace = "monitoring"
    }
    _syncPolicy = {
        automated = {
            prune = True
            selfHeal = True
        }
    }
}
```

## Multi-Environment

```kcl
# environments/prod.k
import library.blueprints.Deployment

prod = Deployment.DeploymentBlueprint {
    _metadataName = "api"
    _namespace = "production"
    _replicas = 3
    _template = {
        spec = {
            containers = [{
                name = "api"
                image = "api:v1.2.3"
                resources = {
                    limits = {memory = "512Mi", cpu = "500m"}
                }
            }]
        }
    }
}
```

```kcl
# environments/staging.k
import library.blueprints.Deployment

staging = Deployment.DeploymentBlueprint {
    _metadataName = "api"
    _namespace = "staging"
    _replicas = 1
    _template = {
        spec = {
            containers = [{
                name = "api"
                image = "api:latest"
                resources = {
                    limits = {memory = "256Mi", cpu = "200m"}
                }
            }]
        }
    }
}
```

## Resources

- [CLI Reference](../user-guide/cli.md)
- [Policy Templates](../user-guide/policy-templates.md)
- [MCP Integration](../user-guide/mcp.md)
