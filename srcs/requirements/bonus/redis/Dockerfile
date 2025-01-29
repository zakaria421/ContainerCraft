FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y && apt-get install -y redis-server php-redis
COPY ./tools/script.sh /
RUN chmod +x script.sh
CMD [ "./script.sh" ]