The answer to "How does the shell find `ls`?" is quite straightforward. It relies on a special shell variable called `PATH`, which contains a list of directory paths where the shell searches for executable programs corresponding to commands. If this variable is unset or incorrectly configured, the shell cannot locate commands as expected:

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

In this level, your goal is to disrupt the operation of the `/challenge/run` program. This program attempts to **DELETE** the flag file using the`rm`command. However, if the `rm` command cannot be found in the `PATH`, the flag will not be deleted, and you will successfully obtain it!

To achieve this, you need to manipulate the PATH variable so that `/challenge/run` also cannot find the `rm` command. Remember, `/challenge/run` runs as a child process of your shell, so you'll apply the concepts you learned in the [Shell Variables](../variables) module to modify its `PATH` variable.

If the flag gets deleted unintentionally, simply restart the challenge to try again!
