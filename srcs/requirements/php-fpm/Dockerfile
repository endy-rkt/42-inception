FROM alpine:3.21

RUN apk update && apk upgrade \
 && apk add --no-cache php82 php82-fpm php82-opcache php82-gd php82-mysqli php82-zlib php82-curl php82-common php82-session php82-phar curl \
 && ln -s /usr/bin/php82 /usr/bin/php \
 && rm -rf /var/cache/apk/*

COPY conf/www.conf /etc/php82/php-fpm.d
COPY conf/php.ini /etc/php82/php.ini
COPY conf/wp-setup.sh /tmp/wp-setup.sh

RUN mkdir -p /var/www/trazanad.42.fr \
 && chmod -R 755 /var/www/trazanad.42.fr \
 && chmod +x /tmp/wp-setup.sh

ENTRYPOINT ["/tmp/wp-setup.sh"]

CMD ["php-fpm82", "-F", "-R"]