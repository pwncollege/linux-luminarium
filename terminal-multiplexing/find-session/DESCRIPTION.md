Time for some screen detective work!

If you become an avid screen user, you will inevitably end up with multiple sessions running.
How do you find the right one to reattach to?

Well, we can list them:

```console
hacker@dojo:~$ screen -ls
There are screens on:
        23847.mysession   (Detached)
        23851.goodwork    (Detached)
        23855.morework    (Detached)
3 Sockets in /run/screen/S-hacker.
```

The identifiers of the sessions are the PID of each respective screen process, a dot, and the name of the screen session.
To attach to a specific one, you use its or its PID by giving it as an argument to `screen -r`.

```console
hacker@dojo:~$ screen -r goodwork
```

In this challenge, we've created three screen sessions for you.
One of them contains the flag.
The other two are decoys!

You'll need to check each one until you find it.
Don't forget to detach (Ctrl-A d) before trying the next session!
