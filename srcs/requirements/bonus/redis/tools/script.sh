#!bin/bash

echo "maxmemory 256mb" >> /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
sed -i 's/^bind/bind 0.0.0.0/g' /etc/redis/redis.conf
exec redis-server --daemonize no --protected-mode no
