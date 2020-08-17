#!/bin/bash -x
echo xxxxxxxxxxWELCOMExxxxTOxxxxFLIPxxxxCOINxxxxSIMULATORxxxxxxxxxxx

CHECK=1
heads=0
tails=0

read -p "Enter the number you want to flip the coin:" range
#declaring a dictionary to store the count
declare -A singlet

function flip() {
	random=$((RANDOM%2))
	echo $random
}

for (( count=0; count<range; count++))
do
	result="$(flip)"
	if (( $result == $CHECK  ))
	then
 		echo "HEAD"
		singlet[$count]=H
		((heads++))
	else
		echo "TAIL"
		singlet[$count]=T
		((tails++))
	fi
done
echo "Heads count= $heads"
echo "Tails count= $tails"
echo ${singlet[@]}

#calculating the percentage of heads and tails
headPercent=$(($heads*100))
headPercentage=$(($headPercent/$range))
	echo "The Head Percentage is :" $headPercentage "%"

tailPercent=$(($tails*100))
tailPercentage=$(($tailPercent/$range))
	echo "The Tail Percentage is :" $tailPercentage "%"
