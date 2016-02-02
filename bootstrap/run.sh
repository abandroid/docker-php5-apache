#!/usr/bin/env bash

sh stop.sh > /dev/null 2>&1
docker-compose build
docker-compose up -d
docker exec -t -i -u 1000 bootstrap_php_1 /bin/bash
