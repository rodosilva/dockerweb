#!/usr/bin/env bash


# This script file contains the variable declarations for the various
# things managed by code in this directory. This file MUST BE SOURCED
# and not executed. But, it is set as "chmod +x" so the lint processes
# don't complain that a shell file is not executable.

(return 0 2>/dev/null) && sourced=1 || sourced=0
if [[ $sourced = 0 ]]; then
    echo >&2 "This script must not be executed. It must be 'sourced'"
    exit 99
fi

# Get the current username and user id so they can be set in the container.
: ${USERNAME:=$(id -un)}
: ${USERID:=$(id -u)}

# Set default values
GOLANDWEB_VERSION='1.0.0'
CONTAINER_NAME="${USERNAME}/golandweb"
CONTAINER_TAG=${GOLANDWEB_VERSION}
CONTAINER_HOME_DIR="/opt/app-root/src"

