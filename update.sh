#!/bin/bash

cd WebClient || exit
git pull
cd ../Server || exit
git pull
cd ..

sudo docker-compose up