#!/bin/bash

export $(grep -v '^#' .env | xargs)

#create the TRACEABILITY external network if it doesn't exists
if [ ! "$(docker network ls | grep ${TRACEABILITY_NETWORK})" ]; then
  echo "Creating ${TRACEABILITY_NETWORK} network ..."
  docker network create --driver bridge ${TRACEABILITY_NETWORK}
fi

#create the PROXY external network if it doesn't exists
if [ ! "$(docker network ls | grep ${PROXY_NETWORK})" ]; then
  echo "Creating ${PROXY_NETWORK} network ..."
  docker network create --driver bridge ${PROXY_NETWORK}
fi


docker compose -p ${PROJECT_NAME} up -d


unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)

