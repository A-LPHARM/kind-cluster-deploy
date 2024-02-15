terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}


provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheusstack"

  repository = "https://prometheus-community.github.io/helm-charts/"
  chart      = "kube-prometheus-stack"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}