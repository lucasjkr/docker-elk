# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:6.3.2

#increase min threads count
RUN ulimit -u 4096

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

EXPOSE 9200
EXPOSE 9300