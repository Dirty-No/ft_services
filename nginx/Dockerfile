FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim

RUN apk add openssh openssh-server
RUN ssh-keygen -A

ADD sshd_config /etc/ssh/sshd_config

RUN yes 'root' | passwd


RUN apk add nginx openssl

ARG nginx_path='/etc/nginx'
ARG nginx_config_path="${nginx_path}/conf.d"
ARG nginx_run='/run/nginx'
ARG nginx_html="/var/lib/nginx/html/index.html"
ARG nginx_ssl="${nginx_path}/ssl"
ARG ssl_key="${nginx_ssl}/nginx-selfsigned.key"
ARG ssl_cert="${nginx_ssl}/nginx-selfsigned.crt"
ARG nginx_conf="${nginx_config_path}/default.conf"
ARG nginx_proxy_params="${nginx_path}/proxy_params"

ADD proxy_params $nginx_proxy_params

RUN mkdir -p ${nginx_run}
RUN mkdir -p ${nginx_ssl}
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout ${ssl_key} -out ${ssl_cert}
RUN rm /var/lib/nginx/html/index.html
ADD default.conf ${nginx_conf}



#RUN apk add zsh
#RUN apk add git wget curl
#RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#RUN sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc
#RUN echo 'alias vi="vim"' >> ~/.zshrc 
#RUN printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc

#RUN apk add openrc
#RUN openrc boot

#CMD rc-service nginx start && /usr/sbin/sshd && tail -f /dev/null
CMD nginx -g "daemon off;" && tail -f /dev/null

EXPOSE 80 443

#nginx -g "daemon off;"
#nginx path : /etc/nginx
#html path : /var/lib/nginx/html/index.html