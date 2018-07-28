# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:6.3.2

WORKDIR /root
COPY templates/winlogbeat.template.json winlogbeat.template.json
COPY templates/metricbeat.template.json metricbeat.template.json

RUN curl -XPUT -H 'Content-Type: application/json' http://elasticsearch:9200/_template/winlogbeat-6.3.2 -d@winlogbeat.template.json
RUN curl -XPUT -H 'Content-Type: application/json' http://elasticsearch:9200/_template/metricbeat-6.3.2 -d@metricbeat.template.json

#increase min threads count
RUN ulimit -u 4096

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu
