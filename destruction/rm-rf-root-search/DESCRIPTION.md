So you can live without `cat`!
How about without `ls`?
This time, `/challenge/check` will restore the flag to a _randomly-named_ file.
You'll need to find it without reaching for your `ls` command.

There are a lot of ways to solve this challenge.
`echo` is a builtin, and you can [File Glob](/linux-luminarium/globbing) an argument to it to expand to all files!
For example, `echo *` will print out the names of all of the files in the current directory.
Similarly, you can use tab-completion (hit tab a few times) of an argument to have the shell list possible files for you.

Whatever route you use, find the randomly-named file that `/challenge/check` makes in `/` after you `rm`, read it, and get the flag!
