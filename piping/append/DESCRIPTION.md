A common use-case of output redirection is to save off some command results for later analysis.
Often times, you want to do this in _aggregate_: run a bunch of commands, save their output, and grep through it later.
In this case, you might want all that output to keep appending to the same file, but `>` will create a new output file every time, deleting the old contents.

You can redirect input in _append_ mode using `>>` instead of `>`, as so:

```console
hacker@dojo:~$ echo pwn > outfile
hacker@dojo:~$ echo college >> outfile
hacker@dojo:~$ cat outfile
pwn
college
hacker@dojo:$
```

To practice, run `/challenge/run` with an append-mode redirect of the output to the file `/home/hacker/the-flag`.
The practice will write the first half of the flag to the file, and the second half to `stdout` if `stdout` is redirected to the file.
If you properly redirect in append-mode, the second half will be appended to the first, but if you redirect in _truncation_ mode (`>`), the second half will _overwrite_ the first and you won't get the flag!

Go for it now!
