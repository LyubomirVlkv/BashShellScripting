#!/bin/bash
# Author: Lyubomir Velikov
# Date: 07/01/2024
# Description: Simple script that pings servers from a file and returns confirmation upon completion

servers="/home/lyubo/bashscripting/jan-scripts/hosts.txt"

for ip in $(cat $servers)

do

ping -c1 $ip &>/dev/null
if [ $? -eq 0 ]
then
echo Ping to $ip was successful!
else
echo Ping to $ip is NOT successful!
fi
done
