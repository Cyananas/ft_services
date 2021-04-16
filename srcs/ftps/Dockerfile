FROM alpine:latest

RUN		apk update
RUN 	apk add vsftpd
RUN 	apk add --no-cache openssl

RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/vsftpd.csr -keyout /etc/ssl/private/vsftpd.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=pravry/CN=ft_services"

RUN 	mkdir -p /var/ftp
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY	ftps.sh .
RUN		chmod +x ftps.sh

RUN		adduser -D -h /var/ftp ftpuser
RUN		echo "ftpuser:password" | chpasswd
RUN 	chown ftpuser:ftpuser /var/ftp 

COPY liveness_probe.sh .

EXPOSE 	20 21 21000

CMD		["sh", "ftps.sh"]
