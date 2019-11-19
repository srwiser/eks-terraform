#!/bin/bash

read -p "EKS cluster name : " cluster_name
mkdir -p ~/.kube
terraform output kubeconfig > ~/.kube/$cluster_name
export KUBECONFIG=~/.kube/$cluster_name

terraform output config-map > config-map-aws-auth.yaml
kubectl apply -f config-map-aws-auth.yaml

## Deploy Kubernetes Dashboard ##
kubectl apply -f kube-dashboard/dashboard.yaml

## Create Eks Admin Account ###
kubectl apply -f kube-dashboard/eks-admin-service-account.yaml

### Connect To Dashboard ###
kubectl proxy --port=8001 --address=0.0.0.0 --disable-filter=true &
### Generate Login Token ###
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')

## Optional Install Heapster ##
while true; do
    read -p "Do you wish to install heapster ?" yn
    case $yn in
        [Yy]* ) kubectl apply -f kube-dashboard/heapster.yaml;kubectl apply -f kube-dashboard/heapster-rbac.yaml;kubectl apply -f kube-dashboard/influxdb-backend.yaml break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
