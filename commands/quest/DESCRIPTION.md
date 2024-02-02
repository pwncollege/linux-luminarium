With your prior exploration of `cd` and `cat`, we're amost ready to play a little game!
All we need is `ls`...

`ls` is short for `list`, and it lists the contents of directories.
By default, `ls` lists files in whatever directory is your shell's current working directory.
For example:

```console
hacker@dojo:~$ cd /
hacker@dojo:/$ ls
bin   challenge  etc   home  lib32  libx32  mnt  proc  run   srv  tmp  var
boot  dev        flag  lib   lib64  media   opt  root  sbin  sys  usr
```

That's a lot of contents!
One day, you will be quite familiar with them, but already, you might recognize the `flag` file and the `challenge` directory.

You can also list the contents of directories other than your current working directory, by passing them as an argument:

```console
hacker@dojo:~$ ls /
bin   challenge  etc   home  lib32  libx32  mnt  proc  run   srv  tmp  var
boot  dev        flag  lib   lib64  media   opt  root  sbin  sys  usr
```

Neat!
In this challenge, I have *hidden the flag*!
Here, you will use `ls` and `cat` to follow my breadcrumbs and find it!
Here's how it'll work:

1. `ls` your current directory. There'll be a file named HINT or CLUE or something along those lines!
2. `cat` that file to read the clue!
3. `cd` to the next directory pointed to by the clue.
4. Eventually, you'll find a directory with the `flag` file. `cat` it out to solve the challenge!

Good luck!
