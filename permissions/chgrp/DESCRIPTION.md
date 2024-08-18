Sharing is caring, and sharing is built into Linux's design.
Files have both an owning _user_ and _group_.
A group can have multiple users in it, and a user can be a member of multiple groups.

You can check what groups you are part of with the `id` command:

```console
hacker@dojo:~$ id
uid=1000(hacker) gid=1000(hacker) groups=1000(hacker)
hacker@dojo:~$
```

Here, the `hacker` user is _only_ in the `hacker` group.
The most common use-case for groups is to control access to different system resources.
For example, "Practice Mode" in pwn.college grants you root access to allow better debugging and so on.
This is handled by giving you an extra group when you launch in practice mode:

```console
hacker@dojo:~$ id
uid=1000(hacker) gid=1000(hacker) groups=1000(hacker),27(sudo)
hacker@dojo:~$
```

A typical main user of a typical Linux desktop has a _lot_ of groups.
For example, this is Zardus' desktop:

```console
zardus@yourcomputer:~$ id
uid=1000(zardus) gid=1000(zardus) groups=1000(zardus),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),100(users),106(netdev),114(bluetooth),117(lpadmin),120(scanner),995(docker)
zardus@yourcomputer:~$
```

All these groups give Zardus the ability to read CDs and floppy disks (who does that anymore?), administer the system, play music, draw to the video monitor, use bluetooth, and so on.
Often, this access control happens via group ownership on the filesystem!
For example, graphical output can be done via the special `/dev/fb0` file:

```console
zardus@yourcomputer:~$ ls -l /dev/fb0
crw-rw---- 1 root video 29, 0 Jun 30 23:42 /dev/fb0
zardus@yourcomputer:~$
```

This file is a special _device file_ (type `c` means it is a "character device"), and interacting with it results in changes to the display output (rather than changes to disk storage, as for a normal file!).
Zardus' user account on his machine can interact with it because the the file has a group ownership of `video`, and Zardus is a member of the `video` group.

No such luck for the `/flag` file in the dojo, though!
Consider the following:

```console
hacker@dojo:~$ id
uid=1000(hacker) gid=1000(hacker) groups=1000(hacker)
hacker@dojo:~$ ls -l /flag
-r--r----- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$ cat /flag
cat: /flag: Permission denied
hacker@dojo:~$
```

Here, the flag file is owned by the root user and the root group, and the `hacker` user is neither the `root` user nor a member of the `root` group, so the file cannot be accessed.
Luckily, group ownership can be changed with the `chgrp` (**ch**ange **gr**ou**p**) command!
Unless you have write access to the file _and_ membership in the new group, this typically requires root access, so let's check it out as root:

```console
root@dojo:~# mkdir pwn_directory
root@dojo:~# touch college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root root    0 May 22 13:42 college_file
drwxr-xr-x 2 root root 4096 May 22 13:42 pwn_directory
root@dojo:~# chgrp hacker college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root hacker    0 May 22 13:42 college_file
drwxr-xr-x 2 root root   4096 May 22 13:42 pwn_directory
root@dojo:~#
```

In this level, I have made the flag readable by whatever group owns it, but this group is currently `root`.
Luckily, I have also made it possible for you to invoke `chgrp` as the `hacker` user!
Change the group ownership of the flag file, and read the flag!
