#!/bin/sh
set -e

mariadbd-safe --user=mysql &

MARIADB_PID=$!

until mariadb -u root -e "SELECT 1" &>/dev/null; do
    echo "Waiting for MariaDB..."
    sleep 5
done

echo "Running wordpress user initialization..."
mariadb -u root < /init_user.sql

echo "Running secure installation SQL script..."
mariadb -u "root" < /secure_sql.sql

kill -9 $MARIADB_PID

echo "Relaunching mariadb..."