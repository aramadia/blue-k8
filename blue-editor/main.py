from flask import Flask
from flask import request
import os
ENV_READER = "BLUE_READER"
ENV_WRITER = "BLUE_WRITER"

app = Flask(__name__)

def check_env():
    if ENV_READER in os.environ:
        print(f"Environment variable {ENV_READER} is set.")
    if ENV_WRITER in os.environ:
        print(f"Environment variable {ENV_WRITER} is set.")

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/read')
def read_data():
    if ENV_READER not in os.environ:
        return f"{ENV_READER} is not set.", 400
    
    data = "empty" 
    try:
        with open("data/data.txt", "r") as file:
            data = file.read()
    except FileNotFoundError:
        data = "Error: The file 'data.txt' does not exist."
    print(f"Read data: {data}")
    return data, 200


@app.route('/write', methods=['PUT'])
def post_string():
    if ENV_WRITER not in os.environ:
        return f"{ENV_WRITER} is not set.", 400
    
    if request.is_json:
        data = request.get_json()
    elif request.form:
        data = request.form
    else:
        data = request.get_data().decode()
    
    with open("data/data.txt", "w") as file:
        file.write(data)

    return f"Received data: {data}", 200

if __name__ == '__main__':
    check_env()
    app.run(debug=True)
