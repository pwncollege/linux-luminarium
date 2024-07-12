It turns out that the answer to "How does the shell find `ls`?" is fairly simple.
There is a special shell variable, called `PATH`, that stores a bunch of directory paths in which the shell will search for programs corresponding to commands.
If you blank out the variable, things go badly:

```console
hacker@dojo:~$ ls
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
hacker@dojo:~$ PATH=""
hacker@dojo:~$ ls
bash: ls: No such file or directory
hacker@dojo:~$
```

Without a PATH, bash cannot find the `ls` command.

In this level, you will disrupt the operation of the `/challenge/run` program.
This program will **DELETE** the flag file using the `rm` command.
However, if it can't find the `rm` command, the flag will not be deleted, and the challenge will give it to you!
Thus, you must make it so that `/challenge/run` also can't find the `rm` command!

Keep in mind: `/challenge/run` will be a _child process_ of your shell, so you must apply the concepts you learned in [Shell Variables](../variables) to mess with its `PATH` variable!
If you don't succeed, and the flag gets deleted, you will need to restart the challenge to try again!
