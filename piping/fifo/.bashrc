function monitor_redirect {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[[ "$BASH_COMMAND" == /challenge/run* ]] || return
	[[ "$BASH_COMMAND" == *">"* ]] || return
	TARGET=${BASH_COMMAND#*> }
	TARGET=${TARGET// /}

	if [ "$TARGET" != "/tmp/flag_fifo" ]
	then
		fold -s <<< "WARNING: you are not redirecting /challenge/run to /tmp/flag_fifo, but to $TARGET."
		return
	fi

	if [ ! -p /tmp/flag_fifo ]
	then
		fold -s <<< "WARNING: /tmp/flag_fifo is not a fifo! Use mkfifo to make it!"
		return
	fi

	fold -s <<< "You're successfully redirecting /challenge/run to a fifo at /tmp/flag_fifo! Bash will now try to open the fifo for writing, to pass it as the stdout of /challenge/run. Recall that operations on fifos will *block* until both the read side and the write side is open, so /challenge/run will not actually be launched until you start reading from the fifo!"
}

trap monitor_redirect DEBUG
PROMPT_COMMAND="trap monitor_redirect DEBUG"
