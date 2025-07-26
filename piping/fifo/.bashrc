function monitor_redirect {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[[ "$BASH_COMMAND" == */challenge/run* ]] || return
	rm -f /tmp/.redirected
	[[ "$BASH_COMMAND" == *">"* ]] || return
	TARGET=${BASH_COMMAND#*> }
	TARGET=${TARGET// /}

	if [ "$(realpath "$TARGET" 2>/dev/null)" != "/tmp/flag_fifo" ]
	then
		fold -s <<< "WARNING: you are not redirecting /challenge/run to /tmp/flag_fifo, but to $TARGET."
		return
	fi

	if [ ! -p /tmp/flag_fifo ]
	then
		fold -s <<< "WARNING: /tmp/flag_fifo is not a FIFO! Use mkfifo to make it!"
		return
	fi

	fold -s <<< "You're successfully redirecting /challenge/run to a FIFO at /tmp/flag_fifo! Bash will now try to open the FIFO for writing, to pass it as the stdout of /challenge/run. Recall that operations on FIFOs will *block* until both the read side and the write side is open, so /challenge/run will not actually be launched until you start reading from the FIFO!"
	touch /tmp/.redirected
}

trap monitor_redirect DEBUG
PROMPT_COMMAND="trap monitor_redirect DEBUG"
