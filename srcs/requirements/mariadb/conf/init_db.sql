CREATE DATABASE IF NOT EXISTS wp_db;

USE wp_db;

-- Create wp_users table
CREATE TABLE IF NOT EXISTS wp_users (
    ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    user_login varchar(60) NOT NULL,
    user_pass varchar(255) NOT NULL,
    user_nicename varchar(50) NOT NULL,
    user_email varchar(100) NOT NULL,
    user_url varchar(100) DEFAULT '',
    user_registered datetime NOT NULL,
    user_activation_key varchar(255) DEFAULT '',
    user_status int(11) NOT NULL DEFAULT 0,
    display_name varchar(250) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE KEY user_login (user_login),
    UNIQUE KEY user_email (user_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create wp_usermeta table
CREATE TABLE IF NOT EXISTS wp_usermeta (
    umeta_id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    user_id bigint(20) unsigned NOT NULL,
    meta_key varchar(255) DEFAULT NULL,
    meta_value longtext,
    PRIMARY KEY (umeta_id),
    KEY user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert admin user into wp_users
INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, display_name)
VALUES
('admin', MD5('admin'), 'admin', 'admin@example.com', NOW(), 'Admin');

-- Insert user meta data into wp_usermeta for the admin user
INSERT INTO wp_usermeta (user_id, meta_key, meta_value)
VALUES
(LAST_INSERT_ID(), 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(LAST_INSERT_ID(), 'wp_user_level', '10');

GRANT ALL PRIVILEGES ON wp_db.* TO 'admin'@'%' IDENTIFIED BY 'admin';
FLUSH PRIVILEGES;

