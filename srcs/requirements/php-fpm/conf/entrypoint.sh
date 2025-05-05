#!/bin/sh
set -e

if [ ! -f /var/www/trazanad.42.fr/wp-config.php ]; then
 ./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --path=/var/www/trazanad.42.fr --allow-root

 ./wp-cli.phar db create --path=/var/www/trazanad.42.fr

 ./wp-cli.phar core install --url="https://trazanad.42.fr" --title="Demo site" \
    --admin_user="$WP_USER" --admin_password="$WP_USER_PASSWORD" --admin_email="$WP_USER_EMAIL" \
    --path=/var/www/trazanad.42.fr

 ./wp-cli.phar plugin install classic-editor --activate --path=/var/www/trazanad.42.fr
fi

exec "$@"