Okay, Zardus has wised up!
No more sharing the home directory: despite the reduced convenience, Zardus has moved to sharing `/tmp/collab`.
He's made that directory world-readable and has started a list of evil commands to remember!

```console
zardus@dojo:~$ mkdir /tmp/collab
zardus@dojo:~$ chmod 777 /tmp/collab
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
Also remember from [Comprehending Commands](../commands) that files can _link_ to other files.
What happens if `hacker` replaces `evil-commands.txt` with a symbolic link to some sensitive file that `zardus` can write to?
Chaos and shenanigans!

You _know_ the file to link to.
Pull off the attack, and get `/flag` (which, for this level, Zardus can read again!).

----
**HINT:**
You'll need to run `/challenge/victim` twice: once to get `cat /flag` written to where you want, and once to trigger it!
