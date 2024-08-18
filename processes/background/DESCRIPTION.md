You've resumed processes in the _foreground_ with the `fg` command.
You can also resume processes in the _background_ with the `bg` command!
This will allow the process to keep running, while giving you your shell back to invoke more commands in the meantime.

This level's `run` wants to see another copy of itself running, _not suspended_, and using the same terminal.
How?
Use the terminal to launch it, then suspend it, then _background_ it with `bg` and launch another copy while the first is running in the background!

---

**ARCANUM:**
If you're interested in some deeper details, check out how to view the differences between suspended and backgrounded properties!
Allow me to demonstrate.
First, let's suspend a `sleep`:

```console
hacker@dojo:~$ sleep 1337
^Z
[1]+  Stopped                 sleep 1337
hacker@dojo:~$
```

The `sleep` process is now _suspended_ in the background.
We can see this with `ps` by enabling the `stat` column output with the `-o` option:

```console
hacker@dojo:~$ ps -o user,pid,stat,cmd
USER         PID STAT CMD
hacker       702 Ss   bash
hacker       762 T    sleep 1337
hacker       782 R+   ps -o user,pid,stat,cmd
hacker@dojo:~$ 
```

See that `T`?
That means that the process is suspended due to our `Ctrl-Z`.
The `S` in `bash`'s `STAT` column means that `bash` is sleeping while waiting for input.
the `R` in `ps`'s column means that it's actively running, and the `+` means that it's in the foreground!

Watch what happens when we resume `sleep` in the background:

```console
hacker@dojo:~$ bg
[1]+ sleep 1337 &
hacker@dojo:~$ ps -o user,pid,stat,cmd
USER         PID STAT CMD
hacker       702 Ss   bash
hacker       762 S    sleep 1337
hacker      1224 R+   ps -o user,pid,stat,cmd
hacker@dojo:~$
```

Boom!
The `sleep` now has an `S`.
It's sleeping while, well, sleeping, but it's not suspended!
It's also in the _background_ and thus doesn't have the `+`.
