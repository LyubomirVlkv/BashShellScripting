#!/bin/bash

addition ()
{
  x=$1
  y=$2  
  result=$((x+y))
  echo "Addition of $x and $y is $result"

}

x=4
y=10
addition $x $y

p=5
q=40
addition $p $q
