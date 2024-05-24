Let's try something a bit trickier!
You've piped output between programs with `|`, but so far, this has just been between one command's output and a different command's input.
But what if you wanted to send the output of several programs to one command?
There are a few ways to do this, and we'll explore a simple one here: redirecting output from your script!

As far as the shell is concerned, your script is just another command.
That means you can redirect its input and output just like you did for commands in the [Piping](../piping) module!
For example, you can write it to a file:

```console
hacker@dojo:~$ cat script.sh
echo PWN
echo COLLEGE
hacker@dojo:~$ bash script.sh > output
hacker@dojo:~$ cat output
PWN
COLLEGE
hacker@dojo:~$
```

All of the various redirection methods work: `>` for stdout, `2>` for stderr, `<` for stdin, `>>` and `2>>` for append-mode redirection, `>&` for redirecting to other file descriptors, and `|` for piping to another command.

In this level, we will practice piping (`|`) from your script to another program.
Like before, you need to create a script that calls the `/challenge/pwn` command followed by the `/challenge/college` command, and pipe the output of the script into a single invocation of the `/challenge/solve` command!
