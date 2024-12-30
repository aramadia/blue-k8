FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port that the Flask app will run on
EXPOSE ${PORT}

# Set an environment variable for Flask
ENV FLASK_APP=main.py

# Run the Flask app when the container starts
# $PORT is set at runtime, if using [] in command, it will be treated as a string
# and thus won't be subsituted
SHELL ["/bin/bash", "-c"]
ENTRYPOINT flask run --host=0.0.0.0 --port=$PORT
