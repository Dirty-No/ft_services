#!/bin/sh

sudo killall nginx
sudo killall mysqld
sudo killall vsftpf

sudo usermod -aG docker $(whoami);

sudo service docker restart

minikube start --vm-driver=docker

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
kubectl apply -f srcs/config/metallb.yaml > /dev/null
kubectl apply -f srcs/config/secret.yaml > /dev/null

docker build -t my_nginx ./nginx/.

kubectl apply -f nginx/deploy_nginx.yaml
minikube dashboard