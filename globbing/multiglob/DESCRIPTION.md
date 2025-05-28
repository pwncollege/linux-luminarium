So far, you've specified one glob at a time, but you cna do more!
Bash supports the expansion of multiple globs in a single word.
For example:

```console
hacker@dojo:~$ cat /*fl*
pwn.college{YEAH}
hacker@dojo:~$
```

What happens above is that the shell looks for all files in `/` that start with _anything_ (including nothing), then have an `f` and an `l`, and end in _anything_ (including `ag`, which makes `flag`).

Now you try it.
We put a few happy, but diversely-named files in `/challenge/files`.
Go `cd` there and run `/challenge/run`, providing a single argument: a short (3 characters or less) globbed word with two `*` globs in it that covers every word that contains the letter `p`.
