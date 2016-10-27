#!/bin/bash

#ansible-playbook -i inventory/inventory_23333 replset_test.yml
#ansible-playbook -i inventory/inventory_23333 --list-tasks replset.yml  
ansible-playbook -i inventory/inventory_23333 replset.yml --extra-vars="dbPort=23333  cacheSize=3"
