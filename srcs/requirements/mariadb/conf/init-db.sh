#!/bin/sh

set -e

#assign variable
DB_PASS=$(cat /run/secrets/db_pass)

DB_ROOT_PASS=$(cat /run/secrets/db_root_pass)

#init wordpress database
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";

mariadb -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'";

mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'";

#secure mariadb installation
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS'";

mariadb -u root -p$DB_ROOT_PASS -e "FLUSH PRIVILEGES";

echo "secure installation done!"