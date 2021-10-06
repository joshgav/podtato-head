# Install with k3d

## Prerequisites

- Install k3d ([official docs](https://k3d.io/#installation))


```bash
k3d cluster create --config k3d.yaml
```

Please go to the [Ketch Releases](https://github.com/shipa-corp/ketch/releases) page to download the CLI for your OS.

Ketch assumes that Cert Manager, Ingress, and Ketch controller are installed.

Install Cert Manager, Istio, Cluster Issuer, and Ketch Controller:

**NOTE: If you do not already have `istioctl`, the binary can be downloaded from the [releases](https://github.com/istio/istio/releases).*

```bash
kubectl apply \
    --filename https://github.com/jetstack/cert-manager/releases/download/v1.0.3/cert-manager.yaml \
    --validate=false

istioctl install --skip-confirmation

kubectl apply --filename cluster-issuer.yaml

kubectl apply --filename https://github.com/shipa-corp/ketch/releases/download/v0.2.1/ketch-controller.yaml
```

Retrieve the IP of the load balancer that will be used to auto-generate addresses of the applications.

Please execute the command that follows if you are using a **local k3d cluster** (as in the example above).

```bash
export INGRESS_IP=127.0.0.1
```

Otherwise, if you are using a **remove cluster**, please execute the command that follows.

*NOTE: Some Kubernetes clusters (e.g., AWS EKS) might be providing `hostname` instead of the `ip`. If that's the case, please modify the command that follows accordingly.*

```bash
export INGRESS_IP=$(kubectl --namespace istio-system get service istio-ingressgateway --output jsonpath="{.status.loadBalancer.ingress[0].ip}")
```