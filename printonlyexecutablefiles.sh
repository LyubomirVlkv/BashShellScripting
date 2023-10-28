#!/bin/bash
#Author: Lyubomir V.
#Script details: To check whether in the directory where the script is or in user specified directory the files 
# have execution permission / !!!MODIFIED TO SHOW ONLY EXECUTABLE FILES!!!

read -p "Please specify directory [Press enter for current directory]: " directory 

#echo $directory

if [[ $directory == "" ]]
then
	echo "======= Current directory ======="
	for each_file in $(ls)
	do
		if [[ -x $each_file ]]
		then echo "File $each_file is executable"
		#else echo "File $each_file is NOT executable"
		fi
	done
else
	echo "======= User defined directory ======="
	if [[ -d $directory ]]
	then
		echo "Directory exists. Proceeding..."
		for each_file in $(ls $directory)
        	 do
               	  if [[ -x $each_file ]]
                	then echo "File $each_file is executable"
                	#else echo "File $each_file is NOT executable"
                  fi
       		 done
	else
		echo "Directory does not exists or is incorrectly written!"
		exit 1;
	fi
fi
