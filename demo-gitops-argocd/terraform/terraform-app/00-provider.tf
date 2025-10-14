terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.11.2"
    }
  }
}

#provider "argocd" {
##  server_addr = "51.44.174.221:30443" # var.argocd_server_addr # or DNS if you set up Ingress
#  server_addr = "51.44.174.221:30443"
#  username    = "admin" # var.argocd_username
#  password    = var.argocd_password
#  insecure    = true  # only if TLS not valid
##  plain_http  = true  # Https is not enabled
#}

provider "argocd" {
  server_addr = "35.180.204.225:30080" # confirmed by the config file ~/.config/argocd/config
  username    = "admin"
  password    = "rmNZHT64i4tLIWgO"
#  insecure    = true
  plain_text  = true
}

## Exposed ArgoCD API - authenticated using authentication token.
#provider "argocd" {
#  server_addr = "35.180.204.225:30080"
#  auth_token  = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJhZG1pbjphcGlLZXkiLCJuYmYiOjE3NjA0MzM3MjEsImlhdCI6MTc2MDQzMzcyMSwianRpIjoiMzY5ZjMwN2MtMzZmMS00MTg5LWJmMjktM2M4NzgyYTQ5Y2U0In0.Yxywzuf3nepTQ9lL_FLb7dnbXVy_yjeKEsHsHunPICE"
#  plain_text  = true
#}

#provider "argocd" {
#  use_local_config = true
#  # context = "foo" # Use explicit context from ArgoCD config instead of `current-context`.
#}


#provider "argocd" {
#  server_addr = var.argocd_server_addr
#  username    = var.argocd_username
#  password    = var.argocd_password
#  insecure    = true  # You can remove this if using a valid TLS cert
#}
#
