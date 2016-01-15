#!/usr/bin/env bash

docker stop $(docker ps -a -q) > /dev/null