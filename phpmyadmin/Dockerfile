FROM alpine:latest

########################################## init ############################################################3
#
#RUN apk update && apk upgrade
#
#RUN apk add vim
#RUN echo 'alias vi="vim"' >> ~/.zshrc 
#RUN printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc
#
#RUN apk add bash zsh
#RUN apk add git wget curl
#RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc
#
#RUN apk add openrc
#RUN openrc boot
#
#
###########################################################################################################


############################################ PHPMYADMIN ###################################################

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#ARG     database_ip="172.17.0.2"
ARG     database_ip="mariadb-service"

ARG     database_port="3306"
ARG     pma_path="/phpMyAdmin"

ADD     ./tars/phpMyAdmin.tar.gz /
ADD     ./config/config.inc.php ${pma_path}
RUN     sed -i "s/_DATABASE_IP_LABEL_/${database_ip}/g" ${pma_path}/config.inc.php
RUN     sed -i "s/_DATABASE_PORT_LABEL_/${database_port}/g" ${pma_path}/config.inc.php


###########################################################################################################

ENV SERVICE_PORTS="8080"

#RUN echo "php -S 0.0.0.0:$SERVICE_PORTS -t /phpMyAdmin &" > init.sh

#CMD ifconfig | grep inet && echo "PORTS: $SERVICE_PORTS" && sh init.sh && tail -f /dev/null
#CMD ifconfig | grep inet && php -S 0.0.0.0:8080 -t ${pma_path}
CMD tail -f /dev/null
#php -S 0.0.0.0:8080 -t ${pma_path}
