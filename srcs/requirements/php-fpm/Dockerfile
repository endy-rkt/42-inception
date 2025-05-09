FROM alpine:3.21

RUN apk update && apk upgrade \
  && apk add --no-cache \
    php82 php82-fpm php82-opcache php82-gd php82-mysqli php82-zlib php82-curl php82-common php82-session php82-phar php82-pecl-redis php82-mbstring php82-ctype curl \
  && ln -s /usr/bin/php82 /usr/bin/php \
  && rm -rf /var/cache/apk/*

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY conf/php.ini /etc/php82/php.ini
COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && mkdir -p /var/www/trazanad.42.fr && chmod -R 755 /var/www/trazanad.42.fr \
    && adduser -S www-data -G www-data \
    && chown -R www-data:www-data /var/www/trazanad.42.fr

RUN curl -o /wp-cli.phar -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm82", "-F", "-R"]