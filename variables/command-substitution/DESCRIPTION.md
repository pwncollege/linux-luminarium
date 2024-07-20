In the course of working with the shell, you will often want to store the output of some command into a variable.
Luckily, the shell makes this quite easy using something called [_Command Substitution_](https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html)!
Observe:

```console
hacker@dojo:~$ FLAG=$(cat /flag)
hacker@dojo:~$ echo "$FLAG"
pwn.college{blahblahblah}
hacker@dojo:~$
```

Neat!
Now, you practice.
Read the output of the `/challenge/run` command directly into a variable called `PWN`, and it will contain the flag!

----
**Trivia:**
You can also backticks instead of `$()`: `` FLAG=`cat /flag` `` instead of ``FLAG=$(cat /flag)`` in the example above.
This is an older format, and has some disadvantages (for example, imagine if you wanted to _nest_ command substitutions.
How would you do `$(cat $(find / -name flag))` with backticks?
The official stance of pwn.college is that you should use `$(blah)` instead of `` `blah` ``.
