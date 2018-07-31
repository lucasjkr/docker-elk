# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:6.3.2

#increase min threads count
RUN ulimit -u 4096

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

WORKDIR /tmp
COPY templates/install-templates.sh install-templates.sh
RUN chmod 700 install-templates.sh

COPY templates/winlogbeat.template.json winlogbeat.template.json
COPY templates/metricbeat.template.json metricbeat.template.json
#RUN curl -XPUT -H 'Content-Type: application/json' http://fe2bff934860:9200/_template/metricbeat-6.3.2 -d@metricbeat.template.json
#RUN curl -XPUT -H 'Content-Type: application/json' http://fe2bff934860:9200/_template/winlogbeat-6.3.2 -d@winlogbeat.template.json

