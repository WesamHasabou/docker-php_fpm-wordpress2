FROM ubuntu:14.04
RUN apt-get -y update
RUN apt-get install -y php5-fpm php5-mysql
ADD conf/www.conf /etc/php5/fpm/pool.d/www.conf
ADD conf/php-fpm.conf /etc/php5/fpm/php-fpm.conf
VOLUME /var/www/app
ADD run.sh /run.sh
EXPOSE 9000
ENTRYPOINT [ "/bin/bash", "/run.sh"]
