#!/usr/bin/env bats


@test "aws cli installed" {
  aws --version 2>&1 | grep aws-cli
  result=$?
  [ "$result" -eq 0 ]
}

@test "aws cli configured and can access s3" {
  aws s3 ls
  result=$?
  [ "$result" -eq 0 ]
}

