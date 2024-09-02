#!/bin/bash
# Author: Lyubomir Velikov
# Description: Get data from CSV File
# Date: 20/01/2024

read -p "Please input the csv file" csv_file

if [[ ! -f $csv_file ]]; then
	echo "CSV File not found: $csv_file"
	exit 1
fi

display_menu() {
    echo "==== Employee Data Analysis ===="
    echo "1. Display Employee List"
    echo "2. Find Highest Salary"
    echo "3. Count Employees by Department"
    echo "4. Quit"
}

while true; do

display_menu

read -p "Enter your choice: " choice

case $choice in

  1)
	echo "Employee list"
	tail $csv_file | tail -n +2
	;;
  2)
	highest_salary_person=$(tail -n +2 $csv_file | sort -t ',' -k4 -n -r | head -n 1 | cut -d',' -f2)
	highest_salary=$(tail -n +2 $csv_file | sort -t ',' -k4 -n -r | head -n 1 | cut -d',' -f4)
	echo "The highest salary person is: $highest_salary_person with \$ $highest_salary"
	;;
  3)
	echo "Employees by Department: "
     	awk -F',' 'NR > 1 { departments[$3]++ } END { for (dept in departments) print dept, departments[dept] }' "$csv_file"
	;;
  4)
	echo "Thank you for using the program. Exiting..."
	exit 1
	;;
  *)
	echo "Invalid choice. Please enter a number between 1 and 4"
	;;
esac

echo "-------------------------------------"

done

#print Processing line: $0, this is to help troubleshoot the awk command
