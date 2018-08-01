FROM docker.elastic.co/beats/metricbeat:6.3.2
USER root
WORKDIR /usr/share/metricbeat
COPY config/metricbeat.yml metricbeat.yml
RUN chown metricbeat metricbeat.yml
RUN chmod 600 metricbeat.yml
USER metricbeat