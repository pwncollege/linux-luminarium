In the last level, you did `cat flag` to read the flag out of your home directory!
You can, of course, specify `cat`'s arguments as absolute paths:

```console
hacker@dojo:~$ cat /challenge/DESCRIPTION.md
In the last level, you did `cat flag` to read the flag out of your home directory!
You can, of course, specify `cat`'s arguments as absolute paths:
...
```

In this directory, I will not copy it to your home directory, but I will make it readable.
You can read it with `cat` at its absolute path: `/flag`.

----
**FUN FACT:**
`/flag` is where the flag _always_ lives in pwn.college, but unlike in this challenge, you typically can't access that file directly.
