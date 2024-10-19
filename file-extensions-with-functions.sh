#!/bin/bash
# Author: Lyubomir Velikov
# Description: Find file extensions in certain directory and move them to their file extension corresponding folder
# Folders are default as put in the script, can be changed if wanted
# May have performance issues based on the number of files in the directory, it is going over them twice because of the two fors, needs to be fixed

#Uses function to get the file and move them
Pic="Pictures"
Docs="Documents"
Pyth="PythonFiles"
MusicMov="Music and Movies"
read -p "Please input a folder to be organized:" DIR

move_files() {

for file in "$1"/*; do
 if [ -f "$file" ]; then
          ext="${file##*.}"
	  for arg in "${@:3}"; do
		echo "$arg"
           if [[ "$ext" == "$arg" ]]; then
               if [[ ! -d "$1/$2"  ]]; then
                        mkdir "$1/$2"
                fi
             mv "$file" "$1/$2"
         fi
	 done
 fi
done

}

move_files "$DIR" "$Pic" "jpg" "png" "jpeg" "gif" "pjp" "svg"
