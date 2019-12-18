#!/bin/bash

# Structure:
# $1 should be a flag with two letters, 
# the first being the base of the number being converted (-d, -h, -b, -o)
# the second is the base of the number to convert to 
# $2 is the number to convert 

# Example: ./base_convert -db 3   will convert the decimal (-d for DECIMAL) number 3 to binary (-b for BINARY). It should result in 11

# Error checking
if [ $# = 0 ]; then echo "You didn't specify any arguments."; exit; fi

flags=$1
number=$2 # number to convert

if ! [[ $number =~ ^[0-9A-F]+$ ]]; then # must be an integer
		echo "second argument must be an integer"
		exit 1  # terminate script
fi


case $flags in
	# don't need to give both ibase and obase for any conversion 
	# involving decimal numbers, since these settings default to 10.
	# give obase when converting from decimal
	# give ibase when converting to decimal
	# dec to binary
	-db)
		echo "obase=2; $number" | bc
		;;
	# binary to dec
	-bd)
		echo "ibase=2; $number" | bc
		;;
	# dec to hex
	-dh)
		echo "obase=16; $number" | bc
		;;

	# hex to dec
	-hd)
		echo "ibase=16; $number" | bc
		;;

	# dec to octal
	-do)
		echo "obase=8; $number" | bc
		;;
	# octal to dec
	-od)
		echo "ibase=8; $number" | bc
		;;

	# do need to give obase and ibase for conversions not involving decimal
	# always put obase before ibase 

	# binary to hex
	-bh)
		echo "obase=16; ibase=2; $number" | bc
		;;
	# hex to binary
	-hb)
		echo "obase=2; ibase=16; $number" | bc
		;;

	# binary to octal
	-bo)
		echo "obase=8; ibase=2; $number" | bc
		;;
	# octal to binary
	-ob)
		echo "obase=2; ibase=8; $number" | bc
		;;

	# octal to hex
	-oh)
		echo "obase=16; ibase=8; $number" | bc
		;;

	# hex to octal
	-ho)
		echo "obase=8; ibase=16; $number" | bc
		;;

	# insert two's complement

	*)
		echo "invalid flags"
		;;

	esac
