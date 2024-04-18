#!/usr/bin/env bash

# Run the Container

. variables.sh

docker run -it --platform=linux/amd64 \
    -v "${PWD}":/dockerweb \
    -w /dockerweb \
    -p 8080:8080 \
    ${CONTAINER_NAME}:${CONTAINER_TAG} tail -f /dev/null