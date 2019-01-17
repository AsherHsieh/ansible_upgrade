#!/bin/bash

# input the started date
ansible-playbook "inventories/inventory_$@/playbook.yml" \
                 --inventory="inventories/inventory_$@/hosts"

