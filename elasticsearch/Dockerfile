# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:6.3.2

#increase min threads count
RUN ulimit -u 4096

# Add SSL/TLS Certificates
COPY tls/cert/elasticsearch.crt /etc/pki/certs/elasticsearch.crt
COPY tls/priv/elasticsearch.key /etc/pki/private/elasticsearch.key

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

# Add Templates
WORKDIR /tmp
COPY templates/install-templates.sh install-templates.sh
RUN chmod 700 install-templates.sh

COPY templates/winlogbeat.template.json winlogbeat.template.json
COPY templates/metricbeat.template.json metricbeat.template.json

