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

openssl req -x509 -newkey rsa:4086 \
  -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=ElkStack" \
  -keyout "opt/nginx-key.pem" \
  -out "opt/nginx-cert.pem" \
  -days 3650 -nodes -sha256
