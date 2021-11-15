# stack-k8s

This repository will create a Kubernetes cluster with some tools installed 
via Helm and in addition it will use Ingress Controller to make sure the requests 
coming from outside the cluster are routed to the correct services.

## Tools

* [Minikube](https://minikube.sigs.k8s.io/) is used to create a local kubernetes cluster.
* [Prefect](https://prefect.io) is a data workflow orchestration tool.
* [Jupyterhub](https://jupyterhub.readthedocs.io) is a tool for running notebooks with multiple users.
* [Redis](https://redis.io/) is a scalable cache/message broker.

## Getting started

To run the cluster, make sure `minikube` is installed, and run the following sequence:
1. Create local minikube cluster
```shell
./start-scripts/1.start_minikube.sh
```

2. Install Prefect
```shell
./start-scripts/2.install_prefect.sh
```

3. Install Jupyterhub
```shell
./start-scripts/3.install_jupyterhub.sh
```

4. Install Redis
```shell
./start-scripts/4.install_redis.sh
```

5. Install Python App
```shell
cd python_app
./5.install_python_app.sh
cd ..
```

6. Install Ambassador
```shell
./start-scripts/6.install_ambassador.sh
```

7. Create Ambassador mappings
```shell
./start-scripts/6.install_ambassador.sh
```

8. Create port-forward for Ambassador service
```shell
kubectl port-forward -n customer-ns svc/emissary-ingress 8080
```

9. Reach services
Now services should be reachable under:
* Jupyterhub: `localhost:8080/jupyter`
* Python App: `localhost:8080/fastapi/docs`
* Apollo: `localhost:8080/graphql`
* Prefect: `localhost:8080/prefect` - Issue with connection