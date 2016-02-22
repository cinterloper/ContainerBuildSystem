#!/bin/bash
#a hidden folder (.) should contain the set of docker definitions derived from 
#the operating system it is named for. 
#example : ./switchbase.sh EL7
for ctr in $(ls Containers)
do
   rm $ctr/Dockerfile
   rm $ctr/meta.json
done
for i in $(ls .$1); do
  ln  .$1/$i/Dockerfile $i/Dockerfile
  ln  .$1/$i/meta.json $i/meta.json
done
