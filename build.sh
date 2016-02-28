#!/usr/bin/env bash

sh remove.sh
docker-compose pull
docker-compose build

sh stop.sh
docker-compose up -d

sh stop.sh
docker-compose up -d

sh run.sh