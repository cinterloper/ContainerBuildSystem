#!/bin/bash
for arg in $(cat meta.json | jq -r .args[])
do 
  echo -n --build-arg $arg \ 
done
