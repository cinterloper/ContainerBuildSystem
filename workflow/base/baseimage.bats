#!/bin/bash
VARS=( DKRGS SKUM )

@test "$(for v in ${VARS[@]};do echo -n $v\ ; done) passed" {
  source util/bashutils/testvars.sh
  result=$(testvars)
  [ "$result" -eq 0 ]
}
@test "build baseimage" {
  export CTRNS='base'
  bash util/build.sh baseimage
  result=$?
  [ "$result" -eq 0 ]
}
