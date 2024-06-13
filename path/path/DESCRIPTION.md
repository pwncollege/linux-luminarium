It turns out that the answer to "How does the shell find `ls`?" is fairly simple.
There is a special shell variable, called `PATH`, that stores a bunch of directory paths in which the shell will search for programs corresponding to commands.
If you blank you the variable, things go badly:

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

In this level, you must make it so that `/challenge/run` also can't find the `ls` command!
Keep in mind: `/challenge/run` will be a _child process_ of your shell, so you must apply the concepts you learned in [Shell Variables](../variables) to mess with its `PATH` variable!
