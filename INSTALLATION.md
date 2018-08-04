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

openssl req -x509 -newkey rsa:4086 \
  -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=ElkStack" \
  -keyout "opt/nginx-key.pem" \
  -out "opt/nginx-cert.pem" \
  -days 3650 -nodes -sha256

```

**Increase VM on the host**
```
sudo sysctl -w vm.max_map_count=262144
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
./install-dashboard.sh
```


**Post Installation**

Log into Kibana with web browser and create initial index patterns for `metricbeat-6.3.2-*` and
`winlogbeat-6.3.2-*`

Log into Metribeat container and load Kibana Dashboards:
