<?php
// $host = getenv('DB_HOST');
// $user = getenv('DB_USER');
// $pass = getenv('DB_PASS');
// $db   = getenv('DB_NAME');
$host = "mariadb:3306";
$user = "trazanad";
$pass = "trazanad";
$db   = "wp_db";
$maxTries = 30;
$connected = false;

for ($i = 0; $i < $maxTries; $i++) {
    echo "$host, $user, $pass, $db";
    $mysqli = @new mysqli($host, $user, $pass, $db);
    if ($mysqli->connect_errno) {
        echo "Waiting for MariaDB at $host...\n";
        sleep(2);
    } else {
        $connected = true;
        $mysqli->close();
        break;
    }
}

if (!$connected) {
    fwrite(STDERR, "ERROR: Could not connect to MariaDB after $maxTries tries.\n");
    exit(1);
}
?>