In the olden days, a typical Linux system had a root password that administrators would use to `su` to root (after logging into their account with their normal account password).
But root passwords are a pain to maintain, they (or their hashes!) can leak, and they don't lend themselves well to larger environments (e.g., fleets of servers).
To address this, in recent decades, the world has moved from administration via `su` to administration via `sudo` (**su**peruser **do**).

Unlike `su`, which defaults to launching a shell as a specified user, `sudo` defaults to running a command as root:

```console
hacker@dojo:~$ whoami
hacker
hacker@dojo:~$ sudo whoami
root
hacker@dojo:~$
```

Or, more relevant to getting flags:

```console
hacker@dojo:~$ grep hacker /etc/shadow
grep: /etc/shadow: Permission denied
hacker@dojo:~$ sudo grep hacker /etc/shadow
hacker:$6$Xro.e7qB3Q2Jl2sA$j6xffIgWn9xIxWUeFzvwPf.nOH2NTWNJCU5XVkPuONjIC7jL467SR4bXjpVJx4b/bkbl7kyhNquWtkNlulFoy.:19921:0:99999:7:::
hacker@dojo:~$
```

Also unlike `su`, rather than authenticating via password, `sudo` relies on policies that it checks to determine the user's authorization run things as root.
These policies are defined in `/etc/sudoers`, and though it's mostly out of scale for our purposes, there are plenty of [resources](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file) for learning about this!

So, the world has moved to `sudo` and has (for the purposes of system administration) left `su` behind.
In fact, even pwn.college's Practice Mode works by giving you `sudo` access to elevate privileges!

In this level, we will give you `sudo` access, and you will use it to read the flag.
Nice and easy!

----
**NOTE:**
After this level, we will enable Practice Mode!
When you launch a challenge in Practice Mode (by clicking the `Practice` button instead of the `Start` button), the resulting container will give you full `sudo` access to allow you to introspect and debug to your heart's content, but of course with a placeholder flag.
