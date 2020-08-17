#!/bin/bash -x
echo xxxxxxxxxxWELCOMExxxxTOxxxxFLIPxxxxCOINxxxxSIMULATORxxxxxxxxxxx

declare -A dictionary
read -p "Enter the range for fliping the coin: " ranges
read -p "Enter the choice:
			1. Singlet
			2. Dublet
			3. Triplet  " choose
function flip() {
	random=$((RANDOM%2))
	echo $random
}

function Percentage()
{
	range=$1
	for keyCount in ${!dictionary[@]}
	do
		dictionary[$keyCount]=$((dictionary[$keyCount]*100/$range))
		echo "Percentage of $keyCount is: ${dictionary[$keyCount]} "
	done
}

function sorted() {
	for k in ${!dictionary[@]}
	do
		echo $k '-' ${dictionary[$k]}
	done |
	sort -rn -k3
}

function triplet() {
	#Constants declared.
	CHECK=1
	#Varriable declared.
	heads=0
	tails=0
	range=$1
	choice=$2
	#logic for the operation.
	for (( count1=1; count1<=range; count1++))
	do
		for (( count2=1; count2<=choice; count2++ ))
		do
			result="$(flip)"
			if (( $result == $CHECK  ))
			then
				coin+=H
				((heads++))
			else
				((tails++))
				coin+=T
			fi
		done
		((dictionary[$coin]++))
#Reassiging the key values in coin.
		coin=""
	done
	echo "Heads count= $heads"
	echo "Tails count= $tails"
	echo ${!dictionary[@]}
	echo ${dictionary[@]}
	echo "$(Percentage $ranges)"
	echo "$(sorted)"
	echo "Winner is:-  $(sorted | head -1)"
}

#For displaying the result of percentage.
if (( $choose > 0 && $choose < 4 ))
then
	echo "$(triplet $ranges $choose)"
else
	echo Invalid Choice
fi
