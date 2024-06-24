#!/bin/bash


export $(grep -v '^#' .env | xargs)

#create the TRACEABILITY external network if it doesn't exists
if [ ! "$(docker network ls | grep -w ${TRACEABILITY_NETWORK})" ]; then
  echo "Creating ${TRACEABILITY_NETWORK} network ..."
  docker network create --driver bridge ${TRACEABILITY_NETWORK}
fi

#create the PROXY external network if it doesn't exists
if [ ! "$(docker network ls | grep -w ${PROXY_NETWORK})" ]; then
  echo "Creating ${PROXY_NETWORK} network ..."
  docker network create --driver bridge ${PROXY_NETWORK}
fi


echo "Uploading Keycloak and Counter App images..."

# Check if Keycloak image exists
if [[ "$(docker images -q jboss/keycloak:16.1.0 2> /dev/null)" == "" ]]; then
  echo "Loading Keycloak image..."
  docker load -i jboss_keycloak.tar
else
  echo "Keycloak image already exists, skipping load."
fi

# Check if Counter App image exists
if [[ "$(docker images -q counters-app:vf1.0.1 2> /dev/null)" == "" ]]; then
  echo "Loading Counter App image..."
  docker load -i f1-counters-app.tar
else
  echo "Counter App image already exists, skipping load."
fi


unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)