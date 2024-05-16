First, we will learn to list running processes using the `ps` command.
Depending on whom you ask, `ps` either stands for "process snapshot" or "process status", and it lists processes.
By default, `ps` just lists the processes running in your terminal, which honestly isn't very useful:

```console
hacker@dojo:~$ ps
    PID TTY          TIME CMD
    329 pts/0    00:00:00 bash
    349 pts/0    00:00:00 ps
hacker@dojo:~$
```

In the above example, we have the shell (`bash`) and the `ps` process itself, and that's all that's running on that specific terminal.
We also see that each process has a numerical identifier (the _Process ID_, or PID), which is a number that uniquely identifies every running process in a Linux environment.
We also see the terminal on which the commands are running (in this case, the designation `pts/0`), and the total amount of _cpu time_ that the process has eaten up so far (since these processes are very undemanding, they have yet to eat up even 1 second!).

In the majority of cases, this is all that you'll see with a default `ps`.
To make it useful, we need to pass a few arguments.

As `ps` is a very old utility, its usage is a bit of a mess.
There are two ways to specify arguments.

**"Standard" Syntax:** in this syntax, you can use `-e` to list "every" process and `-f` for a "full format" output, including arguments.
These can be combined into a single argument `-ef`.

**"BSD" Syntax:** in this syntax, you can use `a` to list processes for all users, `x` to list processes that aren't running in a terminal, and `u` for a "user-readable" output.
These can be combined into a single argument `aux`.

These two methods, `ps -ef` and `ps aux` result in slightly different, but cross-recognizable output.

Let's try it in the dojo:

```console
hacker@dojo:~$ ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
hacker         1       0  0 05:34 ?        00:00:00 /sbin/docker-init -- /bin/sleep 6h
hacker         7       1  0 05:34 ?        00:00:00 /bin/sleep 6h
hacker       102       1  1 05:34 ?        00:00:00 /usr/lib/code-server/lib/node /usr/lib/code-server --auth=none -
hacker       138     102 11 05:34 ?        00:00:07 /usr/lib/code-server/lib/node /usr/lib/code-server/out/node/entr
hacker       287     138  0 05:34 ?        00:00:00 /usr/lib/code-server/lib/node /usr/lib/code-server/lib/vscode/ou
hacker       318     138  6 05:34 ?        00:00:03 /usr/lib/code-server/lib/node --dns-result-order=ipv4first /usr/
hacker       554     138  3 05:35 ?        00:00:00 /usr/lib/code-server/lib/node /usr/lib/code-server/lib/vscode/ou
hacker       571     554  0 05:35 pts/0    00:00:00 /usr/bin/bash --init-file /usr/lib/code-server/lib/vscode/out/vs
hacker       695     571  0 05:35 pts/0    00:00:00 ps -ef
hacker@dojo:~$
```

You can see here that there are processes running for the initialization of the challenge environment (`docker-init`), a timeout before the challenge is automatically terminated to preserve computing resources (`sleep 6h` to timeout after 6 hours), the VSCode environment (several `code-server` helper processes), the shell (`bash`), and my `ps -ef` command.
It's basically the same thing with `ps aux`:

```
hacker@dojo:~$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
hacker         1  0.0  0.0   1128     4 ?        Ss   05:34   0:00 /sbin/docker-init -- /bin/sleep 6h
hacker         7  0.0  0.0   2736   580 ?        S    05:34   0:00 /bin/sleep 6h
hacker       102  0.4  0.0 723944 64660 ?        Sl   05:34   0:00 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       138  3.3  0.0 968792 106272 ?       Sl   05:34   0:07 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       287  0.0  0.0 717648 53136 ?        Sl   05:34   0:00 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       318  3.3  0.0 977472 98256 ?        Sl   05:34   0:06 /usr/lib/code-server/lib/node --dns-result-order=
hacker       554  0.4  0.0 650560 55360 ?        Rl   05:35   0:00 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       571  0.0  0.0   4600  4032 pts/0    Ss   05:35   0:00 /usr/bin/bash --init-file /usr/lib/code-server/li
hacker      1172  0.0  0.0   5892  2924 pts/0    R+   05:38   0:00 ps aux
hacker@dojo:~$
```

There are many commonalities between `ps -ef` and `ps aux`: both display the user (`USER` column), the PID, the TTY, the start time of the process (`STIME`/`START`), the total utilized CPU time (`TIME`), and the command (`CMD`/`COMMAND`).
`ps -ef` additionally outputs the _Parent Process ID_ (`PPID`), which is the PID of the process that launched the one in question, while `ps aux` outputs the percentage of total system CPU and Memory that the process is utilizing.
Plus, there's a bunch of other stuff we won't get into right now.

Anyways!
Let's practice.
In this level, I have once again renamed `/challenge/run` to a random filename, and this time made it so that you cannot `ls` the `/challenge` directory!
But I also launched it, so can find it in the running process list, figure out the filename, and relaunch it directly for the flag!
Good luck!

**NOTE:** Both `ps -ef` and `ps aux` truncate the command listing to the width of your terminal (which is why the examples above line up so nicely on the right side of the screen.
If you can't read the whole path to the process, you might need to enlarge your terminal (or redirect the output somewhere to avoid this truncating behavior)!
