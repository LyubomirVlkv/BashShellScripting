#!/bin/bash
# Author: Lyubomir Velikov
# Description: Format the output of admin commands

date | awk '{print $2}'
uptime | awk '{print $3}'
df -h | grep root
echo "Changing this file just for the test"