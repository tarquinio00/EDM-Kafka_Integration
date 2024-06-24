#!/bin/bash

export $(grep -v '^#' .env | xargs)

#create the TRACEABILITY external network if it doesn't exists
if [ ! "$(docker network ls | grep ${TRACEABILITY_NETWORK})" ]; then
  echo "Creating ${TRACEABILITY_NETWORK} network ..."
  docker network create --driver bridge ${TRACEABILITY_NETWORK}
fi

docker compose -p ${PROJECT_NAME} up -d


if docker container ls | grep -q 'app-counters-app-1'; then
  echo "App Counter running... Deleting unused volumes"
  docker volume prune -a 
else
  echo "App Counter is not running."
fi

unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)

