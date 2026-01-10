#import blueprints.Applicationset as appset
import config.common
import blueprints.Instance as ec2

instance = ec2.InstanceBlueprint {
    _metadataName = "simple-ec2"
    _providerConfig = "segoja7"
    _instanceType = "m7i-flex.large"
    _ami = "ami-07ff62358b87c7116"  # Amazon Linux 2 AMI
    _region = "us-east-1"
    # _subnetIdRef = {
    #     name = "public-subnet-1"
    # }
    # _vpcSecurityGroupIdRefs = [
    #     {name = "default-sg"}
    # ]
    _tags = common.commonTags | {
        Role = "webserver"
    }
}
# app = appset.ApplicationsetBlueprint {
#     _metadataName = "myappset"
#     _namespace = "argocd"
#     _goTemplate = True
#     _goTemplateOptions = [
#         "missingkey=error"
#     ]
#     _generators = [
#         {
#             matrix = {
#                 generators = [
#                     {
#                         clusters = {
#                             selector = {
#                                 matchExpressions = [
#                                     {
#                                         key = "environment"
#                                         operator = "NotIn"
#                                         values = [
#                                             "hub"
#                                         ]
#                                     }
#                                 ]
#                             }
#                         }
#                     }
#                     {
#                         git = {
#                             repoURL = "https://github.com/segoja7/demo_cncf_latam_summit/"
#                             revision = "HEAD"
#                             directories = [
#                                 {
#                                     path = "dev-consumer/*"
#                                 }
#                             ]
#                         }
#                     }
#                 ]
#             }
#         }
#     ]
#     _template = {
#         metadata = {
#             name = "{{.path.basename}}-{{.name}}"
#             namespace = "argocd"
#         }
#         spec = {
#             project = "default"
#             source = {
#                 repoURL = "https://github.com/segoja7/demo_cncf_latam_summit/"
#                 targetRevision = "HEAD"
#                 path = "{{.path.path}}"
#                 plugin = {
#                     name = "kcl-v1.0"
#                 }
#             }
#             destination = {
#                 name = "{{.name}}"
#                 namespace = "default"
#             }
#             syncPolicy = {
#                 automated = {
#                     prune = True
#                     selfHeal = True
#                 }
#                 syncOptions = [
#                     "CreateNamespace=true"
#                 ]
#             }
#         }
#     }
# }
