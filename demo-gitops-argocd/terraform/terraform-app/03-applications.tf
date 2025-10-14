resource "argocd_application" "flask_app" {
  metadata {
    name      = var.app_name
    namespace = "argocd"
  }

  spec {
    project = "default"

    source {
      repo_url        = var.repo_url
      target_revision = var.repo_branch
      path            = var.chart_path

      helm {
        value_files = [var.values_file]
      }
    }

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.app_namespace
    }

    sync_policy {
      automated {
        prune     = true
        self_heal = true
      }

      sync_options = [
        "CreateNamespace=true"
      ]
    }
  }
}
