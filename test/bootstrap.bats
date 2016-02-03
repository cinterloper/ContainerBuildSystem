#!/usr/bin/env bats
VARS=( CONFIGDIR )

@test "correct variables passed" {
 result=0
 for var in ${VARS[@]}
 do
  if [  "$(eval echo \$"$var")" == "" ]
  then
    result=-1
  fi
 done
 [ "$result" -eq 0 ]

}
@test "build the webhook responder" {
  cd Containers
  bash build.sh webhook_responder
  result=$?
  [ "$result" -eq 0 ]
}
@test "build the dde wrapper enviornment" {
  docker $DKRGS build -t cinterloper/dde . 
  result=$?
  [ "$result" -eq 0 ]
}






