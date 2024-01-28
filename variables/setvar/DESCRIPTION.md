Naturally, as well as reading values stored in variables, you can write values to variables.
This is done, as with many other languages, using `=`.
To set variable `VAR` to value `1337`, you would use:

```sh
$ VAR=1337
```

Note that this uses `VAR` and *not* `$VAR`: the `$` is only prepended to *access* variables.
In shell terms, this is called *variable expansion*, and is, surprisingly, the source of many potential vulnerabilities (if you're interested in that, check out the Art of the Shell dojo when you get comfortable with the command line!).

After setting variables, you can access them using the techniques you've learned previously, such as:

```sh
$ echo $VAR
1337
```

To solve this level, you must set the `PWN` variable to the value `COLLEGE`.
Be careful: both the names and values of variables are case-sensitive!
`PWN` is not the same as `pwn` and `COLLEGE` is not the same as `College`.
