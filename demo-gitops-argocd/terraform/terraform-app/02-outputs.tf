output "deploy_note" {
  description = "Notice for the user"
  value       = "You can now access the deployed application via the credentials above in format: username/password"
}

output "argocd_info" {
  description = "ArgoCD access information"
  value       = {
    url      = "http://${data.terraform_remote_state.infra.outputs.instance_public_ip}:30080/applications"
    user     = "admin"
    password = var.argocd_admin_password
  }
}