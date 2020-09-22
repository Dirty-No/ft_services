FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim

RUN apk add openssh openssh-server
RUN ssh-keygen -A

ADD sshd_config /etc/ssh/sshd_config

RUN yes 'root' | passwd

RUN apk add nginx
RUN mkdir -p /run/nginx

#nginx -g "daemon off;"

RUN apk add zsh
RUN apk add git wget
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc
RUN echo 'alias vi="vim"' >> ~/.zshrc
RUN printf "syntax on\nset nu\nset mouse=a" >> .zshrc

#RUN rc-service nginx restart

CMD /usr/sbin/sshd && cd /etc/nginx/ && zsh

#nginx path : /etc/nginx