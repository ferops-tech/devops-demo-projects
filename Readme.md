
---

# DevOps Demo Projects

Welcome to the DevOps Demo Projects repository, a hands-on showcase of end-to-end DevOps practices, 
from containerization and infrastructure-as-code to Kubernetes orchestration and cloud deployment.
This repository serves as a portfolio of practical, real-world projects demonstrating modern DevOps workflows,
tooling, and best practices.


---

# 🚀 Purpose

The goal of this repository is to **demonstrate practical DevOps skills in action**, including:

- Building and deploying containerized applications with **Docker**
- Provisioning cloud infrastructure with **Infrastructure-as-Code (Terraform)**
- Deploying and managing applications on **Kubernetes** clusters
- Observability with monitoring stacks **(Prometheus + Grafana)**
- Packaging and templating deployments with **Helm** 
- Leveraging **AWS services** for both virtual machines (EC2) and managed Kubernetes (EKS)
- Implementing **GitOps workflows** with ArgoCD for automated, declarative application deployment and continuous delivery

These projects are fully reproducible, making them ideal for experimentation, learning, and demonstrating practical DevOps capabilities.

---

# 📂 Projects Overview
### 1️⃣ Container Deployment Demo

A hands-on project showcasing **end-to-end deployment of a Dockerized Flask application on AWS**.

Highlights:

- Docker containerization of a Python Flask app
- AWS infrastructure provisioning with Terraform
- Integration of Prometheus + Grafana for monitoring and observability


[Detailed Container Deployment Demo README](./demo-container-deploy)

---

### 2️⃣ Kubernetes Orchestration Demo

A practical demonstration of **deploying and managing applications on Kubernetes**, including cloud deployment on Amazon EKS.

Highlights:

- Kubernetes manifests for deploying a Flask app both locally and on EKS
- Helm chart packaging for reusable, configurable deployments
- EKS cluster setup with AWS Load Balancer (ALB) and Ingress configuration

[Detailed Kubernetes Orchestration Demo README](./demo-kubernetes-orchestration)

---


### 3️⃣ GitOps Setup with ArgoCD

A demo project illustrating the setup of a full **CI/CD pipeline** using from GitHub Actions.

Highlights:

- AWS infrastructure provisioning using Terraform, including bootstrap deployment of ArgoCD.  
- Deployment of the Flask application via ArgoCD applications using Terraform
- CI/CD integration with GitHub Actions to automatically build images and sync changes to the cluster

[Detailed GitOps project](./demo-gitops-argocd)

---


# ⚙️ Tech Stack

- **Application:** Python (Flask)
- **Containerization:** Docker
- **Orchestration:** Kubernetes, Helm
- **Infrastructure-as-Code:** Terraform
- **Cloud:** AWS (EC2 & EKS)
- **Monitoring & Observability:** Prometheus, Grafana
- **Version Control:** Git & GitHub

---

# 📚 Getting Started

1. Clone the repository:
```shell
git clone https://github.com/ferops-tech/devops-demo-projects.git
```
2. Navigate to the desired project folder
3. Follow the respective README.md or deployment guide for instructions

---

# 🎯 Who is this for?

This repository is perfect for:

- **DevOps engineers** exploring ready-to-run project examples
- **Developers** exploring cloud and infrastructure tools in action
- **Students or professionals** playing with containerization, Kubernetes, IaC, and GitOps workflows

---

# 📌 Notes

- All cloud resources incur costs if deployed — always clean up after testing.
- Monitoring dashboards and app interfaces are accessible via publicly exposed IPs when deployed in the cloud.

---

This repository is maintained by FerOps.Tech as a practical showcase of modern DevOps workflows and projects.

---