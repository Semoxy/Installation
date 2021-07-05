#!/bin/bash

cd ./Server || exit
git pull | grep "Already up to date." > /dev/null

if [ "$?" -eq "0" ]
then
  echo "Server is up to date!"
else
  sudo docker build --tag semoxy/server ./Server
fi

cd ./WebClient || exit
git pull | grep "Already up to date." > /dev/null

if [ "$?" -eq "0" ]
then
  echo "WebClient is up to date!"
else
  sudo docker build --tag semoxy/client ./WebClient
fi

sudo docker-compose up