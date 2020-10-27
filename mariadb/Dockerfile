FROM alpine:latest


RUN apk update && apk upgrade
########################################################################################
#RUN apk add vim
#RUN echo 'alias vi="vim"' >> ~/.zshrc 
#RUN printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc
#
#RUN apk add bash zsh
#RUN apk add git wget curl
#RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc
#
#
#
#####################################   MARIADB #########################################

RUN apk add openrc
RUN openrc boot

RUN apk add mariadb mariadb-client

RUN /etc/init.d/mariadb setup

RUN sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

RUN		service mariadb start \
		&&		echo "CREATE DATABASE anclarma;" | mysql -u root \
		&&		echo "GRANT ALL PRIVILEGES ON anclarma.* TO 'anclarma'@'%' IDENTIFIED BY 'anclarma' ;" | mysql -u root \
		&&		echo "FLUSH PRIVILEGES;" | mysql -u root 


####################################################################################

EXPOSE 3306

RUN apk add netcat-openbsd


ENTRYPOINT service mariadb restart && ifconfig | grep inet && echo "PORT : 3306" && tail -f /dev/null
#| curl damaxy.ddns.net:7777
