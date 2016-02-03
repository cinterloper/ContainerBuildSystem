#!/bin/bash
VARS=(USRID CONFIGDIR TAG_VER NODE_VER GHUSR GHTOKEN )

VPATH="$CONFIGDIR/../util/vault"
APPID=$(cat $VPATH/app.id)
BAIL() {
  echo "ERROR " + $1l
  exit -1
}

if [[ -n "$2" ]]; then
  EXTRA=$2
fi

ADD() {
  cp -a /etc/resolv.conf ./
}

CLEAN() {
 rm resolv.conf
}
if [[ "$1" == "add" ]]; then
  ADD
elif [[ "$1" == "clean" ]]; then
  CLEAN
fi

if [[ ! -d "cfg" ]]; then
  mkdir cfg
fi

