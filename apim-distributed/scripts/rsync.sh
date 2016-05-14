#!/bin/bash
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -f verizon.rsa -t rsa -N ''
sshpass -p "screencast" rsync -avz -e ssh -p 31222" root@mgtgw1.marathon.slave.mesos.:/mnt/wso2/wso2am-1.10.0/repository/deployment/server/synapse-configs /mnt/wso2/wso2am-1.10.0/repository/deployment/server/
