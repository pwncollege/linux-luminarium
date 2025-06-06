When your shell starts up, it looks for `.bashrc` file in your home directory and executes it as a _startup script_.
You can customize your `/home/hacker/.bashrc` with useful things, such as setting environment variables, tweaking your shell configuration, and so on.

You can _also_ use it for _evil_!
An unwitting victim's `.bashrc` is a common target for shenanigans.
Imagine sneaking onto your friend's computer and adding a `echo "Hackers were here!"` at the end of their `.bashrc`.
That's funny, but the same capability can be used for much more nefarious purposes.
Malicious software, for example, often targets startup scripts such as `.bashrc` to maintain persistence into the future!

In this challenge, we'll pretend that you've broken into a victim user's machine!
That user is named `victim`, with a home directory of `/home/victim`.
You, as the `hacker` user, have write access to their `.bashrc`, and they have read-access to `/flag`.
The victim is simulated by the script `/challenge/victim`, and you can launch this script at any time to observe the victim logging into the computer.
Can you get the flag?

----
**HINT:**
Like the scripts you explored in [Chaining Commands](../chaining), the `.bashrc` script is just a shell script.
Adding a new line with a command on it (e.g., `echo Hello Hackers`) will get that command executed, so all you really need to think about is what command will get you the flag!

**NOTE:**
The victim's `/home/victim/.bashrc` will have a lot of stuff already in it: the shell's startup is a complex affair.
Don't panic --- just add your payload to the end and hope for the best!
