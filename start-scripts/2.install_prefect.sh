#!/bin/zsh
helm repo add prefecthq https://prefecthq.github.io/server/
helm repo update
NAMESPACE=customer-ns
NAME=prefect-server
helm install --create-namespace --namespace $NAMESPACE  $NAME prefecthq/prefect-server \
  --set jobs.createTenant.enabled=true \
  --set apollo.ingress.ingressClassName=ambassador \
  --set ui.ingress.ingressClassName=ambassador \
  --set ui.apolloApiUrl=http://localhost:8080/graphql && \
kubectl rollout status  -n $NAMESPACE deployment/prefect-server-ui -w && \
kubectl rollout status  -n $NAMESPACE deployment/prefect-server-apollo -w && \
kubectl rollout status  -n $NAMESPACE deployment/prefect-server-graphql -w
