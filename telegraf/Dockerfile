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

RUN apk add netcat-openbsd

RUN yes 'root' | passwd

###########################################################################################################

##################################### influxdb ###############################################################

RUN apk add influxdb
ADD tars/telegraf.tar.gz /

RUN service influxdb start && sleep 1 && \
influx -execute "CREATE DATABASE influx_db" && \
influx -execute "CREATE USER anclarma WITH PASSWORD 'anclarma'" && \
influx -execute "GRANT ALL ON influx_db TO anclarma"

###########################################################################################################

ENV SERVICE_PORTS="8086"

CMD ifconfig | grep inet && echo "PORTS : $SERVICE_PORTS" && service influxdb restart && telegraf && tail -f /dev/null
