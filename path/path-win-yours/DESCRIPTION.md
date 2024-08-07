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

----
**Hint:**
`/challenge/run` runs as root and will call `win`. Thus, `win` can simply cat the flag file.
Again, the `win` command is the _only_ thing that `/challenge/run` needs, so you can just overwrite `PATH` with that one directory.
But remember, if you do that, your `win` command won't be able to find `cat`.

You have three options to avoid that:

1. Figure out where the `cat` program is on the filesystem. It _must_ be in a directory that lives in the `PATH` variable, so you can print the variable out (refer to [Shell Variables](../variables) to remember how!), and go through the directories in it (recall that the different entries are separated by `:`), find which one has `cat` in it, and invoke `cat` by its absolute path.
2. Set a `PATH` that has the old directories _plus_ a new entry for wherever you create `win`.
3. Use `read` (again, refer to [Shell Variables](../variables)) to read `/flag`. Since `read` is a builtin functionality of `bash`, it is unaffected by `PATH` shenanigans.

Now, go and `win`!
