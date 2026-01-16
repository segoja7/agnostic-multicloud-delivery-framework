#Example from documentation oficial from aws https://docs.aws.amazon.com/eks/latest/userguide/kro-concepts.html

import blueprints

blueprints.ResourcegraphdefinitionBlueprint {
  _metadataName = "webapplication"
  _schema = {
    apiVersion = "v1alpha1"
    kind = "WebApplication"
    group = "kro.run"
    spec.name = "string | required=true"
    spec.image = r"""string | default="nginx:latest" """
    spec.replicas = "integer | default=3"
  }
  _resources = [
    {
      id = "deployment"
      template = {
        apiVersion = "apps/v1"
        kind = "Deployment"
        metadata.name = r"${schema.spec.name}"
        spec = {
          replicas = r"${schema.spec.replicas}"
          selector.matchLabels = {
            app = r"${schema.spec.name}"
          }
          template.metadata.labels = {
            app = r"${schema.spec.name}"
          }
          template.spec.containers = [
            {
              name = "app"
              image = r"${schema.spec.image}"
              ports = [{
                containerPort = 80
              }]
            }
          ]
        }
      }
    }
    {
      id = "service"
      template = {
        apiVersion = "v1"
        kind = "Service"
        metadata.name = r"${schema.spec.name}"
        spec = {
          selector = {
            app = r"${schema.spec.name}"
          }
          ports = [
            {
              protocol = "TCP"
              port = 80
              targetPort = 80
            }
          ]
        }
      }
    }
  ]
}



