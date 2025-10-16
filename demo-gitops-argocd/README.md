# 🤖 Demo Gitops Setup

A hands-on DevOps portfolio project demonstrating a complete GitOps workflow using GitHub Actions, ArgoCD, and Helm to automate the deployment of a containerized application on a Kubernetes cluster.  
For the sake of simplicity, the Kubernetes deployment uses **k3d** instead of **Kubernetes** or **k3s**, providing a lightweight multi-node setup within a single VM, ideal for local testing and demo.

---

## Quick Start (Local with k3d)

Create the local cluster:
```shell
k3d cluster create demo-devops -p "8080:80@loadbalancer"
```

Clone the repository and deploy the application using `helm`:
```bash
git clone https://github.com/ferops-tech/devops-demo-projects.git
cd devops-demo-projects/demo-kubernetes-orchestration/helm/flask-app/
helm install -n flask-ns demo-devops . -f ./values-local-k3d.yaml --create-namespace
```

Access the app in your browser: [http://127.0.0.1:8080](http://127.0.0.1:8080)


## Full Deployment

For the full cloud setup, see **[Deployment Guide](./docs/deployment_guide.md)**.

Highlights:

- **Helm** chart packages and deploys the application, configurable for k3d cluster.
- **GitHub** Actions CI builds the Docker image from the app repository and pushes it to Docker Hub.
- **ArgoCD** automatically synchronizes the infrastructure repository and deploys updates to the Kubernetes cluster.
- **Terraform** provisions cloud resources (EC2 instances) and bootstraps ArgoCD for reproducible deployments.
- The setup demonstrates a complete GitOps workflow, from code commit to automated deployment.

## Tech Stack

- Containerization: **Docker, Helm**
- Cloud / IaC: **AWS, Terraform, k3s**
- Continuous Delivery: **ArgoCD**
- CI/CD: **GitHub Actions**

## Documentation

- **Deployment Guide:** **[docs/deployment_guide.md](./docs/deployment_guide.md)**
- **ArgoCD:** `argocd/` folder
- **Terraform:** `terraform/` folder
- **Helm chart:** `../demo-kubernetes-orchestration/helm/flask-app` folder
- **Github Actions:** `../.github/workflows/`
