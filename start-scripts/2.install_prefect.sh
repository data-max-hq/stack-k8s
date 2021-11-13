#!/bin/zsh
helm repo add prefecthq https://prefecthq.github.io/server/
helm repo update
NAMESPACE=customer-ns
NAME=prefect-server
kubectl create namespace $NAMESPACE
helm install --namespace $NAMESPACE  $NAME prefecthq/prefect-server
