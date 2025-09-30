import os
from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)  # Auto /metrics + request tracking

@app.route('/')
def hello_world():
    version = os.getenv("APP_VERSION")  # no default
    if version:
        version_text = f" Version {version}"
    else:
        version_text = ""
    return f'<h1>🚀 Hello from your DevOps Playground!{version_text}</h1>'