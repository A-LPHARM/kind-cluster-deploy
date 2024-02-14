provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheusstack"

  repository = "https://prometheus-community.github.io/helm-charts/"
  chart      = "prometheus"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}