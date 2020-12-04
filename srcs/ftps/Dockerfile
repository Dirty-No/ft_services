FROM alpine:latest

########################################## init ############################################################3

EXPOSE 21


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

RUN apk add netcat-openbsd

###########################################################################################################

##################################### ftps ###############################################################

RUN apk add vsftpd
RUN mkdir ftp
RUN mkdir -p /home/ftp /home/root/ftp
RUN mkdir -p srv/ftp
ADD ./conf/vsftpd.conf /etc/vsftpd

##########################################################################################################

######################################## SSL ############################################################

#RUN apk add openssh openssh-server
#RUN ssh-keygen -A
#ADD sshd_config /etc/ssh/sshd_config

RUN yes 'root' | passwd


RUN apk add openssl

ARG ssl_path="/etc/ssl"
ARG ssl_key="${ssl_path}/ftp-selfsigned.key"
ARG ssl_cert="${ssl_path}/ftp-selfsigned.crt"

RUN mkdir -p ${ssl_path}
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout ${ssl_key} -out ${ssl_cert}

##########################################################################################################


ENV SERVICE_PORTS="21"


#CMD service vsftpd restart && ifconfig | grep inet && echo "PORTS : $SERVICE_PORTS" && zsh
CMD service vsftpd restart ; tail -f /dev/null