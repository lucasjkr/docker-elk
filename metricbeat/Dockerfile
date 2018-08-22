FROM docker.elastic.co/beats/metricbeat:6.3.2
USER root

# Install new YML file
WORKDIR /usr/share/metricbeat
COPY config/metricbeat.yml metricbeat.yml && chown metricbeat metricbeat.yml && chmod 600 metricbeat.yml
USER metricbeat