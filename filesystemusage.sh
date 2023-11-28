#!/bin/bash

file_usage_thr=10
rm -rf file_sys_info.txt
df -Ph | grep -vE "Filesystem|tmpfs" | while read line
do
	file_name=$(echo $line | awk '{print $1}')
	file_usage=$(echo $line | awk '{ print $5 }' | sed 's/%//g')
	echo "file sys name: $file_name, file system usage: $file_usage"
	if [ $file_usage -gt $file_usage_thr ]
	then
	  echo "$file_name: $file_usage" >> file_sys_info.txt
	fi
	sleep 1
done

cont=$(cat file_sys_info.txt | wc -l)
        if [ $cont -gt 0 ]
        then
          echo "some file systems usage are greater than the threshold"
          cat file_sys_info.txt
        fi
