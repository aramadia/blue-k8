from flask import Flask
from flask import request

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/read')
def read_data():
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