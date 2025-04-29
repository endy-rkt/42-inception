1- clean up config

2- use dotenv and maybe docker secret

3- specify network

4- close not useful port

5- generate cert using script

6- check localhost/127.0.0.0/8 

7- test mandatory


create cert

openssl req -newkey rsa:2048 -nodes -keyout secret.key -x509 -days 365 -out secret.crt