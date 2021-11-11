#!/bin/zsh
helm repo add prefecthq https://prefecthq.github.io/server/
helm repo update
NAMESPACE=customer_ns
NAME=prefect-server
helm install --namespace $NAMESPACE  $NAME prefecthq/prefect-server
