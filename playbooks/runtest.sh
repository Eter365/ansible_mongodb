#!/bin/bash

#ansible-playbook -i inventory/inventory_23333 replset_test.yml
#ansible-playbook -i inventory/inventory_23333 --list-tasks replset.yml  
#ansible-playbook -i inventory/inventory_23333 replset_test.yml --extra-vars="dbPort=23339  cacheSize=3 mongod_version=3.2 "
ansible-playbook -i inventory/inventory_23333 replset.yml --extra-vars="dbPort=23339 mongod_version=2.6 "
