The easiest way to chain commands in the shell is using `;`.
In most contexts, `;` functions similarly to how hitting Enter separates lines of commands.
For example:

```console
hacker@dojo:~$ echo COLLEGE > pwn
hacker@dojo:~$ cat pwn
COLLEGE
hacker@dojo:~$
```

Is equivalent to:

```console
hacker@dojo:~$ echo COLLEGE > pwn; cat pwn
COLLEGE
hacker@dojo:~$
```

When you hit Enter after typing a command, the shell executes it, waits for it to complete, and then provides the prompt for the next command. Using a semicolon allows you to input both commands without waiting for the first one to finish before entering the next.

Give it a try now! In this challenge, you need to run `/challenge/pwn` followed by `/challenge/college`, chaining them together with a semicolon.
