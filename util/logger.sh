#!/bin/bash
if [ "$LOGDIR" == "" ]
then
  LOGDIR=/tmp
fi
FILE=$LOGDIR/dde.log
LOG() {
 cat |  TOFILE
}

TOFILE() {
  cat >> $FILE
}
