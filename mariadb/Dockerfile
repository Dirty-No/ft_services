FROM alpine:latest


RUN apk update && apk upgrade

RUN apk add vim
RUN echo 'alias vi="vim"' >> ~/.zshrc 
RUN printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc

RUN apk add bash zsh
RUN apk add git wget curl
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc

RUN apk add openrc
RUN openrc boot

RUN apk add mariadb mariadb-client

RUN /etc/init.d/mariadb setup

RUN service mariadb start && echo "  CREATE DATABASE wordpress;\
  CREATE USER 'wp_user'@'%' IDENTIFIED BY 'pass';\
  GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;\
  CREATE USER 'admin'@'%' IDENTIFIED BY 'pass';\
  GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;\
  FLUSH PRIVILEGES;\
EOF" | mysql --user=root << EOF

EXPOSE 3306

RUN apk add netcat-openbsd


CMD zsh

