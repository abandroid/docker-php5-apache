#!/usr/bin/env bash

sh stop.sh > /dev/null 2>&1
docker rm -f $(docker ps -a -q) > /dev/null 2>&1
docker rmi -f $(docker images -q) > /dev/null 2>&1
