#!/bin/bash

# this script allows command-line beginners or users to learn the powers of 2
# for those who haven't already, without the extra effort.
# prompts user to input the answer to 2 to the power of a random number
# between the hard-coded range once each time you open a new terminal window

min=5
max=10

exponent=$(jot -r 1 $min $max)
answer=$((2**$exponent))  

read -p "What is 2^$exponent: " number  

# if exponent is 10, 20, 30 , or 40, alternate answer is 1MB, 1KB, ...
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


