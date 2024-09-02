#!/bin/bash
clear
echo "This is a simple calculator with Bash shell scripting"
read -p "Enter the first number: " a
read -p "Enter the second number: " b
echo "=========Welcome to the Menu=========="
echo "Please select from the following: "
echo "1. Addition"
echo "2. Substraction"
echo "3. Multiplication"
echo "4. Division"
read -p "Enter your option: " option
echo "======================================="
if [[ $a =~ ^[+-]?[0-9]+$ ]] || [[ $b =~ ^[+-]?[0-9]+$ ]] || [[ $a =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || [[ $b =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
then
         case $option in
            1)
                echo "You selected addition"
                echo "The addition of $a and $b is: $(bc<<<"scale=3;$a+$b")"
                ;;
            2)
                echo "You selected substraction"
                echo "The substraction of the $a and $b is: $(bc<<<"scale=3;$a-$b")"
                ;;
            3)
                echo "You selected multiplication"
                echo "The multiplication of $a and $b is: $(bc<<<"scale=3;$a*$b")"
                ;;
            4)
                echo "You selected division"
                echo "The division of $a and $b is: $(bc<<<"scale=3;$a/$b")"
                ;;
            *)
                echo "You selected invalid option"
                ;;
esac

else
        echo "The first unput: $a and/or the second input: $b is not an integer"
fi
