Works on orbstack direct cluster, or using k3s on orbstack linux vms

orbstack direct
- don't need to push (use local docker images blue-reader:latest)
- set IfNotPresent for pull policy

K3
- push to dockerhub (aramadia/blue-reader:latest)
- set to always for latest pull


PV

Post to /write endpoint

kubectl logs pod/blue-app-6f898d987-mrzqx -c blue-reader -f

Delete app


# Act attempts


- FIgure out how to connect to daemon socket locally (use sudo chmod)
- Local provsioner - called standard instead of local-path and uses ReadWriteOnce (without pod)
- FIgure out registry or how to load images into kind.  Turns out I can just use kind to load them directly.

```
https://nektosact.com/missing_functionality/docker_context.html
export DOCKER_HOST=$(docker context inspect --format '{{.Endpoints.docker.Host}}')

act -P macos-latest=-self-hosted


act -j create-cluster --privileged -s docker-in-docker --container-architecture linux/amd64



❯ /usr/local/bin/node /var/run/act/actions/helm-kind-action@v1/main.js
Adding kind directory to PATH...
/run/act/actions/helm-kind-action@v1/kind.sh: line 75: GITHUB_PATH: unbound variable


armadia@dmini ~/s/blue-k8 (master)> docker context ls
NAME         DESCRIPTION                               DOCKER ENDPOINT                                   ERROR
default      Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                       
orbstack *   OrbStack                                  unix:///Users/armadia/.orbstack/run/docker.sock   


      --container-daemon-socket string                    URI to Docker Engine socket (e.g.: unix://~/.docker/run/docker.sock or - to disable bind mounting the socket)

--container-daemon-socket


kind create cluster --config=kind-cluster.yaml

```