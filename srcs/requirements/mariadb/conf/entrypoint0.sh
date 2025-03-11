#!/bin/sh
set -e

chown -R mysql:mysql /var/lib/mysql

mariadbd-safe --user=mysql &

until mariadb -u root -e "SELECT 1" &>/dev/null; do
    echo "Waiting for MariaDB..."
    sleep 5
done

echo "Running initial SQL script..."
mariadb -u "root" < /var/lib/mysql/init_db.sql

killall mariadbd-safe
sleep 2

exec mariadbd-safe --user=mysql
