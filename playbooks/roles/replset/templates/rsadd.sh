#!/bin/bash
##############
# RplSet ADD #
##############
HOST="$1"
PORT="$2"
MONGO_BIN="/opt/soft/mongodb3210/bin/mongo"
SCRIPTPATH="/work/github/ansible/playbooks/roles/replset/templates"
MONGODB_TMP_DIR="/srv"
###########################################
${MONGO_BIN} --username='root' --password='B033562027D95A0F17' ${HOST}:${PORT}/admin --authenticationDatabase admin ${MONGODB_TMP_DIR}/${PORT}/repset_init.js
###########################################
