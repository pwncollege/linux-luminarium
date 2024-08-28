function give_flag {
	if [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "You've set the PWN variable properly! As promised, here is the flag:"
		cat "/tmp/.$FLA-$FLB"
	elif [ "${PWN^^}" == "COLLEGE" ]
	then
		fold -s <<< "You've set the PWN variable, but it looks like you didn't set it to COLLEGE with all uppercase letters. This variable check is case-sensitive!"
	elif [ -n "$PWN" ]
	then
		fold -s <<< "You've set the PWN variable, but it does not look like the value is correct. Make sure that the value is COLLEGE!"
	elif [ -n "$pwn" ]
	then
		fold -s <<< "You've set the 'pwn' variable, but what you need to set is the 'PWN' variable! Remember, the variable names are case-sensitive."

	fi
}

PROMPT_COMMAND=give_flag
