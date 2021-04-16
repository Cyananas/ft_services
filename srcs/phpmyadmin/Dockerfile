FROM alpine:latest

RUN 	apk update
RUN 	apk add nginx wget
RUN 	apk add --no-cache openssl

RUN 	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip

RUN     wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN     tar -xzf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN     mv phpMyAdmin-5.0.4-all-languages var/www/phpmyadmin
RUN     rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/services.csr -keyout /etc/ssl/private/services.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pravry/CN=ft_services"

RUN 	mkdir -p var/run/nginx

COPY    nginx.conf /etc/nginx/nginx.conf
COPY    config.inc.php /var/www/phpmyadmin/config.inc.php
COPY	php.sh .

COPY liveness_probe.sh .

RUN chmod +x php.sh

EXPOSE 5000

CMD ["sh", "php.sh"]

