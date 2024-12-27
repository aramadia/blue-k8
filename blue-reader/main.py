from flask import Flask
from flask import request
import os
env_var_name = "BLUE_READER"


app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/read')
def read_data():
    if env_var_name not in os.environ:
        return f"{env_var_name} is not set.", 400
    
    data = "empty" 
    try:
        with open("data/data.txt", "r") as file:
            data = file.read()
    except FileNotFoundError:
        data = "Error: The file 'data.txt' does not exist."
    print(f"Read data: {data}")
    return data, 200

if __name__ == '__main__':
    app.run(debug=True)