#!/usr/bin/env bats
source util/logger.sh
export LOGDIR=/tmp

@test "jq installed or fetchable?" {
  { 
   echo '{"hello":"goodbye"}' |  jq . 2>&1 > /dev/null
   result=$?
  }||{ # this catch/recovery relies on having added 'util/bin/' to PATH prior to calling the test suite
    curl -L -s -o util/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
    chmod +x util/bin/jq
    echo '{"hello":"goodbye"}' |  jq .
    result=$?
  }
  [ "$result" -eq 0 ]
}

@test "is docker installed/running/accessable?" {
  echo docker $DKRGS info
  echo my ip: $(curl http://icanhazip.com/)
  docker $DKRGS info 
  result=$?
  [ "$result" -eq 0 ]
}
