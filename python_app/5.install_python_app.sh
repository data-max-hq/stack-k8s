minikube image build -t test-fastapi:0.1 . && \
helm upgrade --install --create-namespace --namespace customer-ns fastapi chart