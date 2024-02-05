Often, when shell users want to read a file into an environment variable, they do something like:

```console
hacker@dojo:~$ FLAG=$(cat /flag)
hacker@dojo:~$ echo $FLAG
pwn.college{XXXYYYZZZ}
```

This works, but it represents what grouchy hackers call a ["Useless Use of Cat"](https://porkmail.org/era/unix/award#cat).
That is, running a whole other program just to read the file is a waste.
It turns out that you can just use the powers of the shell!



```console
hacker@dojo:~$ 
```
