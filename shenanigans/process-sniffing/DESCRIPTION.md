Poor Zardus; you've hacked him pretty heavily.
But he's wisened up and secured his home directory!
Game over?

Not quite!
One of the things that people often don't think about when there are multiple accounts on one computer is what kind of data their _command invocations_ leak.
Remember, when you do `ps aux`, you get:

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

But what would happen if one of the arguments of one of those commands was something sensitive, like the flag or a password?
This happens, and nefarious users sharing the same machine (or somehow otherwise listing processes on it) can steal that data and use it!

That's what this challenge explores.
Zardus is using an automation script, passing his account password to it as an argument.
Zardus is also allowed to use `sudo` (and, thus, to `sudo cat /flag`!).
Steal the password, log in to Zardus' account (recall the `su` command from the [Users and Groups](../users) module), and get that flag!
