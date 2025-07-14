#!/bin/sh

set -e

if [ ! -d /backup/mysql ]; then
    mkdir  -p /backup/mysql
fi

rsync -r /var/www/trazanad.42.fr /backup

rsync /var/lib/mysql/backup.sql /backup/mysql/backup.sql

echo "$(date) - Backup file created"
