Many see shells as shallow: simply small wrappers around useful utilities.
This is true to an extent, but ignoring the power of the shell can hamper you when you try to accomplish complex things in Linux.
In this module, we will delve into using the _shell_ itself, as opposed to the commandline tools that Linux offers.

Some questions that we will explore:

- How would you print out a file without using `cat`, `more`, and friends?
- How to do math, number base conversion (especially relevant for raw memory operations and hacking).
- How to implement complex functionality right in your shell!

We will learn how to use the functionality built into the shell itself, often termed *builtins*.
Builtins are invoked just like commands, but the shell handles them internally instead of launching other programs.
You can get a list of shell builtins by running the *builtin* `help`, as so:

```console
hacker@dojo:~$ help
```

That will list a bunch of builtins.
You can get help on a specific one by passing it to the `help` builtin.
Let's look at a builtin that we've already used earlier, `export`!

```console
hacker@dojo:~$ help export
export: export [-fn] [name[=value] ...] or export -p
    Set export attribute for shell variables.
    
    Marks each NAME for automatic export to the environment of subsequently
    executed commands.  If VALUE is supplied, assign VALUE before exporting.
    
    Options:
      -f	refer to shell functions
      -n	remove the export property from each NAME
      -p	display a list of all exported variables and functions
    
    An argument of `--' disables further option processing.
    
    Exit Status:
    Returns success unless an invalid option is given or NAME is invalid.
```

Some good information!
Don't forget to read the `help` on your builtins when you need info.
No, go forth and learn!
