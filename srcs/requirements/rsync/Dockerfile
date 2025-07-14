FROM alpine:3.21

RUN apk update && apk upgrade \
    && apk add --no-cache rsync \
    && rm /var/cache/apk/*

COPY conf/create_backup.sh /

RUN chmod +x /create_backup.sh \
    && mkdir -p /var/www/trazanad.42.fr && chmod -R 755 /var/www/trazanad.42.fr \
    && adduser -S www-data -G www-data   \
    && chown -R www-data:www-data /var/www/trazanad.42.fr \
    && mkdir /backup  && chown -R www-data:www-data  /backup

RUN echo '*/10 * * * * /bin/sh /create_backup.sh' > /etc/crontabs/root

ENTRYPOINT [ "crond" ]

CMD ["-l", "8", "-f"]