First, let's look at redirect stdout to files.
You can accomplish this with the `>` character, as so:

```console
hacker@dojo:~$ echo hi > asdf
```

This will redirect the output of `echo hi` (which will be `hi`) to the file `asdf`.
You can then use a program such as `cat` to output this file:

```console
hacker@dojo:~$ cat asdf
hi
```

In this challenge, you must use this input redirection to write the word `PWN` (all uppercase) to the filename `COLLEGE` (all uppercase).
