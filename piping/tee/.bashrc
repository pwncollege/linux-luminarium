function set_secret {
	rm -f /tmp/.pwn-secret
	echo $RANDOM > /tmp/.pwn-secret
}

PROMPT_COMMAND="set_secret; $PROMPT_COMMAND"
