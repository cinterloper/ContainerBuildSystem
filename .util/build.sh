#!/bin/bash
source .cfg/*

COMPONENT=$1

cp $HOME/.ssh/id_rsa $COMPONENT/id.rsa
cd $COMPONENT
docker build -t $BASEREPO/$(cat meta.json | jq -r .tag) .
rm id.rsa
if [[ -e init.sh ]]
then
 bash init.sh
fi
