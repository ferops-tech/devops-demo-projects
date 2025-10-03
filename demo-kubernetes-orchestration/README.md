# 🛳  DevOps️ Demo Project -- Kubernetes Orchestration

A hands-on **DevOps portfolio project** demonstrating the deployment of an application on Kubernetes, with Helm packaging for reusable and configurable deployments, and a complete deployment worflow to the cloud using Amazon EKS.

---

## Quick Start (Local with Minikube)

Start the cluster setup with minikube:
```shell
minikube start --driver=vfkit
```

Clone the repository and launch resources on the local Kubernetes:
```bash
git clone https://github.com/ferops-tech/devops-demo-projects.git
cd devops-demo-projects/devops-demo-kubernetes-orchestration/kubernetes/
kubectl apply -f ./
```

Review the running pod and service:
```shell
kubectl get pods
kubectl get svc
```

Get the dedicated Minikube URL (open the link in your browser. If the default one does not render, try another one):
```shell
 minikube service <SERVICE_NAME> --url    # svc-flask
```

## Full Deployment

For the full cloud deployment, see **[Deployment Guide](./docs/deployment_guide.md)**.

Highlights:

- Helm chart for Flask application, parameterized for local & EKS
- Kubernetes manifests for direct deployment
- EKS cluster setup with IngressClass configured for AWS load balancer (ALB)
- Ingress configuration exposing the app
- Monitoring stack deployed from official Helm charts

## Tech Stack


- **Application:** Python (Flask)
- **Orchestration:** Kubernetes
- **Packaging / Templates:** Helm
- **Cloud:** AWS EKS
- **Monitoring:** Prometheus + Grafana
- **Version Control:** Git, GitHub

## Documentation

- **Deployment Guide:** **[docs/deployment_guide.md](./docs/deployment_guide.md)**
- **Kubernetes manifests:** `kubernetes/` folder
- **Helm chart:** `helm/` folder
- **EKS setup:** `eks/` folder