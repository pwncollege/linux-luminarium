function give_flag {
	read CORRECT < /challenge/read_me
	if [ "$PWN" == "$CORRECT" ]
	then
		fold -s <<< "You've set the PWN variable properly! As promised, here is the flag:"
		cat "/tmp/.$FLA-$FLB"
	elif [ -n "$PWN" ]
	then
		fold -s <<< "You've set the PWN variable, but not to the correct value. Set it to the contents of /challenge/read_me by using input redirection and the 'read' builtin."
		/challenge/.reset_read_me
	else
		/challenge/.reset_read_me
	fi
}

function check_subshell {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[ "$BASH_SUBSHELL" -eq 0 ] && return
	fold -s <<< 'You appear to be invoking a subshell. This could be, for example, because you are doing something like `PWN=$(echo COLLEGE)`. Instead, you must use `read` to set the PWN variable.' >&2
	exit
}

function check_read {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[ "${BASH_COMMAND// *}" != "read" ] && return

	if [[ "$BASH_COMMAND" != *PWN* ]]
	then
		fold -s <<< "You invoked 'read', but it looks like you didn't specify the PWN variable! You will need to read the input into the PWN variable to pass this level."
	elif [[ "$BASH_COMMAND" != *"<"* ]]
	then
		fold -s <<< "You invoked 'read', but it looks like you didn't redirect a file to it! Please fix that using stdin (<) redirection."
	elif [[ "$BASH_COMMAND" != *read_me* ]]
	then
		fold -s <<< "You invoked 'read', but it looks like you didn't redirect the /challenge/read_me file to it!"
	fi
}

set -T
trap 'check_subshell; check_read' debug
PROMPT_COMMAND="give_flag; trap 'check_subshell; check_read' debug"
