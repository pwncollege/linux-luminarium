function monitor_chaining {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return
	local last_cmd=$(history 1 | sed 's/^ *[0-9]* *//')
	rm -f /tmp/.and
	[[ "$last_cmd" == *"&&"* ]] && touch /tmp/.and
}

trap monitor_chaining DEBUG
PROMPT_COMMAND="trap monitor_chaining DEBUG; rm -f /tmp/.chained; $PROMPT_COMMAND"
