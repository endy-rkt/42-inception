#!/bin/sh

set -e

addgroup -S $FTP_GROUP && adduser -S $FTP_USER -G $FTP_GROUP

echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd

mkdir -p /run/proftpd && touch /run/proftpd/proftpd.delay 

mkdir -p /var/www/trazanad.42.fr && chown -R $FTP_USER:$FTP_GROUP /var/www

exec proftpd --nodaemon