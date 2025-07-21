FROM alpine:3.21

RUN apk update && apk upgrade \
  && apk add --no-cache \
    php82 php82-fpm php82-opcache php82-mysqli php82-common php82-pecl-redis \
  && ln -s /usr/bin/php82 /usr/bin/php \
  && rm -rf /var/cache/apk/*

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && mkdir -p /var/www/trazanad.42.fr && chmod -R 755 /var/www/trazanad.42.fr \
    && adduser -S www-data -G www-data \
    && chown -R www-data:www-data /var/www/trazanad.42.fr
  
RUN wget -O /adminer.php https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm82", "-F", "-R"]