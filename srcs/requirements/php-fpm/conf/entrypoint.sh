#!/bin/sh
set -e

sleep 5

# php /wait-for-db.php

/init-wp.sh

if [ ! -f /var/www/trazanad.42.fr/wp-config.php ]; then
  wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --path=/var/www/trazanad.42.fr --allow-root

  wp core install --url="https://trazanad.42.fr" --title="Demo site" \
    --admin_user="$WP_USER" --admin_password="$WP_USER_PASSWORD" --admin_email="$WP_USER_EMAIL" \
    --path=/var/www/trazanad.42.fr --allow-root

  wp plugin install classic-editor --activate --path=/var/www/trazanad.42.fr --allow-root
fi

exec "$@"