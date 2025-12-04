Okay, Zardus has wised up!
No more sharing the home directory: despite the reduced convenience, Zardus has moved to sharing `/tmp/collab`.
He's made that directory world-writable and has started a list of evil commands to remember!

```console
zardus@dojo:~$ mkdir /tmp/collab
zardus@dojo:~$ chmod a+w /tmp/collab
zardus@dojo:~$ echo "rm -rf /" > /tmp/collab/evil-commands.txt
```

In this challenge, when you run `/challenge/victim`, Zardus will add `cat /flag` to that list of commands:

```console
hacker@dojo:~$ /challenge/victim

Username: zardus
Password: **********
zardus@dojo:~$ echo "cat /flag" >> /tmp/collab/evil-commands.txt
zardus@dojo:~$ exit
logout

hacker@dojo:~$
```

Recall from the previous level that, having write access to `/tmp/collab`, the `hacker` user can replace that `evil-commands.txt` file.
Also remember from [Comprehending Commands](/linux-luminarium/commands) that files can _link_ to other files.
What happens if `hacker` replaces `evil-commands.txt` with a symbolic link to some sensitive file that `zardus` can write to?
Chaos and shenanigans!

You _know_ the file to link to.
Pull off the attack, and get `/flag` (which, for this level, Zardus can read again!).

----
**HINT:**
You'll need to run `/challenge/victim` twice: once to get `cat /flag` written to where you want, and once to trigger it!

**Is `/tmp` dangerous to use???**
Despite the attack shown here, `/tmp` can be used safely.
The directory _is world-writable_, but has a special permission bit set:

```console
hacker@dojo:~$ ls -ld /tmp
drwxrwxrwt 29 root root 1056768 Jun  6 14:06 /tmp
hacker@dojo:~$
```

That `t` bit at the end is the _sticky_ bit.
The sticky bit means that the directory only allows the owners of files to rename or remove files in the directory.
It's designed to prevent this exact attack!
The problem in this challenge, of course, was that Zardus did not enable the sticky bit on `/tmp/collab`.
This would have closed the hole in this specific case:

```console
zardus@dojo:~$ chmod +t /tmp/collab
```

Of course, shared resources like world-writable directories are still dangerous.
Much later, in the [Race Conditions](/system-security/race-conditions) of the Green Belt material, you'll see many ways in which such resources can cause security issues!
