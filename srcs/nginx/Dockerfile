FROM alpine:latest

RUN     apk update && \
        apk add --no-cache nginx && \
        apk add --no-cache openssl
 
run openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/services.csr -keyout /etc/ssl/private/services.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pravry/CN=services"

# info on running servers
RUN     mkdir -p /run/nginx

COPY    nginx.conf /etc/nginx/nginx.conf
COPY    index.html  /www/
COPY    liveness_probe.sh .

EXPOSE  80 443

CMD     ["nginx", "-g", "daemon off;"]
