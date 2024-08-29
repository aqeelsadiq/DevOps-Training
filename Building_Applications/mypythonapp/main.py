# script.py
import sys
from datetime import datetime
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    now = datetime.now()
    return f"Hello, World! Current date and time: {now}"

if __name__ == "__main__":
    app.run(host='localhost', port=5000)

