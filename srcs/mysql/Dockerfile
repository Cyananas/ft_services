FROM alpine:latest

RUN apk update
RUN apk add mariadb mariadb-client

RUN mkdir /run/mysqld
COPY my.cnf /etc/my.cnf
COPY init_mysql.sh .
COPY mysql.sh .

RUN chmod +x mysql.sh
RUN chmod +x init_mysql.sh

COPY liveness_probe.sh .
 
EXPOSE 3306

CMD ["sh", "mysql.sh"]
