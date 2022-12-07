#!/bin/bash

input=$1

score=0

declare -A points

points["a"]=1
points["b"]=2
points["c"]=3
points["d"]=4
points["e"]=5
points["f"]=6
points["g"]=7
points["h"]=8
points["i"]=9
points["j"]=10
points["k"]=11
points["l"]=12
points["m"]=13
points["n"]=14
points["o"]=15
points["p"]=16
points["q"]=17
points["r"]=18
points["s"]=19
points["t"]=20
points["u"]=21
points["v"]=22
points["w"]=23
points["x"]=24
points["y"]=25
points["z"]=26
points["A"]=27
points["B"]=28
points["C"]=29
points["D"]=30
points["E"]=31
points["F"]=32
points["G"]=33
points["H"]=34
points["I"]=35
points["J"]=36
points["K"]=37
points["L"]=38
points["M"]=39
points["N"]=40
points["O"]=41
points["P"]=42
points["Q"]=43
points["R"]=44
points["S"]=45
points["T"]=46
points["U"]=47
points["V"]=48
points["W"]=49
points["X"]=50
points["Y"]=51
points["Z"]=52

while IFS= read -r line
do
	part1=${line:0:${#line}/2}
	part2=${line:${#line}/2}

	for (( i=0; i<${#part1}; i++ )); do
  		for (( j=0; j<${#part2}; j++ )); do
  			if [ "${part1:$i:1}" ==  "${part2:$j:1}" ];
			then
				score=`expr $score + ${points[${part1:$i:1}]}`
				
	    		break 2
	    	fi
		done
	done

done < "$input"

echo "Result is : " $score