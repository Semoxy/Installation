#!/bin/bash

# verify permissions
sudo -v

git clone https://github.com/SemoxyMC/WebClient.git
git clone https://github.com/SemoxyMC/Server.git

mv Server/defaultConfig.json ./config.json

sudo docker build --tag semoxy/server ./Server
sudo docker build --tag semoxy/client ./WebClient

# generate secrets
mkdir secrets
echo $(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c"${1:-32}") > secrets/mongo_pw.txt
echo $(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c"${1:-32}") > secrets/pepper.txt
echo -n "admin" > secrets/mongo_user.txt
echo -n "mongo.semoxy:27017" > secrets/mongo_addr.txt

sudo docker-compose up
