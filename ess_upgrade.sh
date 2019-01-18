#!/bin/bash

if [ -d "inventories/inventory_date/" ]; then
    # input the started date as folder name
    mv inventories/inventory_date/ inventories/inventory_$@/
    sed -i s/inventory_date/inventory_$@/g ansible.cfg
else
    echo "[Notice] Please use started date as variable"
fi

ansible-playbook --inventory="inventories/inventory_$@/hosts" -b -c ssh --ask-pass inventories/inventory_$@/playbook.yml
