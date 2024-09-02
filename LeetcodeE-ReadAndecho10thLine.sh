#!/bin/bash
# YOU NEED FILE.TXT TO EXIST TO RUN THIS SCRIPT. ENTER THE COMPLETE PATH BELOW BEFORE RUNNING
input="/path-to-file/file.txt"
cnt=0
while IFS= read -r line
#cnt=0
do
        ((cnt += 1))
        if [ "$cnt" -eq 10 ]
        then
        echo "$line"
        fi
done < "$input"
