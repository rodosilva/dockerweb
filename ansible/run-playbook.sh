#!/usr/bin/env bash

# Run the Ansible Playbook
# This script is meant to be used as a Docker ENTRYPOINT

. variables.sh

: ${INVENTORY_FILE:=/dockerweb/ansible/inventory.txt}
: ${PLAYBOOK:=/dockerweb/ansible/initialPlaybook.yml}

echo " ================================================ "
echo " ========= Initializing Playbook ================ "
echo " ================================================ "

ansible-playbook ${PLAYBOOK} \
    -e "golandweb_version=${GOLANDWEB_VERSION}"

echo " ================================================ "
echo " ================ Running GO ===================== "
echo " ================================================ "

/usr/local/go/bin/go run /dockerweb/golandWeb/cmd/web/main.go

