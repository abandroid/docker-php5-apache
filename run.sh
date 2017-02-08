#!/usr/bin/env bash

sh stop.sh
docker-compose up -d
sh login.sh
