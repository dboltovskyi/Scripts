#!/usr/bin/env bash

docker rm --force $(docker ps -aq)
