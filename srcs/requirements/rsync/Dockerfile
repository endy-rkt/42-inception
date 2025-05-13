FROM alpine:3.21

RUN apk update && apk upgrade \
    && apk add --no-cache rsync \
    && rm /var/cache/apk/*

COPY conf/entrypoint.sh /

RUN chmod +x /entrypoint.sh \
    && mkdir -p /var/www/trazanad.42.fr && chmod -R 755 /var/www/trazanad.42.fr \
    && adduser -S www-data -G www-data   \
    && chown -R www-data:www-data /var/www/trazanad.42.fr \
    && mkdir /backup  && chown -R www-data:www-data  /backup

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["rsync","--no-detach","--daemon"]