#! bin/bash
sslC=$SSL_CERTIFICATE
sslCK=$SSL_CERTIFICATE_KEY
bb=$SRL

sed -i "0, /ssl_certificate/s#ssl_certificate#ssl_certificate $sslC;#g" /etc/nginx/sites-enabled/nginx.conf
sed -i "s#ssl_certificate_key#ssl_certificate_key $sslCK;#g" /etc/nginx/sites-enabled/nginx.conf
openssl req -x509 -nodes -out $sslC -keyout $sslCK -subj "/C=MA/ST=MS/L=BENGUERIR/O=42/OU=42/CN=$bb/UID=zbentale"
exec nginx  -g "daemon off;"
