FROM docker.elastic.co/beats/metricbeat:6.4.0
USER root

# Install new YML file
#WORKDIR /usr/share/metricbeat
#COPY config/metricbeat.yml metricbeat.yml
#RUN chown metricbeat metricbeat.yml && chmod 600 metricbeat.yml
#USER metricbeat


WORKDIR /usr/share/metricbeat
COPY config/metricbeat.yml metricbeat.yml
#RUN chown root metricbeat.yml && chmod 600 metricbeat.yml
#RUN chown root modules/* && chmod 600 root modules/*
#USER metricbeat