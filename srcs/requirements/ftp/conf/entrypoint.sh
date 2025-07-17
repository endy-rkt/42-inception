#!/bin/sh

set -e

FTP_USER_PSWD=$(cat /run/secrets/ftp_user_pswd)

addgroup -S $FTP_GROUP && adduser -S $FTP_USER -G $FTP_GROUP

echo "$FTP_USER:$FTP_USER_PSWD" | chpasswd

if [ ! -f /run/proftpd/proftpd.delay ]; then
	mkdir -p /run/proftpd;
    touch /run/proftpd/proftpd.delay;
fi

mkdir -p /var/www/trazanad.42.fr && chown -R $FTP_USER:$FTP_GROUP /var/www

exec proftpd --nodaemon