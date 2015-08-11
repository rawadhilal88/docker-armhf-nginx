FROM    	armv7/armhf-ubuntu:latest

MAINTAINER 	Rawad Hilal "support@eagos.net"

RUN		apt-get update && apt-get install -y nginx php5-fpm php5-mysql && apt-get clean

RUN		sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
RUN		sed -i 's/listen = 127.0.0.1:9000/listen = \/var\/run\/php5-fpm.sock/g' /etc/php5/fpm/pool.d/www.conf

ADD		default /etc/nginx/sites-enabled/default
ADD		start.sh /start.sh

VOLUME 		["/var/cache/nginx"]
VOLUME		["/etc/nginx"]

EXPOSE 		80 443

CMD 		["/start.sh"]
