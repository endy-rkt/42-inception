FROM debian:12-slim

RUN apt update -y && apt install  adminer -y \
&& a2enconf adminer

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]