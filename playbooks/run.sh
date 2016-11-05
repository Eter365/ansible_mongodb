#!/bin/bash

#ansible-playbook -i inventory/inventory_23333 replset_test.yml
#ansible-playbook -i inventory/inventory_23333 --list-tasks replset.yml  
#ansible-playbook -i inventory/inventory_23333 replset_test.yml --extra-vars="dbPort=23339  cacheSize=3 mongod_version=3.2 "

for port in `seq 7301 1 7332`
do

ansible-playbook -i inventory/inventory_${port} replset.yml --extra-vars=" dbPort=${port} oplogSize=10240 mongod_version=2.6 " >> ./logs/${port}.log

done
