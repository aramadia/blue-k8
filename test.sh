#!/usr/bin/env bash
set -eux

# build containers
docker build -t blue-reader blue-reader
docker build -t blue-writer blue-writer

# deploy them
kubectl apply -f blue.yaml

# wait for the new pod to be spun up
kubectl rollout restart deployment/blue-app -n blue || true
kubectl rollout status deployment/blue-app -n blue

# Read the old value
curl localhost:81/read

# HTTP Put a new value
curl -X PUT -d "new valuea" -H "Content-Type: text/plain" localhost:80/write

curl localhost:81/read