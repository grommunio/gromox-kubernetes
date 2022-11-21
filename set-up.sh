#!/bin/bash

echo 'This script assumes that you have a working kubernetes cluster, the kubectl context is set to it and helm v3 installed (all latest versions)' 

# Add helm repositories
helm repo add jitsi https://jitsi-contrib.github.io/jitsi-helm/
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Setup Grommunio Jitsi
#helm install \
#	gromox-meet jitsi/jitsi-meet \
#	-f video/video-values.yml

# Setup cert-manager
#helm install \
#  cert-manager jetstack/cert-manager \
#  --namespace cert-manager \
#  --version v1.10.0 \
#  --set installCRDs=true \
#  --create-namespace


kubectl apply -f db/db-config.yaml
kubectl apply -f admin-api/admin-plugins-config.yaml
kubectl apply -f admin-api/admin-links-config.yaml
kubectl apply -f redis/redis-config.yaml
kubectl apply -f redis/redis.yaml
kubectl apply -f db/db.yaml
kubectl apply -f certificates/test-certificate.yaml
kubectl apply -f general/general-config.yaml
kubectl apply -f general/nginx-config.yaml
kubectl apply -f general/gromox-services-config.yaml
sleep 60s
kubectl apply -f gromox/gromox.yaml
