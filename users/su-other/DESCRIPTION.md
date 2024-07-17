With no arguments, `su` will start a root shell (after authenticating with root's password).
However, you can also give a username as an argument to switch to _that_ user instead of root.
For example:

```console
hacker@dojo:~$ su some-user
Password:
some-user@dojo:~$
```

Awesome!
In this level, you must switch to the `zardus` user and then run `/challenge/run`.
Zardus' password is `dont-hack-me`.
Good luck!
