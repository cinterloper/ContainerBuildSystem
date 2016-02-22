#!/bin/bash
source util/logger.sh
source config/baserepo
COMPONENT=$1
#CACHE="--no-cache"
cd Containers/$CTRNS/$COMPONENT
EXTRA=$2 # support passing KV(s) to add.sh implementations, to indicate things like client, and include key material specific to them

if [[ -f add.sh ]]; then
  bash add.sh add $EXTRA
  if [[ $? -ne 0 ]]; then
    exit -1
  fi
fi 
docker $DKRGS build $CACHE -t $BASEREPO/$(cat meta.json | jq -r .tag ):latest .
STAT=$?
if [[ -f id.rsa ]]; then
  rm id.rsa
fi 
if [[ -e init.sh ]]; then
 bash init.sh
fi
if [[ -f add.sh ]] && [[ $STAT -eq 0 ]]; then
  bash add.sh clean
fi 
exit $STAT
