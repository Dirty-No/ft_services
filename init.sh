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
    kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

    minikube dashboard
}

reset()
{
    eval $(minikube docker-env)
    minikube delete
    main 
}

nuke()
{
    eval $(minikube docker-env)
    reset
    sudo docker system prune
}

print_error()
{
    PAD="%-7s"
    OPTIONS="deploy redeploy delete reset nuke shell"
    OPTIONS_FMT=""

    for opt in $OPTIONS
    do
        OPTIONS_FMT="$OPTIONS_FMT [$opt]"
    done

    #OPTIONS_MSG=$(printf "$PAD%s" "Options:" "$OPTIONS_FMT")
    USAGE_MSG=$(printf "$PAD%s %s" "Usage:" "./init.sh" "$OPTIONS_FMT service_1 service_2 ...")
    ERR_MSG=$(printf "$PAD%s" "ERROR:" "$1")
    printf "%s.\n%s\n" "$ERR_MSG" "$USAGE_MSG"
}

first()
{
    echo "$1"
}

shell()
{
    POD=$(first $(kubectl get pods | grep "$1"))
    echo "Opening shell in pod $POD:"
    kubectl exec -it "$POD" -- sh
}

stress()
{
    ip="172.17.0.2"
    services="nginx mariadb wordpress phpmyadmin ftps grafana influxdb"
    ports=("80" "3306" "5050" "5000" "21" "3000" "8086")

    count=0
    while [ 1 ]
    do
        index=0
        line_count=2
        printf "STRESS TEST ON %s:\n\n" "$@"
        for service in $services
        do
            flag=$(echo "$@" | grep -o "$service")
            if [ ! -z "$flag" ]
            then
                let "count+=1"
                let "line_count+=1"
                if [ "$service" = "influxdb" ] || [ "$service" = "mariadb" ]
                then 
                    CONTAINER=$(first $(kubectl get pods | grep "nginx"))
                    printf "\t- SENDING HTTP REQUEST %d TO %-10s AT %s:%d FROM $CONTAINER\n" "$count" "$service" "$service-service" "${ports[$index]}"
                    kubectl exec -t $CONTAINER -- wget $service-service:${ports[index]} > /dev/null 2>&1 &
                else
                    printf "\t- SENDING HTTP REQUEST %d TO %-10s AT %s:%d\n" "$count" "$service" "$ip" "${ports[$index]}"
                    curl -s -L $ip:${ports[index]} --insecure > /dev/null &
                fi

            fi
            let "index+=1"
        done
        tput cuu "$line_count"
    done
}

main()
{
    ARGC=$#
    OPTIONS="deploy redeploy delete reset nuke shell stress"
    DEFAULT_SERVICES='nginx mariadb wordpress phpmyadmin ftps grafana influxdb'

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

    SERVICES="${@:2}"

    if [ "$SERVICES" = all ]
    then
        SERVICES="$DEFAULT_SERVICES"
    fi

    for opt in $OPTIONS
    do
        func=$1
        if [ "$opt" =  "$func" ]
            then
                $func "$SERVICES"
                exit
        fi
    done

    print_error "Invalid arguments."
}

main $@
