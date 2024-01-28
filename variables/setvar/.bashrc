function give_flag {
	if [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "You've set the PWN variable properly! As promised, here is the flag:"
		cat "/tmp/.$FLA-$FLB"
	elif [ -n "$PWN" ]
	then
		fold -s <<< "You've set the PWN variable, but it does not look like the value is correct. Make sure that the value is COLLEGE!"
	fi
}

PROMPT_COMMAND=give_flag
