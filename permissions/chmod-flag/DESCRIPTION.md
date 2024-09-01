So now we're well-versed in ownership.
Let's talk about the other side of the coin: file permissions.
Recall our example:

```console
hacker@dojo:~$ mkdir pwn_directory
hacker@dojo:~$ touch college_file
hacker@dojo:~$ ls -l
total 4
-rw-r--r-- 1 hacker hacker    0 May 22 13:42 college_file
drwxr-xr-x 2 hacker hacker 4096 May 22 13:42 pwn_directory
hacker@dojo:~$
```

As a reminder, the first character there is the file type.
The next nine characters are the actual access permissions of the file or directory, split into 3 characters denoting permissions for the owning user (now you understand this!), 3 characters denoting the permissions for the owning group (now you understand this as well!), and 3 characters denoting the permissions that all other access (e.g., by other users and other groups) has to the file.

Each character of the three represent permission for a different type:

```
r - user/group/other can read the file (or list the directory)
w - user/group/other can modify the files (or create/delete files in the directory)
x - user/group/other can execute the file as a program (or can enter the directory, e.g., using `cd`)
- - nothing 
```

For `college_file` above, the `rw-r--r--` permissions entry decodes to:

- `r`: the user that owns the file (user `hacker`) can read it
- `w`: the user that owns the file (user `hacker`) can write to it
- `-`: the user that owns the file (user `hacker`) _cannot_ execute it
- `r`: users in the group that owns the file (group `hacker`) can read it
- `-`: users in the group that owns the file (group `hacker`) _cannot_ write to it
- `-`: users in the group that owns the file (group `hacker`) _cannot_ execute it
- `r`: all other users can read it
- `-`: all other users _cannot_ write to it
- `-`: all other users _cannot_ execute it

Now, let's look at the default permissions of `/flag`:

```console
hacker@dojo:~$ ls -l /flag
-r-------- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$
```

Here, there is only one bit set: the `r`ead permission for the owning user (in this case, root).
Members of the owning group (the `root` group) and all other users have no access to the file.

You might be wondering how the `chgrp` levels worked, if there is no group access to the file.
Well, for those levels, I set the permissions differently:

```console
hacker@dojo:~$ ls -l /flag
-r--r----- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$
```

The group had access!
That is why `chgrp`ing the file enabled you to read the file.

Anyways!
Like ownership, file permissions can also be changed.
This is done with the `chmod` (**ch**ange **mod**e) command.
The basic usage for chmod is:

```
chmod [OPTIONS] MODE FILE
```

You can specify the `MODE` in two ways: as a modification of the existing permissions mode, or as a completely new mode to overwrite the old one.

In this level, we will cover the former: modifying an existing mode.
`chmod` allows you to tweak permissions with the mode format of `WHO`+/-`WHAT`, where `WHO` is user/group/other and `WHAT` is read/write/execute.
For example, to add _read_ access for the owning _user_, you would specify a mode of `u+r`.
`w`rite and e`x`ecute access for the `g`roup and the `o`ther (or `a`ll the modes) are specified the same way.
More examples:

- `u+r`, as above, adds read access to the user's permissions
- `g+wx` adds write and execute access to the group's permissions
- `o-w` _removes_ write access for other users
- `a-rwx` removes all permissions for the user, group, and world

So:

```console
root@dojo:~# mkdir pwn_directory
root@dojo:~# touch college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root root    0 May 22 13:42 college_file
drwxr-xr-x 2 root root 4096 May 22 13:42 pwn_directory
root@dojo:~# chmod go-rwx *
root@dojo:~# ls -l
total 4
-rw------- 1 hacker root    0 May 22 13:42 college_file
drwx------ 2 root   root 4096 May 22 13:42 pwn_directory
root@dojo:~#
```

In this challenge, you must change the permissions of the `/flag` file to read it!
Typically, you need to have write access to the file in order to change its permissions, but I have made the `chmod` command all-powerful for this level, and you can `chmod` anything you want even though you are the `hacker` user.
This is an ultimate power.
The `/flag` file is owned by root, and you can't change that, but you can make it readable.
Go and solve this!
