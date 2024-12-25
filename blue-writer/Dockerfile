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
EXPOSE 5000

# Set an environment variable for Flask
ENV FLASK_APP=main.py

# Run the Flask app when the container starts
CMD ["flask", "run", "--host=0.0.0.0"]