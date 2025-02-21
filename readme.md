- Tous les fichiers nécessaires à la configuration de votre projet
dans un dossier srcs
- Makefile qui doit se trouver à la racine de votre
répertoire. Il doit permettre de mettre en place toute votre application 
- les conteneurs doivent être construits à partir de l’avant-
dernière version stable d’Alpine ou de l’avant-dernière version stable de Debian.



- container Docker contenant NGINX avec TLSv1.2 ou TLSv1.3 uniquement
- container Docker contenant WordPress + php-fpm (installé et configuré) uni-
quement sans nginx
- container Docker contenant MariaDB uniquement sans nginx
- volume contenant votre base de données WordPress
- second volume contenant les fichiers de votre site WordPress
- restart container on crash
- docker-network(La ligne network(s) doit être présente dans
votre fichier docker-compose.yml)
- Deux utilisateurs seront présents dans votre base de données WordPress(un admin mais non nom pas admin, administrator, admin-123,...)
- volume (/home/trazanad/data)


- configurer votre nom de domaine afin qu’il pointe vers votre adresse IP locale.
Ce nom de domaine sera trazanad.42.fr. 


- utiliser comme base image alpine / debian
- pas de hacky patch (boucle infinie, toujours mettre en foreground)
- pas de --link ou host comme docker network
- pas de latest tag
- pas de mot de passe , identifiant , cle api dans Dockerfile (use .env and docker secret, .gitignore)
- NGINX doit être le seul point d’entrée de votre
infrastructure par le port 443 uniquement en utilisant le protocole
TLSv1.2 ou TLSv1.3

- vous pouvez stocker vos variables (comme un nom de domaine) dans un
fichier .env