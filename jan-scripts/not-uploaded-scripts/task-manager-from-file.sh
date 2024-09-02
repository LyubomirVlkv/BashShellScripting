#!/bin/bash
#Author: Lyubomir Velikov
#Description a simple task managing script - add, remove, mark as done and list tasks

read -p "Please input which file/new file would you like to use as a file manager: " file

#check if file exists, if not create the file
touch $file

display_menu(){
echo "============= Welcome to task manager! ===================="
echo "1. Add Task"
echo "2. List tasks"
echo "3. Mark task as completed"
echo "4. Delete task"
echo "5. Quit"
}

print_in_red(){
echo -e "\033[0;31m$1\033[0m"
}


list_items(){
if [[ -s $file  ]]; then
 echo "Tasks:"
 cat $file  | nl -w2 -s". "
else
  echo "No tasks in the file: $file"
fi

}

line_in_file=$(wc -l tasks.txt | awk '{print $1}')

while true
do
display_menu
read -p "Please enter your choice(1-5): " choice

case $choice in

  1)
    read -p "Please enter the new task: " new_task
    echo "$new_task" >> $file
    echo "New task - $new_task - has been added to the manager"
    ;;

  2)
    list_items
    ;;

  3)
    list_items
    read -p "Please enter which task would you like to mark as complete: " complete_task
    if [[ $complete_task -ge 1 ]] && [[ $complete_task -le line_in_file ]]
    then
	sed -i $complete_task"s/^/ - [Completed] /" "$file"
	echo "Task has been marked as completed"
    else
       print_in_red "Invalid number"
    fi
    ;;
  4)
    list_items
    read -p "Please choose which task would you like to delete: " del_num
    if [[ $del_num -ge 1 ]] && [[ $del_num -le $line_in_file ]]
    then
        sed -i $del_num"d" "$file"
        echo "Task deleted"
    else
	print_in_red "Invalid number"
    fi
    ;;

  5)
    echo "Exiting the program...."
    exit 0
    ;;
  *)
    print_in_red "Invalid choice! Enter a number (1-5)\n"
    ;;
esac
echo "--------------------------------"
done
