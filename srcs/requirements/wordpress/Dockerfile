FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache php php83 php83-fpm php83-opcache php83-gd php83-mysqli php83-zlib php83-curl \
&& rm /var/cache/apk/*

RUN chmod +x /usr/bin/php

EXPOSE 80

ENTRYPOINT ["php-fpm83"]

CMD ["-F", "-R"]