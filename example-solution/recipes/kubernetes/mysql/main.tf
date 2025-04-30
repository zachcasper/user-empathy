terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

variable "context" {
  description = "This variable contains Radius recipe context."
  type = any
}

locals {
  appName = var.context.application.name
  uniqueName = var.context.resource.name
  port     = 3306
  namespace = var.context.runtime.kubernetes.namespace
}

resource "kubernetes_deployment" "mysql" {
  metadata {
    name      = local.uniqueName
    namespace = local.namespace
  }

  spec {
    selector {
      match_labels = {
        app = local.appName
        tier = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = local.appName
          tier = "mysql"
        }
      }

      spec {
        container {
          image = "mysql:8.0"
          name  = "mysql"
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "WU9VUl9QQVNTV09SRA=="
          }
          env {
            name = "MYSQL_DATABASE"
            value = local.appName
          }
          env {
            name  = "MYSQL_USER"
            value = local.appName
          }
          env {
            name  = "MYSQL_PASSWORD"
            value = "WU9VUl9QQVNTV09SRA=="
          }
          port {
            container_port = local.port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mysql" {
  metadata {
    name      = local.uniqueName
    namespace = local.namespace
  }

  spec {
    selector = {
      app = local.appName
      tier = "mysql"
    }

    port {
      port        = local.port
      target_port = local.port
    } 
  }
}

output "result" {
  value = {
    values = {
      host = "${kubernetes_service.mysql.metadata[0].name}.${kubernetes_service.mysql.metadata[0].namespace}.svc.cluster.local"
      port = local.port
      database = local.appName
      username = local.appName
      password = "WU9VUl9QQVNTV09SRA=="
    }
  }
}