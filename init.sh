#!/bin/sh

sudo killall nginx
sudo killall mysqld
sudo killall vsftpf

sudo usermod -aG docker $(whoami);

sudo service docker restart

minikube start --vm-driver=docker

eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
kubectl apply -f srcs/config/metallb.yaml > /dev/null
kubectl apply -f srcs/config/secret.yaml > /dev/null

services="nginx mariadb wordpress phpmyadmin"


for service in $services
do
    echo "BUILDING $service"
    docker build -t my_$service ./$service/.
    echo "DEPLOYING $service"
    kubectl apply -f ./$service/deploy_$service.yaml

done

minikube dashboard