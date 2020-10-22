#!/bin/sh

sudo killall nginx
sudo killall mysqld
sudo killall vsftpf

sudo usermod -aG docker $(whoami);

minikube start --vm-driver=docker