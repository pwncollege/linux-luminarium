You can also _move_ files around with the `mv` command.
The usage is simple:

```console
hacker@dojo:~$ ls
my-file
hacker@dojo:~$ cat my-file
PWN!
hacker@dojo:~$ mv my-file your-file
hacker@dojo:~$ ls
your-file
hacker@dojo:~$ cat your-file
PWN!
hacker@dojo:~$
```

This challenge wants you to move the `/flag` file into `/tmp/hack-the-planet` (do it)!
When you're done, run `/challenge/check`, which will check things out and give the flag to you.
