import os
import shutil

# Directory to organize
dir_path = input("Please provide path to directory: ")
print(dir_path)
Pic="Pictures"
Docs="Documents"
Pyth="PythonFiles"
MusicMov="Music and Movies"

# Loop through all files in the directory
for filename in os.listdir(dir_path):
    file_path = os.path.join(dir_path, filename)
    if os.path.isfile(file_path):
        ext = filename.split('.')[-1]  # Get file extension
        print(ext)
        if ext == "png" or ext == "jpg":
            ext_folder = os.path.join(dir_path, Pic)
        elif ext == "txt" or ext.startswith("doc"):
            ext_folder = os.path.join(dir_path, Docs)
        elif ext == "py":
            ext_folder = os.path.join(dir_path, Pyth)
        elif ext == "mov" or ext == "mp4" or ext == "avi":
            ext_folder = os.path.join(dir_path, MusicMov)
        else:
            print("Files with predefined extensions not found!")
            continue

        os.makedirs(ext_folder, exist_ok=True)  # Create folder for the extension
        shutil.move(file_path, os.path.join(ext_folder, filename))  # Move file
