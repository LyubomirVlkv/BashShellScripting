#!/bin/bash
#Author: Lyubomir Velikov
#Description a simple task managing script - add, remove, mark as done and list tasks

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

tasks=()

while true
do
display_menu
read -p "Please enter your choice(1-5): " choice

case $choice in

  1)
    read -p "Please enter the new task: " new_task
    # not needed for now -> it is to remove spaces new_task="${new_task%"${new_task##*[![:space:]]}"}"
    tasks+=("$new_task")
    echo "New task - $new_task - has been added to the manager"
    ;;

  2)
    if [[ "${#tasks[@]}" -eq 0 ]]; then
       echo "No tasks in the manager"
    else
     echo "Tasks: "
     for ((i=0; i<"${#tasks[@]}"; i++));do
         echo "$((i+1)). ${tasks[i]}"
     done
    fi
    ;;

  3)
    read -p "Please enter which task would you like to mark as complete: " complete_task
    if [[ $complete_task -ge 1 ]] && [[ $complete_task -le ${#tasks[@]} ]]
    then
	compl_task=${tasks[$((complete_task - 1))]}
	tasks[$((complete_task - 1))]="$compl_task(Completed)"
	echo "Task has been marked as completed: $compl_task"
    else
      print_in_red "Invalid number"
    fi
    ;;
  4)
    read -p "Please choose which task would you like to delete: " del_num
    if [[ $del_num -ge 1 ]] && [[ $del_num -le ${#tasks[@]} ]]
    then
	delete_task=${tasks[$((del_num - 1))]}
	unset tasks[$((del_num - 1))]
	tasks=(${tasks[@]})
        echo "Task deleted: $delete_task"
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
