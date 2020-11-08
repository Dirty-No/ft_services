#!/bin/bash

init_setup()
{
    sudo killall nginx
    sudo killall mysqld
    sudo killall vsftpf

    sudo usermod -aG docker $(whoami);

    sudo service docker restart

    minikube delete
    minikube start --vm-driver=docker
}

install_metallb()
{
    eval $(minikube docker-env)
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
    kubectl apply -f srcs/config/metallb.yaml > /dev/null
    kubectl apply -f srcs/config/secret.yaml > /dev/null
}

deploy()
{
    eval $(minikube docker-env)
    for service in $1
    do
        echo "BUILDING $service"
        docker build -t my_$service ./$service/.
        echo "DEPLOYING $service"
        kubectl apply -f ./$service/deploy_$service.yaml

    done
}

delete()
{
    eval $(minikube docker-env)
    for service in $1
    do
        deployment="$service-deploy"
        service="$service-service"
        echo "DELETING $deployment"
        kubectl delete deployment "$deployment"
        echo "DELETING $service"
        kubectl delete service "$service"
    done
}

redeploy()
{
    delete "$1"
    deploy "$1"
}

setup_all()
{
    services="$1"

    init_setup
    eval $(minikube docker-env)
    deploy "$services"
    install_metallb

    minikube dashboard
}

nuke()
{
    eval $(minikube docker-env)
    minikube delete
    sudo docker system prune
}

print_error()
{
    PAD="%-7s"
    OPTIONS="deploy redeploy delete nuke"
    OPTIONS_FMT=""

    for opt in $OPTIONS
    do
        OPTIONS_FMT="$OPTIONS_FMT [-$opt]"
    done

    #OPTIONS_MSG=$(printf "$PAD%s" "Options:" "$OPTIONS_FMT")
    USAGE_MSG=$(printf "$PAD%s %s" "Usage:" "./init.sh" "$OPTIONS_FMT service_1 service_2 ...")
    ERR_MSG=$(printf "$PAD%s" "ERROR:" "$1")
    printf "%s.\n%s\n" "$ERR_MSG" "$USAGE_MSG"
}

main()
{
    ARGC=$#
    OPTIONS="deploy redeploy delete nuke"
    DEFAULT_SERVICES='nginx mariadb wordpress phpmyadmin ftps grafana'

    if [ $ARGC -eq 0 ]
        then
            setup_all "$DEFAULT_SERVICES"
            exit
    fi

    if [ $ARGC -lt 2 ]
        then
            print_error "Invalid arguments"
            exit
    fi

    OPT_FLAG=${1:0:1}
    SERVICES="${@:2}"

    if [ "$SERVICES" = "all" ]
    then
        SERVICES="$DEFAULT_SERVICES"
    fi

    if [ "$OPT_FLAG" = "-" ]
        then
            for opt in $OPTIONS
            do
                func=${1:1}
                if [ "$opt" =  "$func" ]
                    then
                        $func "$SERVICES"
                        exit
                fi
            done
        print_error "Unknown option '$1'"
        exit
    fi
    print_error "Unknown error."
}

main $@