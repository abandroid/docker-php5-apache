#!/usr/bin/env bash

sh stop.sh
docker rm -f $(docker ps -a -q) > /dev/null
docker rmi -f $(docker images -q) > /dev/null
