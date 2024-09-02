#!/bin/bash

bol=true

while $bol
do
  echo "true"
  bol=false
done

for ((i=1; i<5; i++))
do
 echo $i
done

for j in {1..20}
do
 echo $j
done
