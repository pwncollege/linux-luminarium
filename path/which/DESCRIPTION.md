When you type the name of a command, _something_ inside one of the many directories listed in your `$PATH` variable is what actually gets executed (of course, unless the command is a builtin!).
But _which_ file, precisely?
You can find out with the aptly-named `which` command:

```console
hacker@dojo:~$ which cat
/bin/cat
hacker@dojo:~$ /bin/cat /flag
YEAH
hacker@dojo:~$
```

Mirroring what the shell does when searching for commands, `which` looks at each directory in `$PATH` in order and prints the first file it finds whose name matches the argument you passed.

In this challenge, we added a `win` command somewhere in your `$PATH`, but it won't give you the flag.
Instead, it's in the same directory as a `flag` file that we made readable by you!
You must find `win` (with the `which` command), and `cat` the flag out of that directory!
