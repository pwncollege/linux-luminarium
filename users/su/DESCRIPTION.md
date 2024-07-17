In the previous level, you used the `/challenge/getroot` program to become the `root` user.
Becoming root is a fairly common action that Linux users take, and your typical Linux installation obviously does not have `/challenge/getroot`.
Instead, there are two utilities used for this purposes: `su` and `sudo`.

In this challenge, we will cover the older one, `su` (the **s**witch **u**ser command).
This is not typically used to elevate to root access anymore, but it is an elegant utility from a more civilized time, and we'll cover it first.

`su` is a setuid binary:

```console
hacker@dojo:~$ ls -l /usr/bin/su
-rwsr-xr-x 1 root root 232416 Dec 1 11:45 /usr/bin/su
hacker@dojo:~$
```

Because it has the SUID bit set, `su` runs as root.
Running as root, it can start a root shell!
Of course, `su` is discerning: before allowing the user to elevate privileges to root, it checks to make sure that the user knows the root password:

```console
hacker@dojo:~$ su
Password: 
su: Authentication failure
hacker@dojo:~$
```

This check against the root password is what obsoletes `su`.
Modern systems very rarely have root passwords, and different mechanisms (that we will learn later) are used to grant administrative access.

But THIS challenge (and only this challenge) _does_ have a root password.
That password is `hack-the-planet`, and you must provide it to `su` to become root!
Go do that, and read the flag!
