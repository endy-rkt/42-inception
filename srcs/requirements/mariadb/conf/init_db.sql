
/*****************************************************mine****************************************************************/

CREATE DATABASE IF NOT EXISTS wp_db;

USE wp_db;

CREATE USER 'trazanad'@'localhost' IDENTIFIED BY 'trazanad';

CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';

GRANT ALL PRIVILEGES ON wp_db.* TO 'trazanad'@'%' IDENTIFIED BY 'trazanad';

FLUSH PRIVILEGES;

/*****************************************************mine****************************************************************/
