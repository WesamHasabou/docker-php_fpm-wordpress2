########  docker-php_fpm-wordpress  ########

This configuration will use VOLUME to create a shared volume 
containing the wordpress application,
also it uses the link feature to simplify the connection proccess
between the containers.


To start a wordpress application build the images 
and run the stack from the top down:

git clone https://github.com/WesamHasabou/docker-php_fpm-wordpress2.git
cd docker-php_fpm-wordpress2


chmod +x run_script.sh

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

##### The Website will be accessible from port 80 #####


http://localhost:80

