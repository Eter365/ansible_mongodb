#!/bin/bash

ansible-playbook -i inventory/inventory_uc configsrv.yml --extra-vars=" dbPort=9001  mongod_version=2.6 " >> ./logs/9001.log
