#!/bin/sh
set -e

DATADIR="/var/lib/mysql"

if [ ! -d "$DATADIR/mysql" ]; then
    echo "Initializing database..."
    mariadb-install-db --user=mysql --datadir="$DATADIR"

    mariadbd --user=mysql --datadir="$DATADIR" &
    MARIADB_PID=$!

    until mariadb -u root -e "SELECT 1" >/dev/null 2>&1; do
        echo "Waiting for MariaDB to start..."
        sleep 2
    done

    /bin/sh /init-db.sh

    kill "$MARIADB_PID"
    wait "$MARIADB_PID" 2>/dev/null
    echo "Database initialized."
fi

exec mariadbd --user=mysql --datadir="$DATADIR"