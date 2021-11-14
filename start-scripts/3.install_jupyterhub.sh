#!/bin/zsh
NAMESPACE=customer-ns
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

RELEASE=jhub

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=1.2.0 \
  --values config_jupyterhub.yaml && \
kubectl rollout status  -n $NAMESPACE deployment/hub -w