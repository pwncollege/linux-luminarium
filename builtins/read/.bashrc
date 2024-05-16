function give_flag {
	if [ "$PWN" == "COLLEGE" ] && [ "$READ_NAME" == "PWN" ]
	then
		fold -s <<< "You've set the PWN variable properly! As promised, here is the flag:"
		cat "/tmp/.$FLA-$FLB"
	elif [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "You've set the first PWN variable properly, but you seem to not have used 'read' to do it. Please set it using 'read'"
	elif [ -n "$PWN" ]
	then
		fold -s <<< "You've set the PWN variable, but it does not look like the value is correct. Make sure that the value is COLLEGE!"
	elif [ -n "$pwn" ]
	then
		fold -s <<< "You've set the 'pwn' variable, but what you need to set is the 'PWN' variable! Remember, the variable names are case-sensitive."

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
	READ_NAME="${BASH_COMMAND//* }"

	if [ "$READ_NAME" != "PWN" ]
	then
		fold -s <<< "You invoked 'read', but it looks like you didn't specify the PWN variable! You will need to read the input into the PWN variable to pass this level."
	fi
}

set -T
trap 'check_subshell; check_read' debug
PROMPT_COMMAND="give_flag; trap 'check_subshell; check_read' debug"
