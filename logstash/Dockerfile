# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:6.3.2

WORKDIR /usr/share/logstash
RUN ./bin/logstash-plugin install logstash-input-beats

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
