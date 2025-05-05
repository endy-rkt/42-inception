#!/bin/sh
set -e

if [ ! -f /var/www/trazanad.42.fr/wp-config.php ] && [ ! -f /var/www/trazanad.42.fr/wp-config-sample.php ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
   && chmod +x wp-cli.phar

  ./wp-cli.phar core download --path=/var/www/trazanad.42.fr
fi