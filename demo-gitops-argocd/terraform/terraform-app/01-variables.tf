variable "app_name" {
  description = "Name of the ArgoCD application"
  type        = string
  default     = "demo-devops-flask-app"
}

variable "app_namespace" {
  description = "Namespace to deploy the app into"
  type        = string
  default     = "flask-ns"
}

variable "repo_url" {
  description = "Git repository URL containing the Helm chart"
  type        = string
  default     = "https://github.com/ferops-tech/devops-demo-projects.git"
}

variable "repo_branch" {
  description = "Git branch to track"
  type        = string
  default     = "gitops"
}

variable "chart_path" {
  description = "Path in repo to Helm chart"
  type        = string
  default     = "demo-kubernetes-orchestration/helm/flask-app"
}

variable "values_file" {
  description = "Path in repo to Helm values file"
  type        = string
  default     = "values-local-k3d.yaml"
}

variable "ingress_class_name" {
  description = "Ingress class name to pass to Helm"
  type        = string
  default     = "traefik"
}

variable "argocd_admin_password" {
  description = "Enter the password of the ArgoCD 'admin' user"
  type        = string
  sensitive   = false
}