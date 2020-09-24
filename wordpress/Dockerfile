FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim bash zsh git wget curl
 
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc

RUN printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc
RUN echo 'alias vi="vim"' >> ~/.zshrc

RUN apk add openrc
RUN openrc boot

ADD     tars/wordpress.tar.gz ~/
RUN		tar -xzf ~/tars/wordpress.tar.gz -C  /usr/share/nginx/html/. \
		&& mv config/wp-config.php /usr/share/nginx/html/wordpress/.



CMD zsh