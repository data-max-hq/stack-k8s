#!/bin/zsh
helm repo add datawire https://app.getambassador.io
helm repo update
NAMESPACE=customer-ns
helm upgrade --install -n $NAMESPACE --create-namespace \
    emissary-ingress --devel \
    --set createDefaultListeners=true \
    datawire/emissary-ingress && \
kubectl rollout status  -n $NAMESPACE deployment/emissary-ingress -w