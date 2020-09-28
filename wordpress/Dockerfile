FROM alpine:latest

EXPOSE 5050 443 80

RUN apk update && apk upgrade

RUN apk add vim bash zsh git wget curl
 
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc

RUN printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc
RUN echo 'alias vi="vim"' >> ~/.zshrc

RUN apk add openrc
RUN openrc boot

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


ADD     ./tars/wordpress.tar.gz /
#RUN		mv config/wp-config.php /usr/share/nginx/html/wordpress/.


#####################################   MARIADB #########################################
RUN apk add mariadb mariadb-client

RUN /etc/init.d/mariadb setup

RUN yes 'root' | passwd

RUN		service mariadb start \
		&&		echo "CREATE DATABASE wordpress;" | mysql -u root \
		&&		echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'root' ;" | mysql -u root \
		&&		echo "FLUSH PRIVILEGES;" | mysql -u root 

####################################################################################

RUN apk add netcat-openbsd

CMD service mariadb restart ; zsh
#CMD php -S 0.0.0.0:80 -t /wordpress