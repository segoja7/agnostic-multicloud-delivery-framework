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

## Example 2: Native Kubernetes Application Stack

### Generate Schemas

=== "CLI"
    ```bash
    # Generate native Kubernetes schemas
    amdf generate-k8s Pod
    amdf generate-k8s Service
    amdf generate-k8s Deployment
    amdf generate-k8s ConfigMap
    amdf generate-k8s ServiceAccount
    ```

=== "MCP"
    ```
    "Generate schemas for Pod, Service, Deployment, ConfigMap, and ServiceAccount"
    "Create blueprints for native Kubernetes objects"
    ```

### Use Generated Blueprints

```kcl
import library.blueprints.ServiceAccount
import library.blueprints.ConfigMap
import library.blueprints.Service
import library.blueprints.Deployment

# ServiceAccount
appServiceAccount = ServiceAccount.ServiceAccountBlueprint {
    _metadataName = "nginx-sa"
    _namespace = "demo"
    _labels = {app = "nginx"}
}

# ConfigMap
appConfig = ConfigMap.ConfigMapBlueprint {
    _metadataName = "nginx-config"
    _namespace = "demo"
    _data = {
        "nginx.conf" = '''
        server {
            listen 80;
            server_name localhost;
            location / {
                root /usr/share/nginx/html;
                index index.html;
            }
        }
        '''
        "index.html" = '''
        <!DOCTYPE html>
        <html>
        <head><title>AMDF Demo</title></head>
        <body><h1>Hello from AMDF-generated Kubernetes!</h1></body>
        </html>
        '''
    }
    _labels = {app = "nginx"}
}

# Service
appService = Service.ServiceBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _labels = {app = "nginx", service = "nginx"}
    _ports = [{name = "http", port = 80, protocol = "TCP", targetPort = 80}]
    _selector = {app = "nginx"}
    _type = "ClusterIP"
}

# Deployment
appDeployment = Deployment.DeploymentBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _labels = {app = "nginx", version = "v1"}
    _replicas = 2
    _selector = {matchLabels = {app = "nginx", version = "v1"}}
    _template = {
        metadata = {
            labels = {app = "nginx", version = "v1"}
        }
        spec = {
            serviceAccountName = appServiceAccount.metadata.name  # Reference
            containers = [{
                name = "nginx"
                image = "nginx:latest"
                imagePullPolicy = "IfNotPresent"
                ports = [{containerPort = 80}]
                volumeMounts = [{
                    name = "config"
                    mountPath = "/etc/nginx/conf.d"
                }, {
                    name = "html"
                    mountPath = "/usr/share/nginx/html"
                }]
                resources = {
                    requests = {memory = "64Mi", cpu = "100m"}
                    limits = {memory = "128Mi", cpu = "200m"}
                }
            }]
            volumes = [{
                name = "config"
                configMap = {name = appConfig.metadata.name}
            }, {
                name = "html"
                configMap = {name = appConfig.metadata.name}
            }]
        }
    }
}
```

### Deploy

```bash
# Render and apply
kcl run k8s-app.k | kubectl apply -f -

# Verify deployment
kubectl get pods,svc,cm,sa -n demo -l app=nginx
```

## Example 3: Service Mesh with Istio

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

## Example 4: Monitoring with Prometheus Operator

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

## Example 5: GitOps with ArgoCD

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

## Example 6: Hybrid Stack - CRDs + Native Kubernetes

### Generate Schemas

=== "CLI"
    ```bash
    # Generate Istio CRDs
    amdf generate virtualservices.networking.istio.io
    amdf generate gateways.networking.istio.io

    # Generate native K8s objects
    amdf generate-k8s Service
    amdf generate-k8s Deployment
    amdf generate-k8s ServiceAccount
    ```

=== "MCP"
    ```
    "Generate Istio VirtualService and Gateway schemas"
    "Generate native Kubernetes Service, Deployment, and ServiceAccount schemas"
    ```

### Use Generated Blueprints

```kcl
import library.blueprints.Gateway
import library.blueprints.Virtualservice
import library.blueprints.ServiceAccount
import library.blueprints.Service
import library.blueprints.Deployment

# Native Kubernetes Resources
serviceAccount = ServiceAccount.ServiceAccountBlueprint {
    _metadataName = "nginx-sa"
    _namespace = "demo"
    _labels = {app = "nginx"}
}

service = Service.ServiceBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _labels = {app = "nginx"}
    _ports = [{name = "http", port = 80, protocol = "TCP", targetPort = 80}]
    _selector = {app = "nginx"}
    _type = "ClusterIP"
}

deployment = Deployment.DeploymentBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _labels = {app = "nginx", version = "v1"}
    _replicas = 1
    _selector = {matchLabels = {app = "nginx", version = "v1"}}
    _template = {
        metadata = {labels = {app = "nginx", version = "v1"}}
        spec = {
            serviceAccountName = serviceAccount.metadata.name
            containers = [{
                name = "nginx"
                image = "nginx:latest"
                ports = [{containerPort = 80}]
            }]
        }
    }
}

# Istio CRD Resources
gateway = Gateway.GatewayBlueprint {
    _metadataName = "nginx-gateway"
    _namespace = "demo"
    _selector = {istio = "ingressgateway"}
    _servers = [{
        hosts = ["*"]
        port = {
            name = "http"
            number = 80
            protocol = "HTTP"
        }
    }]
}

virtualService = Virtualservice.VirtualserviceBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _hosts = ["*"]
    _gateways = [gateway.metadata.name]  # Reference
    _http = [{
        route = [{
            destination = {
                host = service.metadata.name  # Reference
                port = {number = 80}
            }
        }]
    }]
}

# Combine all resources
items = [serviceAccount, service, deployment, gateway, virtualService]
```

### Deploy

```bash
# Deploy everything together
kcl run hybrid-stack.k -S items | kubectl apply -f -

# Verify Istio integration
kubectl get gateway,virtualservice,svc,deploy -n demo
```

## Common Patterns

### Multi-Environment Setup

```kcl
# environments/production.k
import library.blueprints.Instance
import library.blueprints.Deployment

# Crossplane resource
prodInstance = Instance.InstanceBlueprint {
    _metadataName = "prod-web-server"
    _instanceType = "m5.large"
    _tags = {
        Environment = "production"
        Backup = "daily"
    }
}

# Native K8s resource
prodDeployment = Deployment.DeploymentBlueprint {
    _metadataName = "prod-app"
    _namespace = "production"
    _replicas = 3
    _template = {
        spec = {
            containers = [{
                name = "app"
                image = "myapp:v1.2.3"
                resources = {
                    requests = {memory = "256Mi", cpu = "200m"}
                    limits = {memory = "512Mi", cpu = "500m"}
                }
            }]
        }
    }
}

# environments/staging.k
import library.blueprints.Instance
import library.blueprints.Deployment

stagingInstance = Instance.InstanceBlueprint {
    _metadataName = "staging-web-server"
    _instanceType = "t3.medium"
    _tags = {
        Environment = "staging"
        AutoShutdown = "enabled"
    }
}

stagingDeployment = Deployment.DeploymentBlueprint {
    _metadataName = "staging-app"
    _namespace = "staging"
    _replicas = 1
    _template = {
        spec = {
            containers = [{
                name = "app"
                image = "myapp:latest"
                resources = {
                    requests = {memory = "128Mi", cpu = "100m"}
                }
            }]
        }
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

commonLabels = {
    project = "my-app"
    team = "platform"
    managedBy = "amdf"
}

# Use in Crossplane resources
import config.common

webServer = Instance.InstanceBlueprint {
    _metadataName = "web-server"
    _tags = common.commonTags | {
        Role = "webserver"
    }
}

# Use in native K8s resources
import config.common

deployment = Deployment.DeploymentBlueprint {
    _metadataName = "web-app"
    _labels = common.commonLabels | {
        app = "web"
        version = "v1"
    }
}
```

### Validation and Policies

```kcl
# policies/security.k
import library.blueprints.Instance
import library.blueprints.Deployment

schema SecureInstance(Instance.InstanceBlueprint):
    # Enforce security requirements
    check:
        _metadataOptions[0].httpTokens == "required", "IMDSv2 must be enabled"
        _rootBlockDevice[0].encrypted == True, "Root volume must be encrypted"
        "Environment" in _tags, "Environment tag is required"

schema SecureDeployment(Deployment.DeploymentBlueprint):
    # Enforce K8s security requirements
    check:
        _template.spec.containers[0].securityContext.runAsNonRoot == True, "Must run as non-root"
        _template.spec.containers[0].securityContext.readOnlyRootFilesystem == True, "Root filesystem must be read-only"
        _template.spec.containers[0].resources.limits != None, "Resource limits are required"

# Use with validation
secureWeb = SecureInstance {
    _metadataName = "secure-web-server"
    _instanceType = "t3.medium"
    # ... other configuration
}

secureApp = SecureDeployment {
    _metadataName = "secure-app"
    _namespace = "production"
    _template = {
        spec = {
            containers = [{
                name = "app"
                image = "myapp:v1.0.0"
                securityContext = {
                    runAsNonRoot = True
                    readOnlyRootFilesystem = True
                    runAsUser = 1000
                }
                resources = {
                    limits = {memory = "256Mi", cpu = "200m"}
                    requests = {memory = "128Mi", cpu = "100m"}
                }
            }]
        }
    }
}
```

## Next Steps

- [CLI Reference](../user-guide/cli.md) - Complete CLI documentation
- [MCP Integration](../user-guide/mcp.md) - AI-assisted workflows
