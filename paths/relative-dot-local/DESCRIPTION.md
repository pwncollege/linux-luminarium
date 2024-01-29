In this level, we'll practice refering to paths using `.` a bit more.
This challenge will need you to run it from the `/challenge` directory.
Here, things get slightly tricky.

Linux explicitly avoids automatically looking in the current directory when you provide a "naked" path.
Consider the following:

```console
hacker@dojo:~$ cd /challenge
hacker@dojo:/challenge$ run
```

This will *not* invoke /challenge/run.
This is actually a safety measure: if Linux searched the current directory for programs every time you entered a naked path, you could accidentally execute programs in your current directory that happened to have the same names as core system utilities!
As a result, the above commands will yield the following error:

```
bash: run: command not found
```

We'll explore the mechanisms behind this concept later, but in this challenge, will learn how to explicitly use relative paths to launch `run` in this scenario.
The way to do this is to *tell* Linux that you explicitly want to execute a program in the current directory, using `.` like in the previous levels.
Give it a try now!
