@test "grab submodules" {
  git submodule foreach git pull origin master
}
