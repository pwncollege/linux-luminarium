Just like you can redirect _output_ from programs, you can redirect input _to_ programs!
This is done using `<`, as so:

```
hacker@dojo:~$ echo yo > message
hacker@dojo:~$ cat message
yo
hacker@dojo:~$ rev < message
oy
```

You can do interesting things with a lot of different programs using input redirection!
In this level, we will practice using `/challenge/run`, which will require you to redirect the `PWN` file to it and have the `PWN` file contain the value `COLLEGE`!
To write that value to the `PWN` file, recall the prior challenge on output redirection from `echo`!
