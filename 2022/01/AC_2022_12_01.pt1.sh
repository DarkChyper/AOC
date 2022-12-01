#!/bin/bash

input=$1

elve=0
maxCalories=0
currentElve=1
currentCalories=0

while IFS= read -r line
do
	
	if [ ! -z $line ];
	then
		currentCalories=`expr $currentCalories + $line`
	else
		if [ $currentCalories -gt $maxCalories ];
		then
			
			maxCalories=$currentCalories;
			elve=$currentElve
		fi
		currentElve=`expr $currentElve + 1`
		currentCalories=0
	fi
done < "$input"

echo $maxCalories $elve