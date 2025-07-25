if [ -n "$STY" ]; then
	echo "Congratulations! You're inside a screen session!"
	echo "Here's your flag:"
	cat /tmp/.hidden_flag
fi
