The Linux command line interface is actually a sophisticated programming language with which you can write actual programs!
Because the command line interface is colloquially referred to as a "shell", programs written in this language are referred to as "shell scripts".
When you're using the command line, you are basically writing a shell script line by line!

Like most programming languages, the shell supports variables.
This challenge is designed to help you explore variables in your shell, starting with printing them out.
The `/challenge/run` program will not, and cannot, give you the flag, but that's okay, because the flag has been put into the variable called "FLAG"!
Just have your shell print it out!

You can accomplish this using a number of ways, but we'll start with `echo`.
This command just prints stuff.
For example:

```
$ echo Hello Hackers!
Hello Hackers!
```

You can also print out variables with `echo`, by prepending the variable name with a `$`.
For example, there is a variable, `PWD`, that always holds the current working directory of the current shell.
You print it out as so:

```
$ echo $PWD
/home/hacker
```

Now it's your turn.
Have your shell print out the `FLAG` variable and solve this challenge!
