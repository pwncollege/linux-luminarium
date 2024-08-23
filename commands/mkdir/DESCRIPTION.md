We can create files.
How about directories?
You **m**a**k**e **dir**ectories using the `mkdir` command.
Then you can stick files in there!

Watch:

```console
hacker@dojo:~$ cd /tmp
hacker@dojo:/tmp$ ls
hacker@dojo:/tmp$ ls
hacker@dojo:/tmp$ mkdir my_directory
hacker@dojo:/tmp$ ls
my_directory
hacker@dojo:/tmp$ cd my_directory
hacker@dojo:/tmp/my_directory$ touch my_file
hacker@dojo:/tmp/my_directory$ ls
my_file
hacker@dojo:/tmp/my_directory$ ls /tmp/my_directory/my_file
/tmp/my_directory/my_file
hacker@dojo:/tmp/my_directory$
```

Now, go forth and create a `/tmp/pwn` directory and make a `college` file in it!
Then run `/challenge/run`, which will check your solution and give you the flag!
