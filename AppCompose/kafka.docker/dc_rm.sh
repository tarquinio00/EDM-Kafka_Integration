#!/bin/bash

export $(grep -v '^#' .env | xargs)

docker compose -p ${PROJECT_NAME} stop
docker compose -p ${PROJECT_NAME} rm -f

unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)
