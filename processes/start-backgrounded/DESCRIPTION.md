Of course, you don't have to suspend processes to background them: you can start the backgrounded right off the bat!
It's easy; all you have to do is append a `&` to the command, like so:

```console
hacker@dojo:~$ sleep 1337 &
[1] 1771
hacker@dojo:~$ ps -o user,pid,stat,cmd
USER         PID STAT CMD
hacker      1709 Ss   bash
hacker      1771 S    sleep 1337
hacker      1782 R+   ps -o user,pid,stat,cmd
hacker@dojo:~$ 
```

Here, `sleep` is actively running in the background, _not_ suspended.
Now it's your turn to practice!
Launch `/challenge/run` backgrounded for the flag!
