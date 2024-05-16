You've launched processes, you've viewed processes, now you will learn to _terminate_ processes!
In Linux, this is done using the aggressively-named `kill` command.
With default options (which is all we'll cover in this level), `kill` will terminate a process in a way that gives it a chance to get its affairs in order before ceasing to exist.

You use `kill` by providing it with a process identifier (the `PID` from `ps`), as so:

```
hacker@dojo:~$ sleep 1337 &
hacker@dojo:~$ ps
    PID TTY          TIME CMD
 318 pts/0    00:00:00 bash
 342 pts/0    00:00:00 sleep
 359 pts/0    00:00:00 ps
hacker@dojo:~$ kill 342
[1]+  Terminated              sleep 1337
hacker@dojo:~$ ps
    PID TTY          TIME CMD
 318 pts/0    00:00:00 bash
 359 pts/0    00:00:00 ps
```

Now, it's time to terminate your first process!
In this challenge, `/challenge/run` will refuse to run while `/challenge/dont_run` is running!
You must find the `dont_run` process and `kill` it.
If you fail, `pwn.college` will disavow all knowledge of your mission.
Good luck.
