FROM alpine:latest

RUN apk update
RUN apk add wget
RUN apk add libc6-compat

RUN     wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz
RUN     tar -xzf telegraf-1.14.0-static_linux_amd64.tar.gz
RUN     chmod +x telegraf/*
RUN     mkdir /etc/telegraf
RUN     cp telegraf/telegraf /usr/bin/
RUN     rm -rf telegraf-1.14.0-static_linux_amd64.tar.gz

COPY    /telegraf.conf /etc/telegraf/telegraf.conf
COPY    /telegraf.conf /etc/telegraf.conf

COPY liveness_probe.sh .

CMD     /usr/bin/telegraf
