function log_arg
{
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	ARG="${BASH_COMMAND#* }"
	echo -n "$ARG" > /tmp/.last_arg
}

trap log_arg DEBUG
PROMPT_COMMAND="trap log_arg DEBUG"
