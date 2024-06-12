Let's start with printing variables out.
The `/challenge/run` program will not, and cannot, give you the flag, but that's okay, because the flag has been put into the variable called "FLAG"!
Just have your shell print it out!

You can accomplish this using a number of ways, but we'll start with `echo`.
This command just prints stuff.
For example:

```console
hacker@dojo:~$ echo Hello Hackers!
Hello Hackers!
```

You can also print out variables with `echo`, by prepending the variable name with a `$`.
For example, there is a variable, `PWD`, that always holds the current working directory of the current shell.
You print it out as so:

```console
hacker@dojo:~$ echo $PWD
/home/hacker
```

Now it's your turn.
Have your shell print out the `FLAG` variable and solve this challenge!
