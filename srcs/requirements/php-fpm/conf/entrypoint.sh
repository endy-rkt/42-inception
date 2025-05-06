#!/bin/sh
set -e

/init-wp.sh

# Initialize WordPress if needed
if [ ! -f /var/www/trazanad.42.fr/wp-config.php ]; then
    # Create wp-config.php with DB creds
    /wp-cli.phar config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASS" \
        --dbhost="$DB_HOST" \
        --path=/var/www/trazanad.42.fr \
        --allow-root

    # Create DB (safe even if exists)
    /wp-cli.phar db create --path=/var/www/trazanad.42.fr --allow-root || true

    # Install core
    /wp-cli.phar core install \
        --url="https://trazanad.42.fr" \
        --title="Demo site" \
        --admin_user="$WP_USER" \
        --admin_password="$WP_USER_PASSWORD" \
        --admin_email="$WP_USER_EMAIL" \
        --path=/var/www/trazanad.42.fr \
        --allow-root

    # Install and activate plugin
    /wp-cli.phar plugin install classic-editor --activate --path=/var/www/trazanad.42.fr --allow-root
fi

# Hand over to CMD
exec "$@"