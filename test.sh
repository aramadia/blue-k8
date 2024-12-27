#!/usr/bin/env bash
set -euxo pipefail

# build containers
docker build -t blue-reader blue-reader
docker build -t blue-writer blue-writer

# deploy them
kubectl apply -f blue.yaml

# wait for the new pod to be spun up
kubectl rollout status deployment/blue-app
