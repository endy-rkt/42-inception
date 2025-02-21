- Create nginx via Dockerfile using alpine []
    . create nginx via Dockerfile [ok]
    . using only tlsv1.2 or tlsv1.3 [ok]
    . using port 443 only [ok]
    . secure config for nginx [Ok]
    . verify ssl to make secure https [OK]
    . verify that is really only tlsv1.3 (still no test for tlsv1.3) [ok]

        test: curl -I -v --tlsv1.3 --tls-max 1.3s https://localhost:8080
    . create some html index [] optss
    . restart on crash []

- create mariaDB via Dockerfile using alpine []
    . no nginx in  it [OK]
    . start up [OK]
    . is on foreground [OK]
    . start with some data []
    . is secure installation []
    . restart on crash []

- create wordpress via Dockerfile using alpine []
    . install php-fpm  []
    . configure php-fpm []
    . install wordpress
    . configure and link php-fpm and wordpress []
    . no nginx []
    . volume for wordpress database []