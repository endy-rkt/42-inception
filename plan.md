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
    . wp data [ok]
    . is secure installation [ok]
    . restart on crash []

- create wordpress via Dockerfile using alpine []
    . install php-fpm  [ok]
    . configure php-fpm [ok]
    . install wordpress
    . configure and link php-fpm and wordpress []
    . no nginx [ok]
    . volume for wordpress database []
    . restart on crash []


- link php-fpm and nginx []
    . link conf container to container []
    . link conf file for wp []
    . shared volume []

- database in a volume []
    . add wp file in data [ok]
    . configure wp-config []
    . make a site []

- docker compose []
    . body []
    . network []
    . specify each link network []
    . restart on crash []



