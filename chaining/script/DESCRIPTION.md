As you combine more commands to achieve complex effects, dealing with lengthy command sequences can quickly become cumbersome. To streamline this process, you can organize commands into a file called a shell script and execute the file directly.

For instance, using our semicolon technique:

```console
hacker@dojo:~$ echo COLLEGE > pwn; cat pwn
COLLEGE
hacker@dojo:~$
```

We can create a shell script named `pwn.sh` (typically named with a `.sh` suffix):

```sh
echo COLLEGE > pwn
cat pwn
```

Then, execute it by passing it as an argument to a new instance of the shell (`bash`). When invoked this way, the shell reads commands from the script file rather than from user input:

```console
hacker@dojo:~$ ls
hacker@dojo:~$ bash pwn.sh
COLLEGE
hacker@dojo:~$ ls
pwn
hacker@dojo:~$
```

As shown, the shell script executed both commands, creating and printing the `pwn` file.

Now, it's your turn! Just like the previous level, create a shell script named `x.sh` that runs `/challenge/pwn` followed by `/challenge/college`, and then execute it using `bash`!

---
**NOTE:** We haven't discussed Linux's rich selection of capable command-line text editors yet.
For now, feel free to use the `Text Editor` application in Desktop mode (`Applications->Accessories->Text Editor`) or the default editor in the VSCode Workspace!
