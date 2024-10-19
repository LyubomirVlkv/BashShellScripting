#!/bin/bash
# Author: Lyubomir Velikov
# Description: Find file extensions in certain directory and move them to their file extension corresponding folder
# Folders are default as put in the script, can be changed if wanted

Pic="Pictures"
Docs="Documents"
Pyth="PythonFiles"
MusicMov="Music and Movies"
read -p "Please input a folder to be organized:" DIR

for file in "$DIR"/*; do
	if [ -f "$file" ]; then
	  ext="${file##*.}"
	  echo "$ext"
	  if [[ "$ext" == "png" || "$ext" == "jpg" ]]; then
		if [[ ! -d "$DIR/$Pic"  ]]; then
			mkdir "$DIR/$Pic"
	        fi
	     mv "$file" "$DIR/$Pic"
          fi

	  if [[ "$ext" == "py" ]]; then
		if [[ ! -d "$DIR/$Pyth"  ]]; then
                        mkdir "$DIR/$Pyth"
                fi
             mv "$file" "$DIR/PythonFiles"
	  fi

	  if [[ "$ext" == "txt" || "$ext" == "docx" || "$ext" == "doc"* ]]; then
                if [[ ! -d "$DIR/$Docs"  ]]; then
                        mkdir "$DIR/$Docs"
                fi
             mv "$file" "$DIR/$Docs"
	  fi

	  if [[ "$ext" == "mp4" || "$ext" == "mp3" || "$ext" == "avi" ]]; then
                if [[ ! -d "$DIR/$MusicMov"  ]]; then
                        mkdir "$DIR/$MusicMov"
                fi
             mv "$file" "$DIR/$MusicMov"
          fi
        fi
done
