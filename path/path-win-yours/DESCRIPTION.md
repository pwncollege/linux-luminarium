Recall our example from the previous level:

```console
hacker@dojo:~$ ls /home/hacker/scripts
goodscript	badscript	okayscript
hacker@dojo:~$ PATH=/home/hacker/scripts
hacker@dojo:~$ goodscript
YEAH! This is the best script!
hacker@dojo:~$
```

What we see here, of course, is the `hacker` making the shell more useful for themselves by bringing their own commands to the party.
Over time, you might amass your own elegant tools.
Let's start with `win`!

Previously, the `win` command that `/challenge/run` executed was stored in `/challenge/more_commands`.
This time, `win` does not exist!
Recall the final level of [Chaining Commands](../chaining), and make a shell script called `win`, add its location to the `PATH`, and enable `/challenge/run` to find it!

The functionality of `win` is simple: `/challenge/run` runs as `root`, so `win` can simply `cat /flag`.
Again, the `win` command is the _only_ thing that `/challenge/run` needs, so you can just overwrite `PATH` with that one directory.
Go and `win`!
