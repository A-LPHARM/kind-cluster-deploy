terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

resource "kubectl_manifest" "deploy" {
    yaml_body = file("deploy-node.yaml")
}

provider "kubectl" {
  config_path = "~/.kube/config" 
}
