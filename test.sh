#!/usr/bin/env bash
set -eux

# Assumes docker daemon is running, and kube kind cluster is running as well

# build containers
docker build -t blue-editor blue-editor

kind load docker-image blue-editor --name kind

# deploy them
kubectl apply -f blue.yaml
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml


# wait for the new pod to be spun up
kubectl rollout restart deployment/blue-app -n blue || true
kubectl rollout status deployment/blue-app -n blue
# Wait for the service to be ready
kubectl wait --for=condition=available --timeout=60s deployment/blue-app -n blue

# wait for ingress
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

sleep 2


# Read the old value
curl localhost:81/read

# HTTP Put a new value
curl -X PUT -d "new valuea $(date '+%Y-%m-%d %H:%M:%S')" -H "Content-Type: text/plain" localhost:80/write

curl localhost:81/read