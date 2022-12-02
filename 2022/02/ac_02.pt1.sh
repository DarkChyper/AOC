#!/bin/bash

input=$1

myscore=0

while IFS= read -r line
do
	case $line in
		'A X')
			myscore=`expr $myscore + 1 + 3`
			;;
		'A Y')
			myscore=`expr $myscore + 2 + 6`
			;;
		'A Z')
			myscore=`expr $myscore + 3 + 0`
			;;
		'B X')
			myscore=`expr $myscore + 1 + 0`
			;;
		'B Y')
			myscore=`expr $myscore + 2 + 3`
			;;
		'B Z')
			myscore=`expr $myscore + 3 + 6`
			;;
		'C X')
			myscore=`expr $myscore + 1 + 6`
			;;
		'C Y')
			myscore=`expr $myscore + 2 + 0`
			;;
		'C Z')
			myscore=`expr $myscore + 3 + 3`
			;;
		'')
			;;
	esac
	
done < "$input"

echo $myscore