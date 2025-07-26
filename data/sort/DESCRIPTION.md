Files (or output lines of commands) aren't always in the order you need them!
The `sort` command helps you organize data.
It reads lines from input (or files) and outputs them in sorted order:

```console
hacker@dojo:~$ cat names.txt
  hack
  the
  planet
  with
  pwn
  college
hacker@dojo:~$ sort names.txt
  college
  hack
  planet
  pwn
  the
  with
hacker@dojo:~$
```

By default, `sort` orders lines alphabetically.
Arguments can change this:

- `-r`: reverse order (Z to A)
- `-n`: numeric sort (for numbers)
- `-u`: unique lines only (remove duplicates)
- `-R`: random order!

In this challenge, there's a file at `/challenge/flags.txt` containing 100 fake flags, with the real flag mixed among them.
When sorted alphabetically, the real flag will be at the end (we made sure of this when generating fake flags).
Go get it!
