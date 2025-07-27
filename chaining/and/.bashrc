function monitor_chaining {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return
	local last_cmd=$(history 1 | sed 's/^ *[0-9]* *//')
	rm -f /tmp/.and
	if [[ "$last_cmd" == *"&&"* ]]; then
		touch /tmp/.and
	elif [[ "$last_cmd" == *"first-success"* && "$last_cmd" == *"second"* ]]; then
		fold -s <<< "WARNING: You ran both programs, but you need to chain them with && (not semicolons or separately)!"
	fi
}

trap monitor_chaining DEBUG
PROMPT_COMMAND="trap monitor_chaining DEBUG; rm -f /tmp/.chained; $PROMPT_COMMAND"
