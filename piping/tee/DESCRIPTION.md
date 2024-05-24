When you pipe data from one command to another, you of course no longer see it on your screen.
This is not always desired: for example, you might want to see the data as it flows through between your commands to debug unintended outcomes (e.g., "why did that second command not work???").

Luckily, there is a solution!
The `tee` command, named after a "T-splitter" from _plumbing_ pipes, duplicates data flowing through your pipes to any number of files provided on the command line.
For example:

```console
hacker@dojo:~$ echo hi | tee pwn college
hi
hacker@dojo:~$ cat pwn
hi
hacker@dojo:~$ cat college
hi
hacker@dojo:~$
```

As you can see, by providing two files to `tee`, we ended up with three copies of the piped-in data: one to stdout, one to the `pwn` file, and one to the `college` file.
You can imagine how you might use this to debug things going haywire:

```console
hacker@dojo:~$ command_1 | command_2
Command 2 failed!
hacker@dojo:~$ command_1 | tee cmd1_output | command_2
Command 2 failed!
hacker@dojo:~$ cat cmd1_output
Command 1 failed: must pass --succeed!
hacker@dojo:~$ command_1 --succeed | command_2
Commands succeeded!
```

Now, you try it!
This process' `/challenge/pwn` must be piped into `/challenge/college`, but you'll need to intercept the data to see what `pwn` needs from you!
