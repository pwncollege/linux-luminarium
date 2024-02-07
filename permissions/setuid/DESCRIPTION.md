There are many cases in which non-root users need elevated access to do certain system task. The system admin can't be there to give them the password every time a user wanted to do a task that only root/sudoers can do. The Set User ID allows the user to run a program as the owner of that program.

The permission of a file with SUID list would often look like this:

```
-rwsr-xr-x 1 root root 47032 Dec 1 11:45 /usr/bin/passwd
```

The `s` part here means that the program is a "special" one. It means that the user can essentially execute this program as the owner (root).

As an root/sudoers, you can easily set a program to have SUID bit by using chmod:

```
chmod u+s [program]
```

But be careful! Giving suid bit to an executable can give attackers a possible attack vector to become root. So be mindful about it. You can learn more about it here `https://gtfobins.github.io/`.

For the final chall, we are going to let you add the SUID bit to the `getroot` executable in order to spawn a root shell for you to `cat` the final flag!
