#!/bin/bash

for port in `seq 7301 1 7332`
do

ansible-playbook -i inventory/inventory_${port} reset.yml --extra-vars=" dbPort=${port} " 

done
