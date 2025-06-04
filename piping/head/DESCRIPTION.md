In your Linux journey, you'll experience situations where you need to grab just the early output of very verbose programs.
For this, you'll reach for `head`!
The `head` command is used to display the first few lines of its input:

```console
hacker@dojo:~$ cat /something/very/long | head
this
is
just
the
first
ten
lines
of
the
file
hacker@dojo:~$
```

By default, it shows the first 10 lines, but you can control this with the `-n` option:

```console
hacker@dojo:~$ cat /something/very/long | head -n 2
this
is
hacker@dojo:~$
```

This challenge's `/challenge/pwn` outputs a bunch of data, and you'll need to pipe it through `head` to grab just the first 7 lines and then pipe them onwards to `/challenge/college`, which will give you the flag if you do this right!
Your solution will be a long composite command with _two_ pipes connecting three commands.
Good luck!