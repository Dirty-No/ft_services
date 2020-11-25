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

##################################### GRAFANA ###############################################################


ENV db_type="mysql"
ENV db_ip="mariadb-service"
ENV db_port="3306"
ENV db_name="anclarma"
ENV db_user="anclarma"
ENV db_password="anclarma"
ENV domain_name="0.0.0.0"
ENV port="3000"

ENV influx_host="influxdb-service"
ENV influx_port='8086'
ENV influx_user="anclarma"
ENV influx_password="anclarma"
ENV influx_name='influxdb'
ENV datasource_name='influxdb'

ENV pattern_file="/root/replace.list"
ENV replace_script="/root/replace.sh"
ADD ./scripts/replace.sh ${replace_script}

RUN printf "_DB_TYPE_LABEL_ ${db_type}\n_DB_IP_LABEL_ ${db_ip}\n_DB_PORT_LABEL_ ${db_port}\n_DB_NAME_LABEL_ ${db_name}\n_DB_USER_LABEL_ ${db_user}\n_DB_PASSWORD_LABEL_ ${db_password}\n_PORT_LABEL_ ${port}\n_DOMAIN_LABEL_ $(domain_name)" > ${pattern_file}


ENV grafana_path="/grafana-7.2.0"
ENV grafana_conf="${grafana_path}/conf"
ENV grafana_ini="defaults.ini"

ADD ./conf ${grafana_conf}
ADD ./tars/grafana.tar.gz /
RUN mkdir -p /lib64
RUN cp /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

ADD ./ini/${grafana_ini} ${grafana_conf}
RUN sh ${replace_script} ${pattern_file} ${grafana_conf}/${grafana_ini}

###########################################################################################################

ENV SERVICE_PORTS="3000"
EXPOSE  3000 

CMD cd ${grafana_path}/bin && ./grafana-server ; tail -f /dev/null


#CMD ifconfig | grep inet && echo "PORTS : $SERVICE_PORTS" && cd ${grafana_path}/bin && ./grafana-server
