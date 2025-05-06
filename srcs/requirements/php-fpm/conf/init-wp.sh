#!/bin/sh
set -e

# Download and extract WordPress if not present
if [ ! -f /var/www/trazanad.42.fr/wp-config.php ] && [ ! -f /var/www/trazanad.42.fr/wp-load.php ]; then
    /wp-cli.phar core download --path=/var/www/trazanad.42.fr
fi