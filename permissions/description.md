This module will expose you to Linux permissions, which is one of the most important part of your journey going ahead. 

In Linux, files have different permissions or file modes. You can check out a permissions of a file or directory using `ls -l`:
```
hacker@dojo:~$ ls -l ~/.config
total 20
-rw-r--r-- 1 hacker hacker  500 Jan 18 09:06 QtProject.conf
drwx------ 2 hacker hacker 4096 Jan 18 09:06 Thunar
drwxr-xr-x 2 hacker hacker 4096 Jan 18 09:06 code-server
drwxr-xr-x 2 hacker hacker 4096 Jan 18 09:06 gtk-3.0
drwxr-xr-x 7 hacker hacker 4096 Aug 18  2022 xfce4
```
The permissions character often looks like this:

```
drwxr-xr-x
```

There are four parts to a file permissions:

The first part is the filetype, which is the first character in the sequence, in this case it's a `d` to indicate that it's a directory. Otherwise, you would commonly see a `-` for a regular file.

The next three part is the actual permissions. The permissions are grouped into 3 bits each. The first 3 is owner's permissions, middle 3 is group permissions and then public permissions. 

Each character represent a different permissions
```
r - user can read the file
w - user can write into and modify the files
x - user can execute the file as a program 
- - nothing 
```
