# --- High-Level Blueprint (Auto-Generated) ---

import models.k8s.apps_v1.k8s_apps_v1_Deployment as deployment_schema

schema DeploymentBlueprint(deployment_schema.Deployment):
    """This Blueprint simplifies the creation of a Deployment resource,
    exposing an intelligent selection of common required and optional fields."""

    # Simplified input parameters for the user
    _metadataName: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _minReadySeconds? : int
    _paused? : bool
    _progressDeadlineSeconds? : int
    _replicas? : int
    _revisionHistoryLimit? : int
    _selector : any
    _strategy? : any
    _template : any

    # Mapping logic from simple parameters to complex structure
    metadata = {
        name = _metadataName
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        minReadySeconds = _minReadySeconds
        paused = _paused
        progressDeadlineSeconds = _progressDeadlineSeconds
        replicas = _replicas
        revisionHistoryLimit = _revisionHistoryLimit
        selector = _selector
        strategy = _strategy
        template = _template
    }


deployment = DeploymentBlueprint {
    _metadataName = "productpage-v1"
    _namespace = "demo"
    _labels = {app = "productpage", version = "v1"}


    _replicas = 1
    _selector = {
            matchLabels = {app = "productpage", version = "v1"}
        }
    _template = {
            metadata = {
                annotations = {
                    "prometheus.io/scrape" = "true"  # ← Entre comillas
                    "prometheus.io/port" = "9080"
                    "prometheus.io/path" = "/metrics"
                }
                labels = {app = "productpage", version = "v1"}
            }
            spec = {
                serviceAccountName = "bookinfo-productpage"
                containers = [{
                    name = "productpage"
                    image = "docker.io/istio/examples-bookinfo-productpage-v1:1.20.3"
                    imagePullPolicy = "IfNotPresent"
                    ports = [{containerPort = 9080}]
                    volumeMounts = [{
                        name = "tmp"
                        mountPath = "/tmp"
                    }]
                }]
                volumes = [{
                    name = "tmp"
                    emptyDir = {}
                }]
            }
        }

}