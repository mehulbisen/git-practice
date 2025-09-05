from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def home():
    return f"""
    <html>
      <head><title>Simple App</title></head>
      <body>
        <h1>Hello from EKS!</h1>
        <p>This web app is running inside a pod on Kubernetes.</p>
        <p>Served from: {socket.gethostname()}</p>
      </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
