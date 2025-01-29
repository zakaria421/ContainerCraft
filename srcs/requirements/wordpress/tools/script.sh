#! bin/bash
sleep 9
wp --allow-root core download --path=/var/www/wordpress
cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

wp config set DB_NAME $MYSQL_DB_NAME  --allow-root --path=/var/www/wordpress
wp config set DB_USER $MYSQL_USER  --allow-root --path=/var/www/wordpress
wp config set DB_PASSWORD $MYSQL_PASSWORD  --allow-root --path=/var/www/wordpress
wp config set DB_HOST $MYSQL_DB_HOST  --allow-root --path=/var/www/wordpress

wp --allow-root core install --path=/var/www/wordpress \
 --url="zbentale.42.fr" \
 --title="index" \
 --admin_user=$WP_ADMIN_USER \
 --admin_password=$WP_ADMIN_PASSWORD \
 --admin_email=$WP_ADMIN_EMAIL 
wp --allow-root user create $WP_USER_NAME $WP_USER_EMAIL --user_pass="$WP_USER_PASSWORD" --path=/var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's#chdir = /var/www#chdir = /var/www/wordpress#g' /etc/php/7.4/fpm/pool.d/www.conf

wp --allow-root config set WP_REDIS_PORT "6379" --path=/var/www/wordpress
wp --allow-root config set WP_REDIS_HOST "redis" --path=/var/www/wordpress
wp --allow-root plugin install redis-cache --force --activate --path=/var/www/wordpress
wp --allow-root redis enable --path=/var/www/wordpress
wp theme install twentytwentytwo --allow-root --activate --path=/var/www/wordpress
exec php-fpm7.4 -F