from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_geek():
    return '<h1>🚀 Hello from your DevOps Playground!</h1>'

