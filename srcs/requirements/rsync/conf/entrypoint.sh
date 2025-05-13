#!/bin/sh

set -e

rsync -r /var/www/trazanad.42.fr /backup

until [ -f "/var/lib/mysql/backup.sql" ]; do
    echo "Waiting for MariaDB to create backup..."
    sleep 2
done

echo "Backup file created!"

rsync /var/lib/mysql/backup.sql /backup

exec $@