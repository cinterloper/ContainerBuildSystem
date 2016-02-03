#!/usr/bin/env bats
@test "git installed" {
  git --version
  result=$?
  [ "$result" -eq 0 ]
}
@test "GH token conigured " {
  result=$(curl -s  -u $(cat $CRED_DIR/.github_user_id):$(cat $CRED_DIR/.github_auth_token) https://api.github.com/users/$(cat $CRED_DIR/.github_user_id) | jq '.total_private_repos')
  [ "$result" != "null" ]
}
