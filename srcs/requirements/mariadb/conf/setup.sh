#!/bin/sh
set -e

mariadbd-safe --user=mysql &

MARIADB_PID=$!

until mariadb -u root -e "SELECT 1" &>/dev/null; do
    echo "Waiting for MariaDB..."
    sleep 5
done

echo "Running wordpress user initialization..."
mariadb -u root < /tmp/init_user.sql

echo "Databases after init:"
mariadb -u root -e "SHOW DATABASES;"

echo "Running secure installation SQL script..."
mariadb -u "root" < /tmp/secure_sql.sql

kill -9 $MARIADB_PID

echo "Relaunching mariadb..."