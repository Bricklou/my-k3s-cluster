# Database management

Kubernetes is not made to run databases, or at least, not without using custom resources. Even running them through
StatefulSets is not recommended, as it is not made for this. Here is a good video explaining why:
https://www.youtube.com/watch?v=Ny9RxM6H6Hg.

As the video will probably give you some hint, yes, will use CloudNative PG (CNPG) to run our PostgreSQL database. CNPG is
an open-source Kubernetes operator designed to manage PostgreSQL workloads on any supported Kubernetes cluster.
It covers the full lifecycle of a highly available PostgreSQL database cluster with a primary/standby architecture, using
native streaming replication.

## Deploy CNPG

First, we need to deploy CNPG. To do so, we will use the Helm chart provided by the CNPG team.

```shell
helm repo add cnpg https://cloudnative-pg.github.io/charts
helm repo update
```

Then, we will create a namespace for CNPG and deploy it.

```shell
helm upgrade --install cnpg \
  --namespace cnpg-system \
  --create-namespace \
  --values ../k3s/cloudnative-pg/values.yaml \
  cnpg/cloudnative-pg
```
