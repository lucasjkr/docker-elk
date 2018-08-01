# How to get started

**Clone the repository**

```
git clone https://github.com/lucasjkr/docker-elk
cd docker-elk
```

**Generate SSL/TLS Certificates and Private Keys**
```
openssl req -x509 -batch -nodes -days 3650 -newkey rsa:4096\
  -keyout elasticsearch/tls/priv/elasticsearch.key\
  -out elasticsearch/tls/cert/elasticsearch.crt\
  -subj "/" 
  
openssl req -x509 -batch -nodes -days 3650 -newkey rsa:4096\
    -keyout logstash/tls/priv/logstash-forwarder.key\
    -out logstash/tls/cert/logstash-forwarder.crt\
    -subj "/" 

openssl req -x509 -batch -nodes -days 3650 -newkey rsa:4096\
  -keyout nginx/tls/priv/nginx-proxy.key\
  -out nginx/tls/cert/nginx-proxy.crt\
  -subj "/" 

```

**Bring up the Service for the First Time**
```
docker-compose up
```

**Install Templates, Dashboards, etc**
```
docker exec -it elasticsearch /bin/bash
./install-templates.sh

docker exec -it metricbeat /bin/bash

```
