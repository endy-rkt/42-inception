- Install mariadb
- mysql_secure_installation 
    save user and password
-  in sudo vim /etc/mysql/mariadb.conf.d/50-server.cnf  --> bind-address            = 0.0.0.0
- In nginx, /etc/nginx/sites-enabled/trazanad.42.fr (file like default)

server {
        listen 80;
        root /var/www/trazanad.42.fr;
        index index.php index.html index.htm index.nginx-debian.html;
        server_name trazanad.42.fr;

        location / {
                try_files $uri $uri/ /index.php$is_args$args;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}

- create in /etc/hosts 121.0.0.1 trazanad.42.fr

- test mkdir /var/www/trazanad.42.fr
cd /var/www/trazanad.42.fr
echo '<?php phpinfo(); ?>' > info.php

for trazanad.42.fr/info.php

-  cd /tmp
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz

- mv wordpress/* /var/www/trazanad.42.fr/

- cd /var/www/trazanad.42.fr
cp wp-config-sample.php wp-config.php

- curl -s https://api.wordpress.org/secret-key/1.1/salt/

- cd /var/www/trazanad.42.fr
nano wp-config.php

- define( 'DB_NAME', 'wp_site' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', '127.0.0.1' );

- trazanad.42.fr/wp-admin

- 
 sudo apt install php8.2-fpm php8.2-common php8.2-mysql \
php8.2-xml php8.2-intl php8.2-curl php8.2-gd \
php8.2-imagick php8.2-cli php8.2-dev php8.2-imap \
php8.2-mbstring php8.2-opcache php8.2-redis \
php8.2-soap php8.2-zip
