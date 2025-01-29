FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php-curl php-fpm  php-mysqlnd
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php
RUN mkdir -p /var/www/wordpress
COPY ./tools/script.sh /
RUN chmod +x script.sh
ENTRYPOINT [ "./script.sh" ]
