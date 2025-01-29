FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y && apt-get install -y  nginx openssl  vim procps
RUN mkdir -p /etc/nginx/ssl
COPY /conf/nginx.conf /etc/nginx/sites-enabled
RUN mkdir -p /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
COPY ./tools/script.sh /
RUN chmod +x script.sh
EXPOSE 443
CMD [ "./script.sh" ]