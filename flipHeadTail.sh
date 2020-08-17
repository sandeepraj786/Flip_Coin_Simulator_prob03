#!/bin/bash -x
echo xxxxxxxxxxWELCOMExxxxTOxxxxFLIPxxxxCOINxxxxSIMULATORxxxxxxxxxxx

check=1
random=$((RANDOM%2))
if (( random == check ))
then
	echo HEAD
else
	echo TAIL
fi
