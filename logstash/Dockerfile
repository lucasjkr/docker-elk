FROM docker.elastic.co/logstash/logstash-oss:6.3.2

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
WORKDIR /usr/share/logstash
RUN ./bin/logstash-plugin install logstash-input-beats && \
    ./bin/logstash-plugin install logstash-filter-geoip && \
    ./bin/logstash-plugin install logstash-filter-grok && \
    ./bin/logstash-plugin install logstash-filter-mutate

EXPOSE 5044
EXPOSE 5045
EXPOSE 5046