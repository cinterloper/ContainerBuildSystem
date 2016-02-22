source util/bashutils/testvars.sh

@test "correct variables passed" {
 result=$(testvars)
 [ "$result" -eq 0 ]
}
