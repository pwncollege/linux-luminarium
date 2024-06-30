One of the most essential Linux commands is `cat`.
`cat` is primarily used for displaying the contents of files, like so:

```
hacker@dojo:~$ cat /challenge/DESCRIPTION.md
One of the most essential Linux commands is `cat`.
`cat` is primarily used for displaying the contents of files, like so:
```

The name `cat` stands for con**cat**enate, and it can concatenate multiple files if provided multiple arguments. For example:

```
hacker@dojo:~$ cat myfile
This is my file!
hacker@dojo:~$ cat yourfile
This is your file!
hacker@dojo:~$ cat myfile yourfile
This is my file!
This is your file!
hacker@dojo:~$ cat myfile yourfile myfile
This is my file!
This is your file!
This is my file!
```

If you provide no arguments at all, `cat` will read from the terminal input and output it. We'll explore this functionality in later challenges...

In this challenge, the flag is copied to the `flag` file in your home directory (where your shell starts). Use `cat` to read its contents!
