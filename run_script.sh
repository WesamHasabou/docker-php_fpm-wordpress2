#!/bin/bash

######## building images ########
cd downloader
docker build -t downloader .
cd ../my-sql
docker build -t my-sql .
cd ../php-fpm
docker build -t php-fpm .
cd ../nginx
docker build -t nginx .

######## running containers ########
docker run -it --name downloader downloader
docker run -d --name my-sql my-sql
docker run -d --name php-fpm --volumes-from downloader --link my-sql:my-sql php-fpm
docker run -d -p 80:80 --name nginx --volumes-from downloader --link php-fpm:php-fpm nginx
