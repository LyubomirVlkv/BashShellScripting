#!/bin/bash

i=1
for username in `cat /etc/passwd| awk -F: '{print $1}'`
do
 echo "Username $((i++)) : $username"
done
