FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx
COPY /conf/nginx.conf /etc/nginx/sites-enabled
RUN mkdir -p /var/www/html/site
COPY ./tools /var/www/html/site
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]