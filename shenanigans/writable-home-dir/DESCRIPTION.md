Alright, Zardus has wised up --- why would he have a writable `.bashrc`, anyways?
But a more common scenario is that users on the same system, to make it easier to collaborate, will make their home directories _world writable_.
What's the problem here?

The problem is that a subtlety of Linux file/directory permissions is that anyone with write access to a directory can _move_ and _delete_ files in it.
For example, let's say that Zardus has a world-writable directory for collaboration:

```console
zardus@dojo:~$ mkdir /tmp/collab
zardus@dojo:~$ chmod a+w /tmp/collab
zardus@dojo:~$ echo "do pwn.college" > /tmp/collab/todo-list
```

And then a hacker comes along and does the following, _despite not owning the todo-list file_!

```console
hacker@dojo:~$ ls -l /tmp/collab/todo-list
-rw-r--r-- 1 zardus zardus 15 Jun  6 13:12 /tmp/collab/todo-list
hacker@dojo:~$ rm /tmp/collab/todo-list
rm: remove write-protected regular file '/tmp/collab/todo-list'? y
hacker@dojo:~$ echo "send hacker money" > /tmp/collab/todo-list
hacker@dojo:~$ ls -l /tmp/collab/todo-list
-rw-r--r-- 1 hacker hacker 18 Jun  6 13:12 /tmp/collab/todo-list
hacker@dojo:~$
```

This might seem counterintuitive: `hacker` has no write access to the `todo-list` but the end result is that they can change the content.
But think about it this way: a file's connection to a directory lives in the directory in the end, and users with write access to that directory can mess with it.
Of course, this has security implications when important directories are world-writable.

In this challenge, for convenience, Zardus opened up his home directory:

```console
zardus@dojo:~$ chmod a+w /home/zardus
```

As you know, there are lots of sensitive files in that directory _such as `.bashrc`_!
Can you replicate the previous attack with write access to `/home/zardus` instead of `/home/zardus/.bashrc`?
