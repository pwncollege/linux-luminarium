You've learned how to make shell scripts, but so far they've just been lists of commands.
Scripts become much more powerful when they can accept arguments!
This might look like:

```console
hacker@dojo:~$ bash myscript.sh hello world
```

The script can access these arguments using special variables:
- `$1` contains the first argument ("hello")
- `$2` contains the second argument ("world")
- `$3` would contain the third argument (if there had been one)
- ...and so on

Here's a simple example:
```bash
hacker@dojo:~$ cat myscript.sh
#!/bin/bash
echo "First argument: $1"
echo "Second argument: $2"
hacker@dojo:~$ bash myscript.sh hello world
First argument: hello
Second argument: world
hacker@dojo:~$
```

For this challenge, you need to write a script at `/home/hacker/solve.sh` that:
1. Takes two arguments
2. Outputs them in REVERSE order (second argument first, then the first argument)

For example:
```console
hacker@dojo:~$ bash /home/hacker/solve.sh pwn college
college pwn
hacker@dojo:~$
```

Once your script works correctly, run `/challenge/run` to get your flag!
