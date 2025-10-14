terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.11.2"
    }
  }
}

provider "argocd" {
  server_addr = "${data.terraform_remote_state.infra.outputs.instance_public_ip}:30080"
  username    = "admin"
  password    = var.argocd_admin_password
  plain_text  = true
}

data "terraform_remote_state" "infra" {
  backend = "local"
  config = {
    path = "../terraform-infra/terraform.tfstate"  # reads outputs from your infra state
  }
}