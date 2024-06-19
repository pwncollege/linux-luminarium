Let's tackle something a bit more advanced!
So far, you've used pipes (`|`) to redirect output from one command to another. But what if you need to send output from multiple commands to a single command?

There's a straightforward method for this: redirecting output from your script!

From the shell's perspective, your script is just another command. This means you can redirect its input and output just like you did with individual commands in the [Piping](../piping) module!
For example, you can redirect script output to a file:

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

All standard redirection methods apply: `>` for stdout, `2>` for stderr, `<` for stdin, `>>` and `2>>` for append-mode redirection, `>&` for redirecting to other file descriptors, and `|` for piping to another command.

In this challenge, you will practice piping (`|`) from your script to another program. Your task is to create a script that executes `/challenge/pwn`, followed by `/challenge/college`, and then pipe the combined output of these commands into a single invocation of `/challenge/solve`!
