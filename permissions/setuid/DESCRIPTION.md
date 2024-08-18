There are many cases in which non-root users need elevated access to do certain system tasks.
The system admin can't be there to give them the password every time a user wanted to do a task that only root/sudoers can do.
The "Set User ID" (SUID) permissions bit allows the user to run a program as the owner of that program's file.

This is actually the exact mechanism used to let the challenge programs you run read the flag or, outside of pwn.college, to enable system administration tools such as `su`, `sudo`, and so on.
The permission of a file with SUID list look like this:

```console
hacker@dojo:~$ ls -l /usr/bin/sudo
-rwsr-xr-x 1 root root 232416 Dec 1 11:45 /usr/bin/sudo
hacker@dojo:~$
```

The `s` part in place of the executable bit means that the program is executable _with SUID_.
It means that, regardless of what user runs the program (as long as they have executable permissions), the program will execute as the owner user (in this case, the `root` user).

As the owner of a file, you can set a file's SUID bit by using chmod:

```
chmod u+s [program]
```

But be careful!
Giving the SUID bit to an executable owned by root can give attackers a possible attack vector to become root.
You will learn more about this [in the Program Misuse module](/fundamentals/program-misuse/).

Now, we are going to let you add the SUID bit to the `/challenge/getroot` program in order to spawn a root shell for you to `cat` the flag yourself!
