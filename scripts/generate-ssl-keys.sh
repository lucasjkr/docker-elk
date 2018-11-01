NEMOHOME="$( cd "$(dirname "$0")" ; pwd -P )"/../

openssl req -x509 -batch -nodes -days 3650 -newkey rsa:4096\
  -keyout "${NEMOHOME}/opt/logstash-forwarder.key" \
  -out "${NEMOHOME}/opt/logstash-forwarder.crt" \
  -subj "/"

openssl req -x509 -newkey rsa:4086 -days 3650 -nodes -sha256\
  -keyout "${NEMOHOME}/opt/nginx-key.pem" \
  -out "${NEMOHOME}/opt/nginx-cert.pem" \
  -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=ElkStack" \
