Now that we know how to list, read, and create files, let's learn how to find them using the `find` command!

The `find` command allows us to search for files based on various criteria in a specified location. If no location is provided, `find` starts its search from the current directory (`.`). Here's how it works:

1. **Basic Usage**: Without any specific criteria, `find` lists all files and directories recursively.

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

2. **Searching Specific Locations**:

```console
hacker@dojo:~$ find my_directory/my_subdirectory
my_directory/my_subdirectory
my_directory/my_subdirectory/my_subfile
hacker@dojo:~$
```

3. **Filtering by Name**:

```console
hacker@dojo:~$ find -name my_subfile
./my_directory/my_subdirectory/my_subfile
hacker@dojo:~$ find -name my_subdirectory
./my_directory/my_subdirectory
hacker@dojo:~$
```

4. **Searching the Entire Filesystem**:

```console
hacker@dojo:~$ find / -name hacker
/home/hacker
hacker@dojo:~$
```

Now it's your turn! I've hidden the flag in a random directory on the filesystem, and it's named `flag`. Your task is to locate it.

- There may be multiple files named `flag` on the filesystem. If the first one you find doesn't have the actual flag, keep searching.
- Some parts of the filesystem are not accessible to normal users, causing `find` to generate errors. Ignore these errors as the flag isn't hidden there.
- Be patient, as `find` can take some time to complete its search.

Good luck!
