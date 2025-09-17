# 💻 DevOps Demo Project

A hands-on DevOps demo project showcasing containerization, infrastructure-as-code, and monitoring.  
Includes a Python app, Docker setup, Terraform scripts, and Prometheus/Grafana monitoring.

---

## Quick Start

Clone the repository and run the app:

```shell
git clone https://github.com/feropstech/devops-demo-projects.git
cd devops-demo-projects
docker build -f docker/Dockerfile -t flask-app .
docker run -ti -p 8080:5000 flask-app
```

Open [http://localhost:8080](http://localhost:8080) in your browser to see the app.

**Docker Hub link**: [feropstech/flask-app](https://hub.docker.com/r/feropstech/flask-app)

---

For full deployment instructions, see **[Deployment Guide](docs/deployment_guide.md)**.






