#!/usr/bin/env bash

# Run the Container

. variables.sh

docker run -it --platform=linux/amd64 \
    -v "${PWD}":/dockerweb \
    -w /dockerweb \
    ${CONTAINER_NAME}:${CONTAINER_TAG} tail -f /dev/null