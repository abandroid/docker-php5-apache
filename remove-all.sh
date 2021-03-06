#!/usr/bin/env bash

sh stop.sh
docker rm -f $(docker ps -a -q) > /dev/null 2>&1
docker rmi -f $(docker images -q) > /dev/null 2>&1
docker volume rm $(docker volume ls -qf dangling=true) > /dev/null 2>&1
