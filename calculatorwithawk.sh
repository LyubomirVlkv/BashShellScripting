#!/bin/bash

echo "Welcome to the Calculator!"
read -p "Please enter the first number: " num1
read -p "Please enter the second number: " num2
echo "The options are: 1.Addition 2. Substraction 3.Multiplication 4.Division"
read -p "Please choose 1,2,3 or 4: " choice
# this only checks whether the float is with 0.x, 0.xx won't work ->if [[ $a =~ ^[+-]?[0-9]+$ ]] || [[ $b =~ ^[+-]?[0-9]+$ ]] || [[ $a =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || [[ $b =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
case $choice in
            1)
                echo "You selected addition"
                #echo "The addition of $a and $b is:"
		echo "$num1 $num2" | awk '{ a=$1;b=$2; print "The addition is = " a+b}'
                ;;
            2)
                echo "You selected substraction"
                #echo "The substraction of the $a and $b is: $(bc<<<"scale=3;$a-$b")"
		echo "$num1 $num2" | awk '{ a=$1;b=$2; print "The substraction is = " a-b}'
                ;;
            3)
                echo "You selected multiplication"
                echo "$num1 $num2" | awk '{ a=$1;b=$2; print "The multiplication is = " a*b}'
                ;;
            4)
                echo "You selected division"
                echo "$num1 $num2" | awk '{ a=$1;b=$2; print "The division is = " a/b}'
                ;;
            *)
                echo "You selected invalid option"
                ;;
esac
