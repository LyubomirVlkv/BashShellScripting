#!/bin/bash
#Author: Lyubomir Velikov
#Description - This script is to search filese by extension from a certain directory

read -p "Please input the folder name: " dir
read -p "Please input the extension name: " ext

if [[ -z $dir ]] || [[ -z $ext ]]
then
  echo "Please enter a dir or ext! Cannot have empty directory or extension."
  exit -10
fi

if [[ ! -d $dir ]]
then
  echo "Directory $dir not found"
  exit -11
fi

cd $dir || exit -12

file_count=0

# print extensions ls | awk -F "." '{ print $2 }'

for file in *.$ext
do
  if [[ -f $file ]]
  then
  echo $file
  ((file_count++))
  fi
done

echo "Total number of files with $ext extension is $file_count"
