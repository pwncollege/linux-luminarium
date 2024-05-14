function log_arg
{
	ARG="${BASH_COMMAND#* }"
	echo -n "$ARG" > /tmp/.last_arg
}

trap log_arg DEBUG
