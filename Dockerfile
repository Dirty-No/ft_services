FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim

RUN apk add openssh openssh-server
RUN ssh-keygen -A

ADD sshd_config /etc/ssh/sshd_config

RUN yes 'root' | passwd

RUN apk add zsh
RUN apk add openrc nginx

#RUN rc-service nginx restart

CMD /usr/sbin/sshd && zsh