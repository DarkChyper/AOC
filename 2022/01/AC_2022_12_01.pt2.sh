#!/bin/bash

input=$1

currentElve=1
currentCalories=0

caloriesTop1=0
caloriesTop2=0
caloriesTop3=0

elveTop1=0
elveTop2=0
elveTop3=0

while IFS= read -r line
do
	
	if [ ! -z $line ];
	then
		currentCalories=`expr $currentCalories + $line`
	else
		if [ $currentCalories -gt $caloriesTop1 ];
		then
			caloriesTop3=$caloriesTop2
			caloriesTop2=$caloriesTop1
			caloriesTop1=$currentCalories;
			elveTop1=$currentElve
		elif [ $currentCalories -gt $caloriesTop2 ];
		then
			caloriesTop3=$caloriesTop2
			caloriesTop2=$currentCalories;
			elveTop2=$currentElve
		elif [ $currentCalories -gt $caloriesTop3 ];
		then
			caloriesTop3=$currentCalories;
			elveTop3=$currentElve
		fi
		currentElve=`expr $currentElve + 1`
		currentCalories=0

	fi
done < "$input"

echo $caloriesTop1 $elveTop1
echo $caloriesTop2 $elveTop2
echo $caloriesTop3 $elveTop3
echo `expr $caloriesTop1 + $caloriesTop2 + $caloriesTop3`