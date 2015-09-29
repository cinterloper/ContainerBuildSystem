#!/bin/bash
source .cfg/*
usage () {
	echo ""
	echo "PARAMETERS:"
	echo "  -c=COMPONENT        image to build"
	echo "  -k=KEY       	    include this ssh key."
	echo "  -h                  This message."
	exit 0
}
while [ $# -gt 0 ]; do
 case ${1} in
      -c=*|--c=*) COMPONENT="$(echo ${1} | awk -F= '{print $2;}')" ;;
      -k=*|--k=*) KEY="$(echo ${1} | awk -F= '{print $2;}')" ;;
      -h|--h|?) usage ;;
      *) usage ;;
     esac
 shift
done
cp $HOME/.ssh/id_rsa $COMPONENT/id.rsa
cd $COMPONENT
docker build -t $BASEREPO/$(cat meta.json | jq -r .tag) .
if [[ -f id.rsa ]]; then
  rm id.rsa
fi 
if [[ -e init.sh ]]
then
 bash init.sh
fi
