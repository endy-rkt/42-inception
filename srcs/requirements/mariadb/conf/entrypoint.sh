#!/bin/sh
set -e

mariadbd-safe --user=mysql &

MARIADB_PID=$!

until mariadb -u root -e "SELECT 1" &>/dev/null; do
    echo "Waiting for MariaDB..."
    sleep 5
done

echo "Running initial SQL script..."
mariadb -u "root" < /var/lib/mysql/init_db.sql

echo "Running secure installation SQL script..."
mariadb -u "root" < /var/lib/mysql/secure_sql.sql

cp -r /var/lib/mysql/wp_db  /var/wp_db

kill -9 $MARIADB_PID

echo "Relaunch mariadb safe..."