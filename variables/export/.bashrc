function check_values {
	if [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "You've set the PWN variable to the proper value!"
		touch /tmp/.pwn-right
		rm -f /tmp/.pwn-wrong
	elif [ -n "$PWN" ]
	then
		fold -s <<< "You've set the PWN variable, but it does not look like the value is correct. Make sure that the value is COLLEGE!"
		rm -f /tmp/.pwn-right
		touch /tmp/.pwn-wrong
	elif [ -z "$PWN" ]
	then
		rm -f /tmp/.pwn-right
		rm -f /tmp/.pwn-wrong
	fi

	if [ "$COLLEGE" == "PWN" ]
	then
		fold -s <<< "You've set the COLLEGE variable to the proper value!"
		touch /tmp/.college-right
		rm -f /tmp/.college-wrong
	elif [ -n "$COLLEGE" ]
	then
		fold -s <<< "You've set the COLLEGE variable, but it does not look like the value is correct. Make sure that the value is PWN!"
		rm -f /tmp/.college-right
		touch /tmp/.college-wrong
	elif [ -z "$COLLEGE" ]
	then
		rm -f /tmp/.college-right
		rm -f /tmp/.college-wrong
	fi
}

PROMPT_COMMAND=check_values
