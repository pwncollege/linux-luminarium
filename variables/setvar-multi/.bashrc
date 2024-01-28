function give_flag {
	if [ "$PWN" == "COLLEGE YEAH" ]
	then
		fold -s <<< "You've set the PWN variable properly! As promised, here is the flag:"
		cat "/tmp/.$FLA-$FLB"
	elif [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "You've set the first word of the PWN variable properly, but not the second! Keep trying!"
	elif [ -n "$PWN" ]
	then
		fold -s <<< "You've set the PWN variable, but it does not look like the value is correct. Make sure that the value is COLLEGE!"
	elif [ -n "$pwn" ]
	then
		fold -s <<< "You've set the 'pwn' variable, but what you need to set is the 'PWN' variable! Remember, the variable names are case-sensitive."

	fi
}

PROMPT_COMMAND=give_flag
