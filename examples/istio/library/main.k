import blueprints

# PeerAuthentication
peer = blueprints.PeerauthenticationBlueprint {
    _metadataName = "default"
    _namespace = "demo"
    _mtls = {mode = "STRICT"}
}

# Gateway
gateway = blueprints.GatewayBlueprint {
    _metadataName = "demo-gateway"
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

# VirtualService
virtualService = blueprints.VirtualserviceBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _gateways = ["demo-gateway"]
    _hosts = ["*"]
    _http = [{
        route = [{
            destination = {
                host = "nginx"
                port = {number = 80}
            }
        }]
    }]
}

# Service
service = blueprints.ServiceBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _labels = {app = "nginx"}
    _ports = [{name = "http", port = 80, protocol = "TCP", targetPort = 80}]
    _selector = {app = "nginx"}
    _type = "ClusterIP"
}

# ServiceAccount
serviceAccount = blueprints.ServiceAccountBlueprint {
    _metadataName = "nginx-sa"
    _namespace = "demo"
    _labels = {app = "nginx"}
}

# Deployment
deployment = blueprints.DeploymentBlueprint {
    _metadataName = "nginx"
    _namespace = "demo"
    _labels = {app = "nginx", version = "v1"}
    _replicas = 1
    _selector = {matchLabels = {app = "nginx", version = "v1"}}
    _template = {
        metadata = {
            labels = {app = "nginx", version = "v1"}
        }
        spec = {
            serviceAccountName = serviceAccount.metadata.name
            containers = [{
                name = "nginx"
                image = "nginx:latest"
                imagePullPolicy = "IfNotPresent"
                ports = [{containerPort = 80}]
            }]
        }
    }
}


items = [peer, gateway, virtualService, service, serviceAccount, deployment]