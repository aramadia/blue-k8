from flask import Flask
from flask import request

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/write', methods=['PUT'])
def post_string():
    
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
    app.run(debug=True)