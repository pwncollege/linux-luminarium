function give_flag {
	if [ -f "PWN" ] && [ ! -f "COLLEGE" ]
	then
		fold -s <<< "You may have created a PWN file instead of a COLLEGE file."
		return
	fi

	[ -f "COLLEGE" ] || return
	read VAL < COLLEGE

	if [ "$VAL" != "PWN" ]
	then
		fold -s <<< "You have created the COLLEGE file, but you didn't write the correct value to it. Make sure to write PWN to the COLLEGE file."
		return
	fi

	if [ ! -f /tmp/.redirected ]
	then
		fold -s <<< "You have created the COLLEGE file and wrote the right value to it, but it doesn't look like you did it via input redirection."
		return
	fi

	fold -s <<< "Correct! You successfully redirected 'PWN' to the file 'COLLEGE'! Here is your flag:"
	cat /tmp/.$FLA-$FLB
}

function monitor_redirect {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	TARGET=${BASH_COMMAND#*> }
	[ "$TARGET" == "$BASH_COMMAND" ] && return
	[ "$TARGET" == "COLLEGE" ] || return
	touch /tmp/.redirected
}

trap monitor_redirect DEBUG
PROMPT_COMMAND="give_flag; rm -f /tmp/.redirected; trap monitor_redirect DEBUG"
