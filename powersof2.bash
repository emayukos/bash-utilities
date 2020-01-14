#!/bin/bash

# this script allows command-line beginners or users to learn the powers of 2
# for those who haven't already, without the extra effort.


# prompts user to input the anwser to 2^random # between 5-40
# once each time you open a new terminal window

# write function for calculating power of 2, then call it to 
# compare its result with users answer

# script generates random number with different command 
# depending on what OS it's running on
# can run in Linux or mac OS

# SYS=$(uname -s)

# if [ $SYS == "Darwin" ]; then
# 	exponent=$(jot -r 1 5 40)
# elif [ $SYS == "Linux" ]; then
# 	exponent=$(shuf -i 5-40 -n 1)
# else
# 	echo "script won't work on this OS"
# 	exit 1

# decided to use a list rather than a range so user can modify this script
# and choose which powers they want to learn first
# in my case, I wanted to know the powers up to 16, as well as powers
# divisible by 10


# command that prints list of powers in specified range
# if [ $# = 0 ]; then echo "You didn't specify any arguments."; exit; fi

# command that lets you change the range min-max



min=5
max=10



exponent=$(jot -r 1 $min $max)
answer=$((2**$exponent))  # mathematical expressions must be in $(())

read -p "What is 2^$exponent: " number  # can declare variable here

# if exponent is 10, 20, 30 , or 40, alternate answer is 1MB, 1KB, ...
# if exponent is divisible by 10
if [ $(($exponent % 10)) == 0 ]; then
	# get what kind of 
	case $exponent in
		10)
			alt="1KB"
			;;
		20)
			alt="1MB"
			;;
		30)
			alt="1GB"
			;;
		40)
			alt="1TB"
			;;
		*)
			echo "should never get to this point"
			exit 1
			;;
	esac

	if [ "$number" == "$answer" ] || [ "$number" == "$alt" ]; then
		echo "Correct. 2^$exponent = $answer or ${alt}."
	else
		echo "Nope. 2^$exponent = $answer or ${alt}."
	fi
else
	if [ "$number" == "$answer" ]; then
		echo "Correct."
	else
		echo "Nope. 2^$exponent = ${answer}."
	fi
fi


