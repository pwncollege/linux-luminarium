The `grep` command has a very useful option: `-v` (invert match).
While normal `grep` shows lines that MATCH a pattern, `grep -v` shows lines that do NOT match a pattern:

```console
hacker@dojo:~$ cat data.txt
hello hackers!
hello world!
hacker@dojo:~$ cat data.txt | grep -v world
hello hackers!
hacker@dojo:~$
```

Sometimes, the only way to filter to just the data you want is to filter _out_ the data you _don't_ want.
In this challenge, `/challenge/run` will output the flag to stdout, but it will also output over 1000 decoy flags (containing the word `DECOY` somewhere in the flag) mixed in with the real flag.
You'll need to filter _out_ the decoys while keeping the real flag!

Use `grep -v` to filter out all the lines containing "DECOY" and reveal the real flag!
