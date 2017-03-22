FROM ubuntu:14.04
RUN  apt-get -y update
RUN  apt-get -y install nginx
VOLUME  /var/www/app
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/default    /etc/nginx/conf.d/default
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/nginx" ]
