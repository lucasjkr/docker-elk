# https://github.com/elastic/kibana-docker
FROM nginx:1.15.2

# Add SSL/TLS Certificates
COPY tls/cert/nginx-proxy.crt /etc/pki/certs/nginx-proxy.crt
COPY tls/priv/nginx-proxy.key /etc/pki/private/nginx-proxy.key

EXPOSE 80

