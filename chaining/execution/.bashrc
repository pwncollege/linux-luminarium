function check_cmd {
	BCMD=($BASH_COMMAND)

	[ "${#BCMD[@]}" -eq 1 ] || return 0
	[ -f "${BCMD[0]}" ] || return 0
	FILE=$(realpath ${BCMD[0]})
	[[ "$FILE" == $HOME/* ]] || return 0
	touch /tmp/.good_launch
}

set -T
PROMPT_COMMAND="trap check_cmd debug; rm -f /tmp/.good_launch"
