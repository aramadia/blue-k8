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