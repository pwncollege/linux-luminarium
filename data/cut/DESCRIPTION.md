Sometimes, you want to grab specific columns of data, such as the first column, the third column, or the 42nd column.
For this, there"s the `cut` command.

For example, imagine that you have the following data file:

```console
hacker@dojo:~$ cat scores.txt
hacker 78 99 67
root 92 43 89
hacker@dojo:~$
```

You could use `cut` to extract specific columns:

```console
hacker@dojo:~$ cut -d " " -f 1 scores.txt
hacker
root
hacker@dojo:~$ cut -d " " -f 2 scores.txt
78
92
hacker@dojo:~$ cut -d " " -f 3 scores.txt
99
43
hacker@dojo:~$
```

The `-d` argument specifies the column _delimiter_ (how columns are separated).
In this case, it"s a space character.
Of course, it has to be in quotes here so that the shell knows that the space is an argument rather than a space separating other arguments!
The `-f` argument specifies the _field_ number (which column to extract).

In this challenge, the `/challenge/run` program will give you a bunch of lines with random numbers and single characters (characters of the flag) as columns.
Use `cut` to extract the flag characters, then pipe them to `tr -d "\n"` (like the previous command!) to join them together into a single line.
