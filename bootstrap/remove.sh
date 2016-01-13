#!/usr/bin/env bash

docker stop $(docker ps -a -q) > /dev/null
docker rm -f $(docker ps -a -q) > /dev/null
docker rmi -f $(docker images -q) > /dev/null
