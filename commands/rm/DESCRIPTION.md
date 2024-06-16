Files are all around you.
Like candy wrappers, there'll eventually be too many of them.
In this level, we'll learn to clean up!

In Linux, you **r**e**m**ove files with the `rm` command, as so:

```console
hacker@dojo:~$ touch PWN
hacker@dojo:~$ touch COLLEGE
hacker@dojo:~$ ls
COLLEGE     PWN
hacker@dojo:~$ rm PWN
hacker@dojo:~$ ls
COLLEGE
hacker@dojo:~$
```

Let's practice.
This challenge will create a `delete_me` file in your home directory!
Delete it, then run `/challenge/check`, which will make sure you've deleted it and then give you the flag!
