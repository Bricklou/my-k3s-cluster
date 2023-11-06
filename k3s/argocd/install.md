# Install ArgoCD

First, create the namespace and apply the manifests:

```shell
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Alter the configmap:
    
```shell
kubectl patch --patch-file manifests/configmap-patch.yaml -n argocd configmap argocd-cmd-params-cm
```

Then create the ingress controller:

```shell
kubectl apply -f manifests/ingress.yaml
```

And configure the admin password:

```shell
argocd admin init-password
```

Finally, install the image updater:
    
```shell
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/v0.12.2/manifests/install.yaml
```