function check_cmd {
	if [ "$BASH_SUBSHELL" -eq 0 ]
	then
		rm -f /tmp/subshell

		if [[ "${BASH_COMMAND}" =~ ^[a-zA-Z0-9_]*=\$(.*)$ ]] || [[ "${BASH_COMMAND}" =~ ^[a-zA-Z0-9_]*=\`.*\`$ ]]
		then
			echo ${BASH_COMMAND%%=*} > /tmp/dstvar
		else
			rm -f /tmp/dstvar
		fi
	else
		touch /tmp/subshell
	fi
}

set -T
PROMPT_COMMAND="trap check_cmd debug"
