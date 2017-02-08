#!/usr/bin/env bash

sh stop.sh
docker-compose up -d
docker-compose stop mysql
docker-compose up -d mysql
sh login.sh
