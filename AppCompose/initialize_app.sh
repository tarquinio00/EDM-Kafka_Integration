#!/bin/bash

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
