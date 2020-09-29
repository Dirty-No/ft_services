FROM alpine:latest

########################################## init ############################################################3

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

###########################################################################################################

##################################### ftps ###############################################################

RUN apk add vsftpd
RUN mkdir ftp
RUN mkdir -p /home/ftp /home/root/ftp


###########################################################################################################

ENV SERVICE_PORTS="20 21"

EXPOSE 2727

CMD service vsftpd restart && ifconfig | grep inet && echo "PORTS : $SERVICE_PORTS" && zsh

