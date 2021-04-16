FROM alpine:latest

RUN apk update
RUN apk add influxdb

#RUN	apk add ca-certificates

COPY liveness_probe.sh .

EXPOSE 8086
CMD influxd run -config /etc/influxdb.conf

