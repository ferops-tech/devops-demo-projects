from flask import Flask
from prometheus_flask_exporter import PrometheusMetricsrun

app = Flask(__name__)
metrics = PrometheusMetrics(app)  # Auto /metrics + request tracking

@app.route('/')
def hello_geek():
    return '<h1>🚀 Hello from your DevOps Playground!</h1>'
