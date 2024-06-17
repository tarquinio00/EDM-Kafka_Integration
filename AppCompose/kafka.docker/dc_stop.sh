#!/bin/bash

export $(grep -v '^#' .env | xargs)

docker compose -p ${PROJECT_NAME} stop

unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)
