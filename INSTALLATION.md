# How to get started

## Host System Requirements

This is Docker, so it should be portable. However, I have only tested the host on Ubuntu Server 18.04 on real and virtual hardware. 

Standard install, with OpenSSH Server, Docker-CE, and Docker Compose.

## Pre-Installation

#### DNS Entries

If you don't have access to a DNS Server on your network and don't want to add A records to your TLD, you can still get by by adding the following entries to the `hosts` file of whichever machines will be accessing the setup.

Take note of your machines IP Address (example: 10.1.10.201) and edit `/etc/hosts` to add the following entries;

```
10.1.10.201      logstash.your.domain
10.1.10.201      kibana.your.domain
10.1.10.201      fir.your.domain
10.1.10.201      411.your.domain

```

#### Clone the Git Repository

```
git clone https://github.com/lucasjkr/docker-elk
cd docker-elk
```

#### Generate SSL/TLS Certificates and keys

```
/bin/bash generate.sh
```

If you have your own keys/certificates already, you can just place them in the `/opt` directory inside the repository - just follow the naming convention in `generate.sh`.

**NOTE** Nginx connections are encrypted with SSL, but are still available for anyone to log into. 
Therefore, firewall settings must be enforced to limit access; this will change in the future.
Also note, other containers (specifically, logstash) aren't actually using SSL anywhere yet, that feature will come very soon though.


#### Adjust virtual memory settings

**Temporary fix:**

```
sysctl -w vm.max_map_count=262144
```

**Permanent fix:**

Append the following lines to you `/etc/sysctl.conf`

```
###################################################################
# Virtual Memory
#
# Settings recommendation per Elastic Co:
# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
vm.max_map_count=262144
```


##Bring up the Service for the First Time
```
docker-compose up
```

### Create Handesk Database
```
docker exec handesk php artisan migrate
```

#### Initialize Etsy/411
```
docker exec fouroneone php -f init.php
```


#### Load metribeat Index Template into Elasticsearch
```
docker exec metricbeat metricbeat setup --template -E output.logstash.enabled=false \
    -E 'output.elasticsearch.hosts=["elasticsearch:9200"]'
```

#### Load metribeat Dashboards into Kibana
```
docker exec metricbeat metricbeat setup --dashboards
```

#### Delete old metricbeat data
```
docker exec elasticsearch curl -XDELETE 'http://elasticsearch:9200/metricbeat-*'
```

##### Install Winlogbbeat Template
```
docker exec elasticsearch curl -XPUT -H 'Content-Type: application/json' \
    http://elasticsearch:9200/_template/winlogbeat-6.3.2 \
    -d@templates/winlogbeat.template.json
```

#### Delete old Winlogbeat Data
```
docker exec elasticsearch curl -XDELETE 'http://elasticsearch:9200/winlogbeat-*'
```




## Post Installation

### Default Passwords 
At the very least, you'll need to want to change the following default passwords:

**411**

admin/admin


**Handesk**

admin@admin.com / admin

### Index Pattern Creation
Log into Kibana with web browser and create initial index patterns for `metricbeat-6.3.2-*` and
`winlogbeat-6.3.2-*`


### "Fix" for single-node ES instance
Set the number of index replicas to zero:
```
PUT 411_alerts_1/_settings
{
  "index": {
    "number_of_replicas" : 0
  }
}

PUT metricbeat-6.3.2-2018-08/_settings
{
  "index": {
    "number_of_replicas" : 0
  }
}

etc

```