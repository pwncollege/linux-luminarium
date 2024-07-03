This module will teach you the VERY basics of interacting with the command line!
The _command_ line lets you execute _commands_.
When you launch a terminal, it will execute a command line "shell", which will look like this:

```console
hacker@dojo:~$
```

This is called the "prompt", and it's prompting you to enter a command.
Let's take a look at what's going on here:

- The `hacker` in the prompt is the _username_ of the current user.
  In the pwn.college DOJO environment, this is "hacker".
- In the example above, the `dojo` part of the prompt is the _hostname_ of the machine the shell is on (this reminder can be useful if you are a system administrator who deals with many machines on a daily basis, for example).
  In the example above, the hostname is `dojo`, but in pwn.college, it will be derived from the name of the challenge you're attempting.
- We will cover what `~` means later :-)
- The `$` at the end of the prompt signifies that `hacker` is not an administrative user.
  In much later modules in pwn.college, when you learn to use exploits to become the administrative user, you will see the prompt signify that by printing `#` instead of `$`, and you'll know that you've won!

Anyways, the prompt awaits your command.
Move on to the first challenge to learn how to actually execute commands!
