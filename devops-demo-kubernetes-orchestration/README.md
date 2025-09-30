# 🛳️️ DevOps Demo Project – Kubernetes & Helm

A hands-on **DevOps portfolio project** demonstrating containerized app deployment, Kubernetes orchestration, and Helm packaging in a fully reproducible workflow.

---

## Quick Start (Local with Minikube)

This guide shows how to deploy the Flask demo app on **Kubernetes** using raw manifests.  
Helm charts are also included in this repo for templated deployment.

### Prerequisites
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Git](https://git-scm.com/downloads)

Clone the repository and launch the Kubernetes pods:

```bash
git clone https://github.com/ferops-tech/devops-demo-projects.git
cd devops-demo-projects/devops-demo-kubernetes-orchestration/kubernetes/
kubectl apply -f ./
```
Get the dedicated minikube URL and open the link associated (try a different browser in case the default one doesn't render the page ):
```shell
 minikube service <SERVICE_NAME> --url    # svc-flask
```

## Full Deployment

For the full cloud deployment, see **[Deployment Guide](write the full deployment_guide later)**.

Highlights:

- Kubernetes ...
- Helm...
- Monitoring stack...

## Tech Stack


- **Orchestration:** Kubernetes
- **Packaging:** Helm
- **Monitoring:** ...
- .....

## Documentation

- **Deployment Guide:** **[docs/deployment_guide.md](write the full deployment_guide later)**
- **Kubernetes setup:** `kubernetes/` folder
- **Helm chart:** `helm/` folder
- **Monitoring stack:** `monitoring/` folder
- .....
