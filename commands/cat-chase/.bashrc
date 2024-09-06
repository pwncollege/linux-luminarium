function cd {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on user input
	fold -s <<< "You used 'cd'! In this level, I don't allow you to change the working directory --- you MUST chase pass 'cat' the absolute path of where I put it on the filesystem (which is $(cat /tmp/.flag-path 2>/dev/null)/flag)."
}

fold -s <<< "You cannot use the 'cd' command in this level, and must retrieve the flag by absolute path. Plus, I hid the flag in a different directory! You can find it in the file $(cat /tmp/.flag-path 2>/dev/null)/flag. Go cat it out **without** cding into that directory!"
