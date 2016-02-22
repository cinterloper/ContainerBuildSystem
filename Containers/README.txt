each folder is a container build namespace

pre-build material is collected (and cleaned up) through $CONTAINER/add.sh

volume binds are configured in binds.json
ports are configured in ports.json

debug.sh is used to gain a shell inside the container (with all the volume binds and ports setup) so you can explore what is going on in there

normally everything extends 'baseimage' but this is not a required pattern, just a convienent way to have a common starting configuration

supervisord executes processes inside the containers, and manages their enviornment. this is declared in supervisord.conf

