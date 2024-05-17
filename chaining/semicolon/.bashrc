function checker {
	if [ -f /tmp/.pwn ] && [ -f /tmp/.college ]
	then
		fold -s <<< "Yes! You chained /challenge/pwn and /challenge/college! Here is your flag:"
		cat /tmp/.$FLA-$FLB
	elif [ -f /tmp/.pwn ]
	then
		fold -s <<< "It looks like you invoked /challenge/pwn, but did not chain it with /challenge/college. Please try again! Remember, you can use ';' to separate two commands and have them run one after the other."
	fi

	rm -f /tmp/.pwn /tmp/.college
}

PROMPT_COMMAND="checker"
