#!/usr/bin/bash

helm install plex ./kube-plex/charts/kube-plex \
    --values values.yaml \
    --namespace media