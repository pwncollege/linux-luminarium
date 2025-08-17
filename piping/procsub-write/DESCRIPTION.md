Now you've learned that process substitution can make command output appear as files for reading with `<(command)`.
But you can also use process substitution for _writing_ to commands!

You can duplicate data to two files with `tee`:

```console
hacker@dojo:~$ echo HACK | tee THE > PLANET
hacker@dojo:~$ cat THE
HACK
hacker@dojo:~$ cat PLANET
HACK
hacker@dojo:~$
```

And you've used `tee` to duplicate data to a file and a command:

```console
hacker@dojo:~$ echo HACK | tee THE | cat
HACK
hacker@dojo:~$ cat THE
HACK
hacker@dojo:~$
```

But what about duplicating to two commands?
As `tee` says in its manpage, it's designed to write to files and to standard output:

```text
TEE(1)                           User Commands                          TEE(1)

NAME
       tee - read from standard input and write to standard output and files
```

But wait! You just learned that bash can make commands look like files using process substitution!
For writing to a command (output process substitution), use `>(command)`.
If you write an argument of `>(rev)`, bash will run the `rev` command (this command reads data from standard input, reverses its order, and writes it to standard output!), but hook up its input to a temporary named pipe file.
When commands write to this file, the data goes to the standard input of the command:

```console
hacker@dojo:~$ echo HACK | rev
KCAH
hacker@dojo:~$ echo HACK | tee >(rev)
HACK
KCAH
```

Above, the following sequence of events took place:

1. `bash` started up the `rev` command, hooking a named pipe (presumably `/dev/fd/63`) to `rev`'s standard input
2. `bash` started up the `tee` command, hooking a pipe to its standard input, and replacing the first argument to `tee` with `/dev/fd/63`. `tee` never even saw the argument `>(rev)`; the shell _substituted_ it before launching `tee`
3. `bash` used the `echo` builtin to print `HACK` into `tee`'s standard input
4. `tee` read `HACK`, wrote it to standard output, and then wrote it to `/dev/fd/63` (which is connected to `rev`'s stdin)
5. `rev` read `HACK` from its standard input, reversed it, and wrote `KCAH` to standard output

Now it's your turn!
In this challenge, we have `/challenge/hack`, `/challenge/the`, and `/challenge/planet`.
Run the `/challenge/hack` command, and duplicate its output as input to both the `/challenge/the` and the `/challenge/planet` commands!
Scroll back through the previous challenges "Duplicating piped data with tee" and "Process substitution for input" if you need a refresher on this method.

----
**Trivia!**

The observant learner will realize that the following are equivalent:

```console
hacker@dojo:~$ echo hi | rev
ih
hacker@dojo:~$ echo hi > >(rev)
ih
hacker@dojo:~$
```

More than one way to pipe data!
Of course, the second route is way harder to read and also harder to expand.
For example:

```console
hacker@dojo:~$ echo hi | rev | rev
hi
hacker@dojo:~$ echo hi > >(rev | rev)
hi
hacker@dojo:~$
```

That's just silly!
The lesson here is that, while Process Substitution is a powerful tool in your toolbox, it's a very _specialized_ tool; don't use it for everything!
