# 💻 DevOps Demo Project

A hands-on **DevOps portfolio project** demonstrating end-to-end deployment, infrastructure-as-code, containerization, and observability in a fully reproducible workflow.

---

## Quick Start (Local)

Clone the repository and run the app locally:

```bash
git clone https://github.com/ferops-tech/devops-demo-projects.git
cd devops-demo-projects/demo-container-deploy/app
docker build -t flask-app .
docker run -ti -p 8080:5000 flask-app
```

Open [http://localhost:8080](http://localhost:8080) in your browser to see the app.

**Docker Hub link**: [feropstech/flask-app](https://hub.docker.com/r/feropstech/flask-app)

## Full Deployment

For the full cloud deployment, see **[Deployment Guide](docs/deployment_guide.md)**.

Highlights:

- Terraform provisions AWS resources: VPC, subnet, internet gateway, security groups, and EC2 instance.
- EC2 runs the Dockerized Flask app via bootstrap script or manual launch.
- Monitoring stack (Prometheus + Grafana) visualizes metrics from the Flask app.

## Tech Stack

- **Language / Framework:** Python (Flask)
- **Containerization:** Docker
- **Cloud / IaC:** AWS, Terraform
- **Monitoring:** Prometheus, Grafana
- **Version Control:** Git, GitHub

## Documentation

- **Deployment Guide:** **[docs/deployment_guide.md](docs/deployment_guide.md)**
- **Docker setup:** `docker/` folder
- **Terraform scripts:** `terraform/` folder
- **Monitoring stack:** `monitoring/` folder
