#!/bin/bash
rm tmp/pids/*
docker rm -f -v  $(docker ps -q -a)
docker-compose up
