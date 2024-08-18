When you enter a password for `su`, it compares it against the stored password for that user.
These passwords _used_ to be stored in `/etc/passwd`, but because `/etc/passwd` is a globally-readable file, this is not good for passwords, these were moved to `/etc/shadow`.
Here is the example `/etc/shadow` from the previous level:

```console
root:$6$s74oZg/4.RnUvwo2$hRmCHZ9rxX56BbjnXcxa0MdOsW2moiW8qcAl/Aoc7NEuXl2DmJXPi3gLp7hmyloQvRhjXJ.wjqJ7PprVKLDtg/:19921:0:99999:7:::
daemon:*:19873:0:99999:7:::
bin:*:19873:0:99999:7:::
sys:*:19873:0:99999:7:::
sync:*:19873:0:99999:7:::
games:*:19873:0:99999:7:::
man:*:19873:0:99999:7:::
lp:*:19873:0:99999:7:::
mail:*:19873:0:99999:7:::
news:*:19873:0:99999:7:::
uucp:*:19873:0:99999:7:::
proxy:*:19873:0:99999:7:::
www-data:*:19873:0:99999:7:::
backup:*:19873:0:99999:7:::
list:*:19873:0:99999:7:::
irc:*:19873:0:99999:7:::
gnats:*:19873:0:99999:7:::
nobody:*:19873:0:99999:7:::
_apt:*:19873:0:99999:7:::
systemd-timesync:*:19901:0:99999:7:::
systemd-network:*:19901:0:99999:7:::
systemd-resolve:*:19901:0:99999:7:::
mysql:!:19901:0:99999:7:::
messagebus:*:19901:0:99999:7:::
sshd:*:19901:0:99999:7:::
hacker::19916:0:99999:7:::
zardus:$6$bEFkpM0w/6J0n979$47ksu/JE5QK6hSeB7mmuvJyY05wVypMhMMnEPTIddNUb5R9KXgNTYRTm75VOu1oRLGLbAql3ylkVa5ExuPov1.:19921:0:99999:7:::
```

Separated by `:`s, the first field of each line is the username and the second is the password.
A value of `*` or `!` functionally means that password login for the account is disabled, a blank field means that there is no password (a not-uncommon misconfiguration that allows password-less `su` in some configurations), and the long string such as Zardus' `$6$bEFkpM0w/6J0n979$47ksu/JE5QK6hSeB7mmuvJyY05wVypMhMMnEPTIddNUb5R9KXgNTYRTm75VOu1oRLGLbAql3ylkVa5ExuPov1.` is the result of one-way-encrypting (hashing) Zardus' password from the last level (in this case, `dont-hack-me`).
Other fields in this file have other meanings, and you can read more about them [here](https://www.cyberciti.biz/faq/understanding-etcshadow-file/).

When you input a password into `su`, it one-way-encrypts (hashes) it and compares the result against the stored value.
If the result matches, `su` grants you access to the user!

But what if you don't know the password?
If you have the hashed value of the password, you can _crack_ it!
Even though `/etc/shadow` is, by default, only readable by root, leaks can happen!
For example, backups are often stored, unencrypted and insufficiently protected, on file servers, and this has led to countless data disclosures.

If a hacker gets their hands on a leaked `/etc/shadow`, they can start cracking passwords and wreaking havoc.
The cracking can be done via the famous [John the Ripper](https://www.openwall.com/john/), as so:

```console
hacker@dojo:~$ john ./my-leaked-shadow-file
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Will run 32 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
password1337      (zardus)
1g 0:00:00:22 3/3 0.04528g/s 10509p/s 10509c/s 10509C/s lykys..lank
Use the "--show" option to display all of the cracked passwords reliably
Session completed
hacker@dojo:~$
```

Here, John the Ripper cracked Zardus' leaked password hash to find the real value of `password1337`.
Poor Zardus!

This level simulates this story, giving you a leak of `/etc/shadow` (in `/challenge/shadow-leak`).
Crack it (this could take a few minutes), `su` to `zardus`, and run `/challenge/run` to get the flag!
