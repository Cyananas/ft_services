FROM alpine:latest

RUN apk update 
RUN apk add nginx
RUN apk add wget
RUN apk add curl
RUN apk add sudo
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php-phar

RUN     mkdir -p /run/nginx

COPY    wordpress.tar.gz .
RUN     tar -xf wordpress.tar.gz -C /var/www/

COPY    nginx.conf /etc/nginx/nginx.conf
COPY    wp-config.php var/www/wordpress/
COPY    wp.sh .
COPY    liveness_probe.sh .

RUN     chmod +x wp.sh

EXPOSE  5050

CMD     ["sh", "wp.sh"]
