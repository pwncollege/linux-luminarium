In this level, you will learn about quoting.
Spaces have special significance in the shell, and there are places where you can't use them spuriously.
Recall our variable setting:

```console
hacker@dojo:~$ VAR=1337
```

That sets the `VAR` variable to `1337`, but what if you wanted to set it to `1337 SAUCE`?
You might try the following:

```console
hacker@dojo:~$ VAR=1337 SAUCE
```

This looks reasonable, but it does not work, for similar reasons to needing to have no spaces around the `=`.
When the shell sees a space, it ends the variable assignment and interprets the next word (`SAUCE` in this case) as a command.
To set `VAR` to `1337 SAUCE`, you need to *quote* it:

```console
hacker@dojo:~$ VAR="1337 SAUCE"
```

Here, the shell reads `1337 SAUCE` as a single token, and happily sets that value to `VAR`.
In this level, you'll need to set the variable `PWN` to `COLLEGE YEAH`.
Good luck!
