#!/bin/sh
set -e

# Wait for DB to be ready (add logic if needed)

# Download WordPress if not present
if [ ! -f /var/www/trazanad.42.fr/wp-config.php ] && [ ! -f /var/www/trazanad.42.fr/wp-config-sample.php ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
   && chmod +x wp-cli.phar \
   && mv wp-cli.phar /usr/local/bin/wp

  wp core download --path=/var/www/trazanad.42.fr

  wp config create --dbname=wp_db --dbuser=trazanad --dbpass=trazanad-db --dbhost=mariadb --path=/var/www/trazanad.42.fr

  wp db create --path=/var/www/trazanad.42.fr

  wp core install --url="https://trazanad.42.fr" --title="Demo site" \
    --admin_user="trazanad" --admin_password="trazanad-wp" --admin_email="trazanad@example.com" \
    --path=/var/www/trazanad.42.fr

  # Install and activate Classic Editor plugin (example essential plugin)
  wp plugin install classic-editor --activate --path=/var/www/trazanad.42.fr
fi

exec "$@"