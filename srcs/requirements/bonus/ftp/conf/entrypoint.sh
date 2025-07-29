#!/bin/sh

set -e

FTP_USER_PSWD=$(cat /run/secrets/ftp_user_pswd)

adduser -S $FTP_USER -G $FTP_GROUP

echo "$FTP_USER:$FTP_USER_PSWD" | chpasswd

if [ ! -f /run/proftpd/proftpd.delay ]; then
	mkdir -p /run/proftpd;
    touch /run/proftpd/proftpd.delay;
fi

mkdir -p /var/www/trazanad.42.fr 

chmod -R 775 /var/www/trazanad.42.fr

chown -R $FTP_USER:$FTP_GROUP /var/www/trazanad.42.fr

exec proftpd --nodaemon