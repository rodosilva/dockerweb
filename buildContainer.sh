#!/usr/bin/env bash

# Build the container

. variables.sh

docker build --ssh default \
    --build-arg username=${USERNAME} \
    --build-arg userid=${USERID} \
    --build-arg home_dir=${CONTAINER_HOME_DIR} \
    -t ${CONTAINER_NAME}:${CONTAINER_TAG} \
    .
