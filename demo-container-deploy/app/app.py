import os
from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)  # Auto /metrics + request tracking

@app.route('/')
def hello_world():
    version = os.getenv("APP_VERSION")
    playground = os.getenv("K8S")

    if version:
        version_text = f" Version {version}"
        return f'<h1>☸️ Hello from your K8s Playground!{version_text}</h1>'
    elif playground == "K8S":
        return f'<h1>☸️ Hello from your K8s Playground!</h1>'
    elif playground == "K3D":
        return f'<h1>🤖️ Hello from your K3d Playground!</h1>'
    else:
        return f'<h1>🚀 Hello from your DevOps Playground!</h1>'
