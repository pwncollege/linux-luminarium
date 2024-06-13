Next, let's learn about `?`.
When it encounters a `?` character in any argument, the shell will treat it as **single-character** wildcard.
This works like `*`, but only matches _one_ character.
For example:

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ touch file_b
hacker@dojo:~$ touch file_cc
hacker@dojo:~$ ls
file_a	file_b	file_cc
hacker@dojo:~$ echo Look: file_?
Look: file_a file_b
hacker@dojo:~$ echo Look: file_??
Look: file_cc
```

Now, practice this yourself!
Starting from your home directory, change your directory to `/challenge`, but use the `?` character instead of `c` and `l` in the argument to `cd`!
Once you're there, run `/challenge/run` for the flag!
