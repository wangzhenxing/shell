#!/bin/bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
    && sudo install -o root -g wheel -m 4755 docker-machine-driver-hyperkit /usr/local/bin/

brew install kubernetes-cli

# install mac docker
echo "please install mac docker"
exit

# install minikube
#brew cask install minikube
#curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 && sudo install minikube-darwin-amd64 /usr/local/bin/minikube
curl -Lo minikube http://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/releases/v1.2.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

# set default driver
minikube config set vm-driver hyperkit

# install helm
brew install kubernetes-helm
helm init --history-max 200
helm init --upgrade -i registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.14.1 --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts

minikube delete
minikube start --registry-mirror=https://registry.docker-cn.com

#minikube dashboard

#Once started, you can interact with your cluster using kubectl, just like any other Kubernetes cluster. For instance, starting a server:
#kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.4 --port=8080
#Exposing a service as a NodePort
#kubectl expose deployment hello-minikube --type=NodePort
#minikube makes it easy to open this exposed endpoint in your browser:
#minikube service hello-minikube
#Start a second local cluster:
#minikube start -p cluster2
#Stop your local cluster:
#minikube stop
#Delete your local cluster:
#minikube delete


