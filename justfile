# Default recipe (uncomment it)
# default:
#     @just --list

# Run test script (build, applies to cluster)
test:
    ./test.sh

# Build the Docker image
build:
    docker --debug  build -t blue-editor blue-editor 

# Run Docker container
run:
    docker run -e PORT=5000 -d blue-editor 

# Build and run in one command
up: build run




