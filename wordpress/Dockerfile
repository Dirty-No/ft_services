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

CMD ifconfig | grep inet && php -S 0.0.0.0:5050 -t /wordpress