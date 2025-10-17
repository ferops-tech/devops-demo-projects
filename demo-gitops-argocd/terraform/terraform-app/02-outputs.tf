output "argocd_deploy_note" {
  description = "Notice for the user"
  value       = "You can now access the ArgoCD dashboard and view the deployed application using the credentials below:"
}

output "argocd_info" {
  description = "ArgoCD access information"
  value       = {
    url      = "http://${data.terraform_remote_state.infra.outputs.instance_public_ip}:30080/applications"
    user     = "admin"
    password = var.argocd_admin_password
  }
}

output "flask_deploy_note" {
  description = "Notice for the user"
  value       = "You can now access the deployed application using the link below:"
}


output "flask_info" {
  description = "ArgoCD access information"
  value       = {
    url      = "http://${data.terraform_remote_state.infra.outputs.instance_public_ip}"
  }
}