#!/bin/bash
#pass in the name of the docker shard folder you want to run
EXTRARGS=$(cat $1/meta.json | jq -r .extra | grep -v null)  

docker $DKRGS run -d $(bash .util/ports.sh $1/ports.json)  $(bash .util/binds.sh $1/binds.json) $EXTRARGS "$BASEREPO/$1" 

