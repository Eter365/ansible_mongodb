#!/bin/bash
############
# ADD USER #
############
HOST="$1"
PORT="$2"
MONGO_BIN="/opt/soft/mongodb3210/bin/mongo"
SCRIPTPATH="/work/github/ansible/playbooks/roles/replset/templates"
${MONGO_BIN} ${HOST}:${PORT}/admin --authenticationDatabase admin ${SCRIPTPATH}/adduser.js
