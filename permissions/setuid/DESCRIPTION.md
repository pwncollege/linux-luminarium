There are many cases in which non-root users need elevated access to do certain system tasks.
The system admin can't be there to give them the password every time a user wanted to do a task that only root/sudoers can do.
The "Set User ID" (SUID) bit allows the user to run a program as the owner of that program's file.

The permission of a file with SUID list look like this:

```
-rwsr-xr-x 1 root root 232416 Dec 1 11:45 /usr/bin/sudo
```

The `s` part in place of the executable bit means that the program is executable _with SUID_.
It means that the user can essentially execute this program as the owner (in this case, the `root` user).

As the owner of a file, you can set a file's SUID bit by using chmod:

```
chmod u+s [program]
```

But be careful!
Giving the SUID bit to an executable can give attackers a possible attack vector to become root.
You will learn more about this [in the Program Misuse module](/fundamentals/program-misuse/).

Now, we are going to let you add the SUID bit to the `/challenge/getroot` executable in order to spawn a root shell for you to `cat` the flag!
