FROM docker.elastic.co/beats/metricbeat:6.3.2
USER root
WORKDIR /usr/share/metricbeat
COPY config/metricbeat.yml metricbeat.yml
RUN chown metricbeat metricbeat.yml
RUN chmod 600 metricbeat.yml
USER metricbeat
RUN metricbeat setup -e  \
   -E output.logstash.enabled=false\
   -E output.elasticsearch.hosts=['elasticsearch:9200']\
   -E output.elasticsearch.username=metricbeat_internal\
   -E output.elasticsearch.password=YOUR_PASSWORD\
   -E setup.kibana.host=kibana:5601
