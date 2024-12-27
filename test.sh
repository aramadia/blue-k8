#!/usr/bin/env bash
set -eux

# build containers
docker build -t blue-editor blue-editor

# deploy them
kubectl apply -f blue.yaml

# wait for the new pod to be spun up
kubectl rollout restart deployment/blue-app -n blue || true
kubectl rollout status deployment/blue-app -n blue
# Wait for the service to be ready
kubectl wait --for=condition=available --timeout=60s deployment/blue-app -n blue
# Read the old value
curl localhost:81/read

# HTTP Put a new value
curl -X PUT -d "new valuea $(date '+%Y-%m-%d %H:%M:%S')" -H "Content-Type: text/plain" localhost:80/write

curl localhost:81/read