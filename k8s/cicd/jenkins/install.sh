#!/bin/bash

set -e -x

kubectl create namespace kube-ops

kubectl create -f cicd-jenkins-pvc.yaml

kubectl create -f cicd-jenkins-rbac.yaml

kubectl create -f cicd-jenkins-deployment.yaml

kubectl create -f cicd-jenkins-ingress.yaml
