# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:6.3.2

# Add SSL/TLS Certificates
#COPY tls/cert/logstash-forwarder.crt /etc/pki/certs/logstash-forwarder.crt
#COPY tls/priv/logstash-forwarder.key /etc/pki/private/logstash-forwarder.key

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
WORKDIR /usr/share/logstash
RUN ./bin/logstash-plugin install logstash-input-beats

EXPOSE 5000
EXPOSE 5044
EXPOSE 5045