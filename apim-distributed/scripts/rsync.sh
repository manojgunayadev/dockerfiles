#!/bin/bash
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -f verizon.rsa -t rsa -N ''
sshpass -p "screencast" ssh-copy-id -o "StrictHostKeyChecking no" -i ~/.ssh/verizon.rsa.pub mgtgw1.marathon.slave.mesos. -p 31222
while true 
do 
sshpass -p "screencast" rsync -e 'ssh -p 31222' -avzp mgtgw1.marathon.slave.mesos.:/mnt/wso2/wso2am-1.10.0/repository/logs/ /mnt/wso2/
sleep 10
done
