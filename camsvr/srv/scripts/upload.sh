#!/bin/bash
echo $1 >> /var/log/uploader.log
scp -o StrictHostKeyChecking=no $1 grant@iowntheinter.net:~/newmotion/ &
PID=$$
echo $$
disown $$ 
