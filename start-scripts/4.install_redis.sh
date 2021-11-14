#!/bin/zsh
NAMESPACE=customer-ns
NAME=redis-test
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install --create-namespace --namespace $NAMESPACE \
 --set persistence.storageClass=nfs-client,redis.replicas.persistence.storageClass=nfs-client \
 --set volumePermissions.enabled=true \
 $NAME bitnami/redis

export REDIS_PASSWORD=$(kubectl get secret --namespace $NAMESPACE redis-test -o jsonpath="{.data.redis-password}" | base64 --decode)
#kubectl run --namespace $NAMESPACE redis-client --restart='Never'  --env REDIS_PASSWORD=$REDIS_PASSWORD  --image docker.io/bitnami/redis:6.2.5-debian-10-r63 --command -- sleep infinity
#kubectl exec --tty -i redis-client --namespace $NAMESPACE -- bash