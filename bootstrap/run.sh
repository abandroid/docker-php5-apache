#!/usr/bin/env bash

docker pull endroid/docker-php54-apache
docker-compose build
docker-compose up -d
docker exec -t -i -u 1000 bootstrap_php_1 /bin/bash
