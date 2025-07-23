#!/bin/sh

set -e

ADMINER_LINK="https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php"

if [ ! -f /var/www/trazanad.42.fr/adminer.php ]; then
  mv  /adminer.php /var/www/trazanad.42.fr/adminer.php
fi

chmod -R 775 /var/www/trazanad.42.fr

chown -R www-data:www-data /var/www/trazanad.42.fr

exec "$@"