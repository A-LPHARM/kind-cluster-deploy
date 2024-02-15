#!/bin/bash

# Set the name of the Kind cluster
CLUSTER_NAME="kubernetes"

# Create a Kind cluster
kind create cluster --name $CLUSTER_NAME --config kube-conf.yaml

# Set KUBECONFIG environment variable
export KUBECONFIG="~/.kube/config"

# Wait for the cluster to be ready
kubectl wait --for=condition=Ready node --all --timeout=300s

#to get information on the clusters
kubectl cluster-info --context kind-kubernetes

echo "Kind cluster $CLUSTER_NAME is now deployed and ready."
