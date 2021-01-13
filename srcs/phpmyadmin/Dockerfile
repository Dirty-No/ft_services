FROM alpine:latest
RUN apk update && apk upgrade

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


########################################## nginx ##########################################################

RUN apk add nginx openssl

ARG nginx_path='/etc/nginx'
ARG nginx_config_path="${nginx_path}/conf.d"
ARG nginx_run='/run/nginx'
ENV nginx_html="/var/lib/nginx/html"
ARG nginx_ssl="${nginx_path}/ssl"
ARG ssl_key="${nginx_ssl}/nginx-selfsigned.key"
ARG ssl_cert="${nginx_ssl}/nginx-selfsigned.crt"
ARG nginx_conf="${nginx_config_path}/default.conf"

RUN mkdir -p ${nginx_run}
RUN mkdir -p ${nginx_ssl}
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout ${ssl_key} -out ${ssl_cert}
RUN rm /var/lib/nginx/html/index.html
ADD config/default.conf ${nginx_conf}

##########################################################################################################


############################################ PHPMYADMIN ###################################################

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


#RUN yes 'pass' | adduser -D -g 'www' www

#RUN mkdir /www
#RUN chown -R www:www /var/lib/nginx
#RUN chown -R www:www /www
#RUN chown -R www:www $nginx_html


#ENV PHP_FPM_USER="www"
#ENV PHP_FPM_GROUP="www"
#ENV PHP_FPM_LISTEN_MODE="0660"
#ENV PHP_MEMORY_LIMIT="512M"
#ENV PHP_MAX_UPLOAD="50M"
#ENV PHP_MAX_FILE_UPLOAD="200"
#ENV PHP_MAX_POST="100M"
#ENV PHP_DISPLAY_ERRORS="On"
#ENV PHP_DISPLAY_STARTUP_ERRORS="On"
#ENV PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR"
#ENV PHP_CGI_FIX_PATHINFO=0
#
#
#RUN sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = ${PHP_FPM_USER}|g" /etc/php7/php-fpm.d/www.conf \
#&& sed -i "s|;listen.group\s*=\s*nobody|listen.group = ${PHP_FPM_GROUP}|g" /etc/php7/php-fpm.d/www.conf \
#&& sed -i "s|;listen.mode\s*=\s*0660|listen.mode = ${PHP_FPM_LISTEN_MODE}|g" /etc/php7/php-fpm.d/www.conf \
#&& sed -i "s|user\s*=\s*nobody|user = ${PHP_FPM_USER}|g" /etc/php7/php-fpm.d/www.conf \
#&& sed -i "s|group\s*=\s*nobody|group = ${PHP_FPM_GROUP}|g" /etc/php7/php-fpm.d/www.conf \
#&& sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" /etc/php7/php-fpm.d/www.conf
#
#RUN sed -i "s|display_errors\s*=\s*Off|display_errors = ${PHP_DISPLAY_ERRORS}|i" /etc/php7/php.ini \
#&& sed -i "s|display_startup_errors\s*=\s*Off|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS}|i" /etc/php7/php.ini \
#&& sed -i "s|error_reporting\s*=\s*E_ALL & ~E_DEPRECATED & ~E_STRICT|error_reporting = ${PHP_ERROR_REPORTING}|i" /etc/php7/php.ini \
#&& sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php7/php.ini \
#&& sed -i "s|;*upload_max_filesize =.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|i" /etc/php7/php.ini \
#&& sed -i "s|;*max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|i" /etc/php7/php.ini \
#&& sed -i "s|;*post_max_size =.*|post_max_size = ${PHP_MAX_POST}|i" /etc/php7/php.ini \
#&& sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|i" /etc/php7/php.ini
#
#


#ARG     database_ip="172.17.0.2"
ARG     database_ip="mariadb-service"

ARG     database_port="3306"
ENV     pma_path="$nginx_html/phpmyadmin"

ADD     ./tars/phpmyadmin.tar.gz $nginx_html
ADD     ./config/config.inc.php ${pma_path}/
ADD		./config/www.conf /etc/php7/php-fpm.d/

RUN     sed -i "s/_DATABASE_IP_LABEL_/${database_ip}/g" ${pma_path}/config.inc.php
RUN     sed -i "s/_DATABASE_PORT_LABEL_/${database_port}/g" ${pma_path}/config.inc.php

#ENV     PMA_ABSOLUTE_URI="/phpmyadmin/"

###########################################################################################################

ENV SERVICE_PORTS="5000"

#RUN echo "php -S 0.0.0.0:$SERVICE_PORTS -t /phpMyAdmin &" > init.sh

#CMD ifconfig | grep inet && echo "PORTS: $SERVICE_PORTS" && sh init.sh && tail -f /dev/null
#CMD ifconfig | grep inet && php -S 0.0.0.0:5000 -t ${pma_path}
#CMD tail -f /dev/null
#CMD php -S 0.0.0.0:$SERVICE_PORTS -t ${pma_path}





CMD php-fpm7 -R && nginx -g "daemon off;" && tail -f /dev/null	
