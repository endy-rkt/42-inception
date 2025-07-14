#!/bin/sh

set -e

if [ ! -f /var/www/trazanad.42.fr/wp-config.php ]; then
  DB_PASS=$(cat /run/secrets/db_pass)
  WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_pswd)
  WP_USER_PASSWORD=$(cat /run/secrets/wp_user_pswd)

  wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --path=/var/www/trazanad.42.fr --allow-root

  sed -i "/^\/\* That's all, stop editing! Happy publishing. \*\//i \
  define('FS_METHOD', 'direct');\
  define('WP_REDIS_HOST', 'redis');\
  define('WP_REDIS_PORT', 6379);\
  define('WP_REDIS_TIMEOUT', 2);\
  define('WP_REDIS_READ_TIMEOUT', 2);" /var/www/trazanad.42.fr/wp-config.php

  wp core install --url="https://trazanad.42.fr" --title="Demo site" \
    --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" \
    --path=/var/www/trazanad.42.fr --allow-root

  wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PASSWORD --path=/var/www/trazanad.42.fr --allow-root

  wp plugin install classic-editor --activate --path=/var/www/trazanad.42.fr --allow-root

  chown -R www-data:www-data /var/www/trazanad.42.fr

  chmod -R 775 /var/www/trazanad.42.fr/wp-content

  wp plugin install redis-cache --activate --path=/var/www/trazanad.42.fr --allow-root

  wp option update redis_host redis --path=/var/www/trazanad.42.fr --allow-root

  wp redis enable --path=/var/www/trazanad.42.fr --allow-root
fi

exec "$@"