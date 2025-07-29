#!/bin/sh

set -e

rsync -r /var/www/trazanad.42.fr /backup

echo "$(date) - Backup file created"
