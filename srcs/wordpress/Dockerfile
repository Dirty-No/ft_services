FROM alpine:latest

EXPOSE 5050

RUN apk update && apk upgrade

RUN apk add vim bash zsh git wget curl
 
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc

RUN printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc
RUN echo 'alias vi="vim"' >> ~/.zshrc

RUN apk add openrc
RUN openrc boot



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


################################ WORDPRESS ###############################################################################

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


ADD     ./tars/wordpress.tar.gz /
ADD     ./config/wp-config.php /wordpress


#RUN		mv config/wp-config.php /usr/share/nginx/html/wordpress/.

#ARG DB_IP="172.17.0.2:3306"
ARG DB_IP="mariadb-service:3306"
RUN sed -i  "s/DATABASE_IP_LABEL/${DB_IP}/g" /wordpress/wp-config.php

################################################################################################################3

RUN apk add netcat-openbsd

CMD php-fpm7 -R && nginx -g "daemon off;" && tail -f /dev/null	