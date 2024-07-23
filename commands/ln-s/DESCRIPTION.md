If you use Linux (or computers) for any reasonable length of time to do any real work, you will eventually run into some variant of the following situation: you want two programs to access the same data, but the programs expect that data to be in two different locations.
Luckily, Linux provides a solution to this quandry: _links_.

Links come in two flavors: _hard_ and _soft_ (also known as _symbolic_) links.
We'll differentiate the two with an analogy:

- A **hard** link is when you address your appartment using multiple addresses that all lead directly to the same place (e.g., `Apt 2` vs `Unit 2`).
- A **soft** link is when you move appartments and have the postal service automatically forward your mail from your old place to your new place.

In a filesystem, a file is, conceptually, an address at which the contents of that file live.
A hard link is an alternate address that indexes that data --- accesses to the hard link and accesses to the original file are completely identical, in that they immediate yield the necessary data.
A soft/symbolic link, instead, contains the original file name.
When you access the symbolic link, Linux will realize that it is a symbolic link, read the original file name, and then (typically) automatically access that file.
In most cases, both situations result in accessing the original data, but the mechanisms are different.

Hard links sound simpler to most people (case in point, I explained it in one sentence above, versus two for soft links), but they have various downsides and implementation gotchas that make soft/symbolic links, by far, the more popular alternative.

In this challenge, we will learn about symbolic links (also also known as _symlinks_).
Symbolic links are created with the `ln` command with the `-s` argument, like so:

```console
hacker@dojo:~$ cat /tmp/myfile
This is my file!
hacker@dojo:~$ ln -s /tmp/myfile /home/hacker/ourfile
hacker@dojo:~$ cat ~/ourfile
This is my file!
hacker@dojo:~$
```

You can see that accessing the symlink results in getting the original file contents!
Also, you can see the usage of `ln -s`.
Note that the original file path comes _before_ the link path in the command!

A symlink can be identified as such with a few methods.
For example, the `file` command, which takes a filename and tells you what type of file it is, will recognize symlinks:

```console
hacker@dojo:~$ file /tmp/myfile
/tmp/myfile: ASCII text
hacker@dojo:~$ file ~/ourfile
/home/hacker/ourfile: symbolic link to /tmp/myfile
hacker@dojo:~$
```

Okay, now you try it!
In this level the flag is, as always, in `/flag`, but `/challenge/catflag` will instead read out `/home/hacker/not-the-flag`.
Use the symlink, and fool it into giving you the flag!
