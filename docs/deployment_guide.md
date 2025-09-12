# Deployment Guide

## Docker Setup
### a. App Containerisation & Local Run
###### _From the project root_

```shell
docker build -f docker/Dockerfile -t flask-app .
```

---

### b. Run the Container

Run the container locally to verify it works:

```shell
docker run -ti -p 8080:5000 flask-app
```

- The container should start, and you’ll see an interactive prompt or logs confirming it’s running.
- Open your browser: [http://localhost:8080](http://localhost:8080)
- **Stop the container** by pressing `Ctrl+C` when done.

---

### c. Pull from Remote Repository

The app image has been pushed to Docker Hub and is publicly available.  
You can run it directly from the repository:

```shell
docker run -ti -p 8080:5000 feropstech/flask-app:latest
```

- The container should pull the image and start, just like the local build.

## Terraform Setup
 ...

## Monitoring Setup
 ...