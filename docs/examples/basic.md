# Basic Examples

This section provides practical examples of using AMDF to generate KCL schemas from various Kubernetes operators.


## Example 1: AWS Infrastructure with Crossplane

### Generate Schemas

=== "CLI"
    ```bash
    # Generate AWS infrastructure schemas
    amdf generate instances.ec2.aws.upbound.io
    amdf generate vpcs.ec2.aws.upbound.io
    amdf generate subnets.ec2.aws.upbound.io
    amdf generate securitygroups.ec2.aws.upbound.io
    ```

=== "MCP"
    ```
    "List AWS CRDs in my cluster"
    "Generate schemas for EC2, VPC, subnet, and security group"
    ```

### Use Generated Blueprints

```kcl
import library.blueprints.Vpc
import library.blueprints.Subnet
import library.blueprints.Instance
import library.blueprints.Securitygroup

# VPC
vpc = Vpc.VpcBlueprint {
    _metadataName = "main-vpc"
    _providerConfig = "default"
    _cidrBlock = "10.0.0.0/16"
    _region = "us-east-1"
    _tags = {
        Name = "main-vpc"
        Environment = "production"
    }
}

# Public Subnet
publicSubnet = Subnet.SubnetBlueprint {
    _metadataName = "public-subnet"
    _providerConfig = "default"
    _cidrBlock = "10.0.1.0/24"
    _availabilityZone = "us-east-1a"
    _mapPublicIpOnLaunch = True
    _tags = {
        Name = "public-subnet"
        Type = "public"
    }
}

# Security Group
webSG = Securitygroup.SecuritygroupBlueprint {
    _metadataName = "web-sg"
    _providerConfig = "default"
    _description = "Security group for web servers"
    _ingress = [{
        fromPort = 80
        toPort = 80
        protocol = "tcp"
        cidrBlocks = ["0.0.0.0/0"]
    }, {
        fromPort = 443
        toPort = 443
        protocol = "tcp"
        cidrBlocks = ["0.0.0.0/0"]
    }]
    _tags = {
        Name = "web-sg"
        Purpose = "web-traffic"
    }
}

# EC2 Instance
webServer = Instance.InstanceBlueprint {
    _metadataName = "web-server"
    _providerConfig = "default"
    _instanceType = "t3.medium"
    _ami = "ami-0c02fb55956c7d316"  # Amazon Linux 2023
    _region = "us-east-1"

    # Security best practices
    _metadataOptions = [{
        httpEndpoint = "enabled"
        httpTokens = "required"  # IMDSv2
        httpPutResponseHopLimit = 1
    }]

    _rootBlockDevice = [{
        volumeType = "gp3"
        volumeSize = 20
        encrypted = True
        deleteOnTermination = True
    }]

    _tags = {
        Name = "web-server"
        Environment = "production"
        Role = "webserver"
    }
}
```

### Deploy

```bash
# Render and apply
kcl run infrastructure.k | kubectl apply -f -
```

## Example 2: Service Mesh with Istio

### Generate Schemas

=== "CLI"
    ```bash
    # List Istio CRDs
    amdf list-crds --filter istio

    # Generate schemas
    amdf generate virtualservices.networking.istio.io
    amdf generate gateways.networking.istio.io
    amdf generate destinationrules.networking.istio.io
    ```

=== "MCP"
    ```
    "Show me Istio CRDs"
    "Generate schemas for VirtualService, Gateway, and DestinationRule"
    ```

### Use Generated Blueprints

```kcl
import library.blueprints.Gateway
import library.blueprints.Virtualservice
import library.blueprints.Destinationrule

# Gateway
appGateway = Gateway.GatewayBlueprint {
    _metadataName = "app-gateway"
    _namespace = "istio-system"
    _selector = {
        istio = "ingressgateway"
    }
    _servers = [{
        port = {
            number = 80
            name = "http"
            protocol = "HTTP"
        }
        hosts = ["app.example.com"]
    }, {
        port = {
            number = 443
            name = "https"
            protocol = "HTTPS"
        }
        hosts = ["app.example.com"]
        tls = {
            mode = "SIMPLE"
            credentialName = "app-tls-secret"
        }
    }]
}

# VirtualService
appVirtualService = Virtualservice.VirtualserviceBlueprint {
    _metadataName = "app-vs"
    _namespace = "default"
    _hosts = ["app.example.com"]
    _gateways = ["istio-system/app-gateway"]
    _http = [{
        match = [{
            uri = {
                prefix = "/api"
            }
        }]
        route = [{
            destination = {
                host = "api-service"
                port = {
                    number = 8080
                }
            }
        }]
    }, {
        route = [{
            destination = {
                host = "web-service"
                port = {
                    number = 3000
                }
            }
        }]
    }]
}

# DestinationRule
appDestinationRule = Destinationrule.DestinationruleBlueprint {
    _metadataName = "app-dr"
    _namespace = "default"
    _host = "api-service"
    _trafficPolicy = {
        loadBalancer = {
            simple = "LEAST_CONN"
        }
        connectionPool = {
            tcp = {
                maxConnections = 100
            }
            http = {
                http1MaxPendingRequests = 50
                maxRequestsPerConnection = 10
            }
        }
    }
}
```

## Example 3: Monitoring with Prometheus Operator

### Generate Schemas

=== "CLI"
    ```bash
    # List Prometheus CRDs
    amdf list-crds --filter prometheus

    # Generate monitoring schemas
    amdf generate prometheuses.monitoring.coreos.com
    amdf generate servicemonitors.monitoring.coreos.com
    amdf generate alertmanagers.monitoring.coreos.com
    ```

=== "MCP"
    ```
    "List monitoring CRDs"
    "Generate Prometheus operator schemas"
    ```

### Use Generated Blueprints

```kcl
import library.blueprints.Prometheus
import library.blueprints.Servicemonitor
import library.blueprints.Alertmanager

# Prometheus Instance
prometheus = Prometheus.PrometheusBlueprint {
    _metadataName = "main-prometheus"
    _namespace = "monitoring"
    _replicas = 2
    _retention = "30d"
    _storage = {
        volumeClaimTemplate = {
            spec = {
                accessModes = ["ReadWriteOnce"]
                resources = {
                    requests = {
                        storage = "50Gi"
                    }
                }
                storageClassName = "gp3"
            }
        }
    }
    _serviceMonitorSelector = {
        matchLabels = {
            team = "platform"
        }
    }
    _resources = {
        requests = {
            memory = "2Gi"
            cpu = "1000m"
        }
        limits = {
            memory = "4Gi"
            cpu = "2000m"
        }
    }
}

# ServiceMonitor for application
appServiceMonitor = Servicemonitor.ServicemonitorBlueprint {
    _metadataName = "app-metrics"
    _namespace = "monitoring"
    _selector = {
        matchLabels = {
            app = "my-app"
        }
    }
    _endpoints = [{
        port = "metrics"
        path = "/metrics"
        interval = "30s"
    }]
    _labels = {
        team = "platform"
    }
}

# AlertManager
alertmanager = Alertmanager.AlertmanagerBlueprint {
    _metadataName = "main-alertmanager"
    _namespace = "monitoring"
    _replicas = 2
    _storage = {
        volumeClaimTemplate = {
            spec = {
                accessModes = ["ReadWriteOnce"]
                resources = {
                    requests = {
                        storage = "10Gi"
                    }
                }
            }
        }
    }
}
```

## Example 4: GitOps with ArgoCD

### Generate Schemas

=== "CLI"
    ```bash
    # List ArgoCD CRDs
    amdf list-crds --filter argo

    # Generate GitOps schemas
    amdf generate applications.argoproj.io
    amdf generate appprojects.argoproj.io
    ```

=== "MCP"
    ```
    "Show me ArgoCD CRDs"
    "Generate schemas for ArgoCD Application and AppProject"
    ```

### Use Generated Blueprints

```kcl
import library.blueprints.Application
import library.blueprints.Appproject

# AppProject
platformProject = Appproject.AppprojectBlueprint {
    _metadataName = "platform-project"
    _namespace = "argocd"
    _description = "Platform team applications"
    _sourceRepos = [
        "https://github.com/platform-team/*"
    ]
    _destinations = [{
        namespace = "*"
        server = "https://kubernetes.default.svc"
    }]
    _clusterResourceWhitelist = [{
        group = ""
        kind = "Namespace"
    }, {
        group = "rbac.authorization.k8s.io"
        kind = "ClusterRole"
    }]
}

# Application
monitoringApp = Application.ApplicationBlueprint {
    _metadataName = "monitoring-stack"
    _namespace = "argocd"
    _project = "platform-project"
    _source = {
        repoURL = "https://github.com/platform-team/monitoring"
        path = "manifests"
        targetRevision = "HEAD"
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
        syncOptions = [
            "CreateNamespace=true"
        ]
    }
}

# Infrastructure Application
infraApp = Application.ApplicationBlueprint {
    _metadataName = "infrastructure"
    _namespace = "argocd"
    _project = "platform-project"
    _source = {
        repoURL = "https://github.com/platform-team/infrastructure"
        path = "crossplane"
        targetRevision = "main"
        plugin = {
            name = "kcl-v1.0"
        }
    }
    _destination = {
        server = "https://kubernetes.default.svc"
        namespace = "crossplane-system"
    }
    _syncPolicy = {
        automated = {
            prune = True
            selfHeal = True
        }
    }
}
```

## Common Patterns

### Multi-Environment Setup

```kcl
# environments/production.k
import library.blueprints.Instance

prodInstance = Instance.InstanceBlueprint {
    _metadataName = "prod-web-server"
    _instanceType = "m5.large"
    _tags = {
        Environment = "production"
        Backup = "daily"
    }
}

# environments/staging.k
import library.blueprints.Instance

stagingInstance = Instance.InstanceBlueprint {
    _metadataName = "staging-web-server"
    _instanceType = "t3.medium"
    _tags = {
        Environment = "staging"
        AutoShutdown = "enabled"
    }
}
```

### Configuration Management

```kcl
# config/common.k
commonTags = {
    Project = "my-app"
    Owner = "platform-team"
    ManagedBy = "kcl"
}

# Use in resources
import config.common

webServer = Instance.InstanceBlueprint {
    _metadataName = "web-server"
    _tags = common.commonTags | {
        Role = "webserver"
    }
}
```

### Validation and Policies

```kcl
# policies/security.k
schema SecureInstance(Instance.InstanceBlueprint):
    # Enforce security requirements
    check:
        _metadataOptions[0].httpTokens == "required", "IMDSv2 must be enabled"
        _rootBlockDevice[0].encrypted == True, "Root volume must be encrypted"
        "Environment" in _tags, "Environment tag is required"

# Use with validation
secureWeb = SecureInstance {
    _metadataName = "secure-web-server"
    _instanceType = "t3.medium"
    # ... other configuration
}
```

## Next Steps

- [CLI Reference](../user-guide/cli.md) - Complete CLI documentation
- [MCP Integration](../user-guide/mcp.md) - AI-assisted workflows
