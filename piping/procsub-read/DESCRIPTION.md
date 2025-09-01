Sometimes you need to compare the output of two commands rather than two files.
You might think to save each output to a file first:

```console
hacker@dojo:~$ command1 > file1
hacker@dojo:~$ command2 > file2
hacker@dojo:~$ diff file1 file2
```

But there's a more elegant way! Linux follows the philosophy that ["everything is a file"](https://en.wikipedia.org/wiki/Everything_is_a_file).
That is, the system strives to provide file-like access to most resources, including the input and output of running programs!
The shell follows this philosophy, allowing you to, for example, use any utility that takes file arguments on the command line and hook it up to the output of programs, as you learned in the previous few levels.

Interestingly, we can go further, and hook input and output of programs to _arguments_ of commands.
This is done using [Process Substitution](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html).
For reading from a command (input process substitution), use `<(command)`.
When you write `<(command)`, bash will run the command and hook up its output to a temporary file that it will create.
This isn't a _real_ file, of course, it's what's called a _named pipe_, in that it has a file name:

```console
hacker@dojo:~$ echo <(echo hi)
/dev/fd/63
hacker@dojo:~$
```

Where did `/dev/fd/63` come from?
`bash` replaced `<(echo hi)` with the path of the named pipe file that's hooked up to the command's output!
While the command is running, reading from this file will read data from the standard output of the command.
Typically, this is done using commands that take input files as arguments:

```console
hacker@dojo:~$ cat <(echo hi)
hi
hacker@dojo:~$
```

Of course, you can specify this multiple times:

```console
hacker@dojo:~$ echo <(echo pwn) <(echo college)
/dev/fd/63 /dev/fd/64
hacker@dojo:~$ cat <(echo pwn) <(echo college)
pwn
college
hacker@dojo:~$
```

Now for your challenge!
Recall what you learned in the `diff` challenge from [Comprehending Commands](/linux-luminarium/commands).
In that challenge, you diffed two files.
Now, you'll diff two sets of command outputs: `/challenge/print_decoys`, which will print a bunch of decoy flags, and `/challenge/print_decoys_and_flag` which will print those same decoys plus the real flag.

Use process substitution with `diff` to compare the outputs of these two programs and find your flag!
