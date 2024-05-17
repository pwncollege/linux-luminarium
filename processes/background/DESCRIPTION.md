You have learned to interrupt processes with `Ctrl-C`, but there are less drastic measures you can use to get your terminal back!
You can _suspend_ processes to the background with `Ctrl-Z`.
In this level, we'll explore how this works and, in the next level, we'll figure out how to _resume_ those suspended processes!

This level's `run` wants to see another copy of itself running _and using the same terminal_.
How?
Use suspend to launch it, then suspend it, then launch another copy while the first is suspended!

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
