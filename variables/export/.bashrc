function check_values {
	if [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "You've set the PWN variable to the proper value!"
	elif [ -n "$PWN" ]
	then
		fold -s <<< "You've set the PWN variable, but it does not look like the value is correct. Make sure that the value is COLLEGE!"
	fi

	if [ "$COLLEGE" == "PWN" ]
	then
		fold -s <<< "You've set the COLLEGE variable to the proper value!"
		touch /tmp/.college_pwn
	elif [ -n "$COLLEGE" ]
	then
		fold -s <<< "You've set the COLLEGE variable, but it does not look like the value is correct. Make sure that the value is PWN!"
		rm -f /tmp/.college_pwn
	fi
}

PROMPT_COMMAND=check_values
