import blueprints

_providerConfig = blueprints.ProviderconfigBlueprint {
    _metadataName = "default"
    _configuration = r"""terraform {
  backend "s3" {
    bucket                   = "21112026-temp"
    key                      = "crossplane/tofu/my_key"
    region                   = "us-east-1"
    shared_credentials_files = ["aws-creds.ini"]
    profile                  = "default"
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["${path.module}/aws-creds.ini"]
  profile                  = "default"
}
"""
    _credentials = [
        {
            filename = "aws-creds.ini"
            secretRef = {
                key = "creds"
                name = "aws-secret"
                namespace = "crossplane-system"
            }
            source = "Secret"
        }
    ]
}

_workspace_resource = blueprints.WorkspaceBlueprint {
    _metadataName = "workspace-example"
    _module = "git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git/?ref=v5.7.0"
    _source = "Remote"
    _varmap = {
        bucket = "tofu-example-bucket-150120261853-kcl"
        acl = "private"
        control_object_ownership = "true"
        object_ownership = "ObjectWriter"
        tags = {
            Environment = "testing-kcl"
            ManagedBy = "Crossplane-Tofu"
        }
    }
    _writeConnectionSecretToRef = {
        name = "s3-bucket-details"
        namespace = "default"
    }
    _providerConfig = _providerConfig._metadataName
}

items = [
    _workspace_resource,
    _providerConfig
]
