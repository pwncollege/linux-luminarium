First things first: file ownership.
Every file in Linux is owned by a user on the system.
Most often, in your day-to-day life, that user is the user you log in as every day.

On a shared system (such as in a computer lab), there might be many people with different user accounts, all with their own files in their own home directories.
But even on a non-shared system (such as your personal PC), Linux still has many "service" user accounts for different tasks.

The two most important user accounts are:

1. Your user account! On pwn.college, this is the `hacker` user, regardless of what your username is.
2. `root`. This is the administrative account and, in most security situations, the ultimate prize. If you take over the `root` user, you've almost certainly achieved your hacking objective!

So what?
Well, it turns out that the way that we prevent you from just doing `cat /flag` is by having `/flag` owned by the root user, configure its permissions so that no other user can read it (you will learn how to do that later), and configure the actual challenge to run as the `root` user (you will learn how to do this later as well).
The result is that when you do `cat /flag`, you get:

```console
hacker@dojo:~$ ls -l /flag
-r-------- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$ cat /flag
cat: /flag: Permission denied
hacker@dojo:~$
```

Here, you can see that the flag is owned by the root user (the first `root` in that line) and the root group (the second `root` in that line).
When we try to read it as the `hacker` user, we are denied.
However, if we were `root` (a hacker's dream!), we would have no problem reading this file:

```console
root@dojo:~# cat /flag
pwn.college{demo_flag}
root@dojo:~#
```

Interestingly, we can change the ownership of files!
This is done via the `chown` (**ch**ange **own**er) command:

```
chown [username] [file]
```

Typically, `chown` can only be invoked by the `root` user.
Let's pretend that we're root again (that never gets old!), and watch a typical use of `chown`:

```console
root@dojo:~# mkdir pwn_directory
root@dojo:~# touch college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root root    0 May 22 13:42 college_file
drwxr-xr-x 2 root root 4096 May 22 13:42 pwn_directory
root@dojo:~# chown hacker college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 hacker root    0 May 22 13:42 college_file
drwxr-xr-x 2 root   root 4096 May 22 13:42 pwn_directory
root@dojo:~#
```

`college_file`'s owner has been changed to the `hacker` user, and how `hacker` can do with it whatever `root` had been able to do with it!
If this was the `/flag` file, that means that the `hacker` user would be able to read it!

In this level, we will practice changing the owner of the `/flag` file to the `hacker` user, and then the flag.
For this challenge only, I made it so that you can use chown to your heart's content as the `hacker` user (again, typically, this requires you to be `root`).
Use this power wisely and chown away!
