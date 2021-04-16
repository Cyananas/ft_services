FROM alpine:latest

RUN 	apk update
RUN 	apk add wget
RUN 	apk add libc6-compat

RUN     wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz
RUN     tar -xzf grafana-7.3.6.linux-amd64.tar.gz
RUN     mv grafana-7.3.6 grafana
RUN     rm -rf grafana-7.3.6.linux-amd64.tar.gz

COPY	grafana.sh .
RUN		chmod +x grafana.sh
COPY	grafana.db /grafana/data/

COPY liveness_probe.sh .

EXPOSE	3000

CMD ["sh", "grafana.sh"]
