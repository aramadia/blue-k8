#!/usr/bin/env bash
set -euxo pipefail

# build containers
docker build -t blue-reader blue-reader
docker build -t blue-writer blue-writer

# deploy them
kubectl apply -f blue.yaml

# wait for the new pod to be spun up
kubectl rollout restart deployment/blue-app
kubectl rollout status deployment/blue-app

# Read the old value
curl localhost:81/read

# HTTP Put a new value
curl -X PUT -d "new value" -H "Content-Type: text/plain" localhost:80/write

curl localhost:81/read