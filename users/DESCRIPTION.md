Did you think you, `hacker`, are alone in the workspace?
There are MANY users on a typical Linux system!
The full list of users on a Linux system is specified in the `/etc/passwd` file (named so for historical reasons --- it doesn't actually hold passwords anymore).
Here is an example from the dojo container:

```console
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:101:101:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
systemd-network:x:102:103:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:103:104:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
mysql:x:104:105:MySQL Server,,,:/nonexistent:/bin/false
messagebus:x:105:106::/nonexistent:/usr/sbin/nologin
sshd:x:106:65534::/run/sshd:/usr/sbin/nologin
hacker:x:1000:1000::/home/hacker:/bin/bash
```

A lot of users here, and a lot of info!
Each line contains, separated by `:`s, the username, an `x` as a placeholder for where the password _used_ to be (we'll cover where it actually is later), the numerical user ID, the numerical default group ID, long-form user details, the home directory, and the default shell.

We can see the `hacker` user at the bottom.
That's you!
Most of the rest of these users are either there for historical reasons, are service accounts to support various installed software, or some are "utility" accounts (e.g., the `nobody` user is used to ensure that, e.g., some programs run without any special privileges).

One important user is `root`: the system administrator.
The system administrator has obvious security implications: a `hacker` user that can somehow, through various functionalities of Linux, become the `root` user would be able to wreak havoc on the system.
A very frequent goal of hackers breaking into systems is to escalate to `root`, and thus `root` must be defended at all cost!

In this module, we'll explore various user shenanigans, learn the intended ways to switch users to administer the system, and have fun along the way!
