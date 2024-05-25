So now we know how to list, read, and create files.
But how do we find them?
We use the `find` command!

The `find` command takes optional arguments describing the search criteria and the search location.
If you don't specify a search criteria, `find` matches every file.
If you don't specify a search location, `find` uses the current working directory (`.`).
For example:

```console
hacker@dojo:~$ mkdir my_directory
hacker@dojo:~$ mkdir my_directory/my_subdirectory
hacker@dojo:~$ touch my_directory/my_file
hacker@dojo:~$ touch my_directory/my_subdirectory/my_subfile
hacker@dojo:~$ find
.
./my_directory
./my_directory/my_subdirectory
./my_directory/my_subdirectory/my_subfile
./my_directory/my_file
hacker@dojo:~$
```

And when specifying the search location:

```console
hacker@dojo:~$ find my_directory/my_subdirectory
my_directory/my_subdirectory
my_directory/my_subdirectory/my_subfile
hacker@dojo:~$
```

And, of course, we can specify the criteria!
For example, here, we filter by name:

```console
hacker@dojo:~$ find -name my_subfile
./my_directory/my_subdirectory/my_subfile
hacker@dojo:~$ find -name my_subdirectory
./my_directory/my_subdirectory
hacker@dojo:~$
```

You can search the whole filesystem if you want!

```console
hacker@dojo:~$ find / -name hacker
/home/hacker
hacker@dojo:~$
```

Now it's your turn.
I've hidden the flag in a random directory on the filesystem.
It's still called `flag`.
Go find it!

Several notes. First, there are other files named `flag` on the filesystem.
Don't panic if the first one you try doesn't have the actual flag in it.
Second, there're plenty of places in the filesystem that are not accessible to a normal user.
These will cause `find` to generate errors, but you can ignore those; we won't hide the flag there!
Finally, `find` can take a while; be patient!
