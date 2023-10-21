# Deployment instructions

Now that everything has been prepared and our k3s cluster is now ready, we can deploy our applications.
First, to prevent any security issue when exposing our services, we will deploy an OpenVPN server to access our cluster
and our local network in the meantime. You can find all the deployment configuration in the `./k3s/openvpn` folder.

The procedure will remain the same for all the applications, so I will only explain it once.

## Deploying an application

To deploy an application, we will use the `kubectl` command line tool. It is the official tool to manage a Kubernetes
cluster.

To deploy an application, we need to use the `kubectl apply` command with the `-f` flag to specify the configuration
file to use.

```shell
kubectl apply -f ./k3s/wireguard
```

This command will deploy the OpenVPN server on our cluster. To access it, we need to retrieve the IP address of the
service. To do so, we can use the `kubectl get` command with the `-o wide` flag to get more details about the service.

```shell
kubectl get service wireguard -o wide
```

This command will return something like this:

```shell
NAME      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE   SELECTOR
wireguard   LoadBalancer   10.43.117.209                 1194:30000/TCP 2d    app=wireguard
```

To delete an application, we can use the `kubectl delete` command with the `-f` flag to specify the configuration
file to use.

```shell
kubectl delete -f ./k3s/wireguard
```

This should be enough to deploy and manage our applications on our cluster.