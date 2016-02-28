#!/usr/bin/env bash

sh stop.sh
docker-compose up -d
docker exec -t -i -u 1000 docker_php_1 /bin/bash
