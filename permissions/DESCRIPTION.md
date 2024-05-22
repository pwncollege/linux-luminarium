This module will expose you to Linux permissions, which is one of the most important part of your journey going ahead. 

In Linux, files have different permissions or file modes. You can check out a permissions of a file or directory using `ls -l`.
Let's make some files and look at their permissions:

```console
hacker@dojo:~$ mkdir pwn_directory
hacker@dojo:~$ touch college_file
hacker@dojo:~$ ls -l
total 4
-rw-r--r-- 1 yans yans    0 May 22 13:42 college_file
drwxr-xr-x 2 yans yans 4096 May 22 13:42 pwn_directory
```

The first column represents the file type and file permissions.
There are four parts to these file details:

The first character represents the file type. In `pwn_directory`'s case, the `d` indicates that it's a directory, and in `pwn_file`'s case, the `-` represents that it's a normal file.

The next nine characters are the actual access permissions of the file or directory, split into 3 characters denoting the permissions that the user who owns the file (termed the "owner") has to the file, 3 characters denoting the permissions that the group that owns the file (termed the "group") has to the file, and 3 characters denoting the permissions that all other access (e.g., by other users and other groups, termed the "world") has to the file.

Each character of the three represent permission for a different type:

```
r - user can read the file (or list the directory)
w - user can modify the files (or create/delete files in the directory)
x - user can execute the file as a program (or can enter the directory, e.g., using `cd`)
- - nothing 
```

So, let's get started with permissions!
