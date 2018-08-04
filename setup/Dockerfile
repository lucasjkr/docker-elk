FROM alpine:3.7

USER root

RUN apk add --update \
    curl \
    nano

WORKDIR /tools

COPY templates/install.sh install-templates.sh
COPY templates/metricbeat.template.json metricbeat.template.json
COPY templates/winlogbeat.template.json winlogbeat.template.json
RUN chmod 755 install-templates.sh

CMD tail -f /etc/hostname