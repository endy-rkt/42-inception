#!/bin/sh
set -e

DATADIR="/var/lib/mysql"

# If DB is not initialized, do setup
if [ ! -d "$DATADIR/mysql" ]; then
    echo "Initializing database..."
    mariadb-install-db --user=mysql --datadir="$DATADIR"

    # Start MariaDB in the background for setup
    mariadbd --user=mysql --datadir="$DATADIR" --skip-networking &
    MARIADB_PID=$!

    # Wait for MariaDB to be ready
    until mariadb -u root --protocol=socket -e "SELECT 1" >/dev/null 2>&1; do
        echo "Waiting for MariaDB to start..."
        sleep 2
    done

    # Substitute variables and run init SQL
    mariadb -u root --protocol=socket < /init_user.sql
    mariadb -u root --protocol=socket < /secure_sql.sql

    # Shutdown setup instance
    kill "$MARIADB_PID"
    wait "$MARIADB_PID" 2>/dev/null
    echo "Database initialized."
fi

# Run MariaDB in foreground
exec mariadbd --user=mysql --datadir="$DATADIR"