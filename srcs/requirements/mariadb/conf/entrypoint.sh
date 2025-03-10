#!/bin/sh

set -e

# Start MariaDB in the background
mariadbd-safe --user=mysql &

# Wait for MariaDB to be fully ready
until mariadb -u "root" -e "SELECT 1" &>/dev/null; do
    echo "waiting for mariadb..."
    sleep 5
done

# Run init SQL script if not done before
if [ ! -f /var/lib/mysql/.init_done ]; then
    echo "Running initial SQL script..."
    mariadb -u "root" < /var/lib/mysql/init_db.sql
    touch /var/lib/mysql/.init_done
fi

# Keep the container running with the **original MariaDB process**
wait
