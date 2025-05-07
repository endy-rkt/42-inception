#!/bin/sh

set -e

sleep 3

if [ ! -f /var/www/trazanad.42.fr/wp-config.php ] && [ ! -f /var/www/trazanad.42.fr/wp-load.php ]; then
    wp core download  --path=/var/www/trazanad.42.fr --allow-root
fi

if [ ! -f /var/www/trazanad.42.fr/wp-config.php ]; then
  wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --path=/var/www/trazanad.42.fr --allow-root

  wp core install --url="https://trazanad.42.fr" --title="Demo site" \
    --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" \
    --path=/var/www/trazanad.42.fr --allow-root

  wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PASSWORD --path=/var/www/trazanad.42.fr --allow-root

  wp plugin install classic-editor --activate --path=/var/www/trazanad.42.fr --allow-root

  wp plugin install redis-cache --activate --path=/var/www/trazanad.42.fr --allow-root

  # wp redis enable
fi

exec "$@"