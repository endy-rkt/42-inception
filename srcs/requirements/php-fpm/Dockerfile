FROM alpine:3.21

# Install PHP and required extensions
RUN apk update && apk upgrade \
  && apk add --no-cache \
      php82 php82-fpm php82-opcache php82-gd php82-mysqli php82-zlib php82-curl php82-common php82-session php82-phar php82-pecl-redis curl \
  && ln -s /usr/bin/php82 /usr/bin/php \
  && rm -rf /var/cache/apk/*

# Copy configuration
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY conf/php.ini /etc/php82/php.ini

# Copy init and entrypoint scripts
COPY conf/init-wp.sh /init-wp.sh
COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /init-wp.sh /entrypoint.sh \
    && mkdir -p /var/www/trazanad.42.fr \
    && chmod -R 755 /var/www/trazanad.42.fr

# Download wp-cli.phar at build time for reliability and speed
RUN curl -o /wp-cli.phar -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /wp-cli.phar


ENV PATH="/:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm82", "-F", "-R"]