metricbeat setup -e  \

  -E output.logstash.enabled=false\
  
  -E output.elasticsearch.hosts=['elasticsearch:9200']\

  -E output.elasticsearch.username=metricbeat_internal\

  -E output.elasticsearch.password=YOUR_PASSWORD\

  -E setup.kibana.host=kibana:5601

