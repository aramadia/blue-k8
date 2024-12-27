# Default recipe (uncomment it)
# default:
#     @just --list

test:
    ./test.sh

# Build the Docker image
build:
    docker build -t blue-editor blue-editor

# Run Docker container
run:
    docker run -d blue-editor

# Build and run in one command
up: build run




