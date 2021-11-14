#!/bin/zsh
helm repo add prefecthq https://prefecthq.github.io/server/
helm repo update
NAMESPACE=customer-ns
NAME=prefect-server
helm install --create-namespace --namespace $NAMESPACE  $NAME prefecthq/prefect-server
