#!/usr/bin/env bash

docker-compose pull
docker-compose build
docker-compose up -d
docker exec -t -i -u 1000 bootstrap_php_1 /bin/bash