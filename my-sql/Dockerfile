FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install mysql-client mysql-server pwgen
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
ADD startdb.sh /startdb.sh
ENV WPDB wordpress
ENV WPUSER wpuser
ENV WPPASS random
ENTRYPOINT [ "/bin/bash","/startdb.sh" ]
EXPOSE 3306
