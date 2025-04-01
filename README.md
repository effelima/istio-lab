# Istio + Minikube Lab

A hands-on lab for learning Istio service mesh on a local Minikube Kubernetes cluster, featuring:
- Canary deployments
- Monitoring with Prometheus/Grafana
- Service mesh visualization with Kiali

## 📋 Prerequisites
- Docker ([Installation Guide](https://docs.docker.com/engine/install/))
- Minikube ([Installation Guide](https://minikube.sigs.k8s.io/docs/start/))
- kubectl ([Installation Guide](https://kubernetes.io/docs/tasks/tools/))

## Quick Start

### 1. Clone the repository
```bash
git clone https://github.com/your-username/istio-minikube-lab.git
cd istio-minikube-lab
```

### 2. Run the setup scripts
```bash
chmod +x scripts/*.sh
./scripts/01-setup-minikube.sh  # Starts Minikube cluster
./scripts/02-deploy-istio.sh    # Installs Istio service mesh
```

### 3. Deploy the sample application
```bash
kubectl apply -f manifests/
```

### 4. Access the application
```bash
minikube tunnel &  # Run in separate terminal
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export GATEWAY_URL=$(minikube ip):$INGRESS_PORT
echo "Access the Bookinfo app at: http://$GATEWAY_URL/productpage"
```

## 📊 Monitoring Tools
Access the monitoring dashboards:
```bash
istioctl dashboard kiali &       # Service mesh visualization
istioctl dashboard prometheus &  # Metrics collection
istioctl dashboard grafana &     # Monitoring dashboards
```

## 🧹 Cleanup
To completely remove the lab environment:
```bash
minikube delete
kubectl delete -f manifests/
```

## 📜 License
MIT License - See [LICENSE](LICENSE) for details.

---

### 🔍 Key Features Demonstrated
- **Istio Service Mesh**: Traffic management and observability
- **Canary Deployments**: Gradual rollout of new versions
- **Monitoring Stack**: Prometheus for metrics + Grafana visualization
- **Kiali**: Service mesh observability tool

---

### 💡 Learning Resources
- [Istio Documentation](https://istio.io/latest/docs/)
- [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)

---

To contribute or report issues, please open a GitHub issue or submit a pull request.