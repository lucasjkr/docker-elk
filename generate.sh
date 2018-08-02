openssl req -x509 -batch -nodes -days 3650\
  -newkey rsa:4096\
  -keyout opt/elasticsearch.key\
  -out opt/elasticsearch.crt\
  -subj "/"

openssl req -x509 -batch -nodes -days 3650\
  -newkey rsa:4096\
  -keyout opt/logstash-forwarder.key\
  -out opt/logstash-forwarder.crt\
  -subj "/"

openssl req -x509 -batch -nodes -days 3650\
  -newkey rsa:4096\
  -keyout opt/nginx-proxy.key\
  -out opt/nginx-proxy.crt\
  -subj "/"

