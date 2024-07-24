We'll start with reading input from the user (you).
That's done using the aptly named `read` builtin, which *reads* input!

Here is an example using the `-p` argument, which lets you specify a prompt (otherwise, it would be hard for you, reading this now, to separate input from output in the example below):

```console
hacker@dojo:~$ read -p "INPUT: " MY_VARIABLE
INPUT: Hello!
hacker@dojo:~$ echo "You entered: $MY_VARIABLE"
You entered: Hello!
```

Keep in mind, `read` reads data from your standard input!
The first `Hello!`, above, was _inputted_ rather than _outputted_.
Let's try to be more explicit with that.
Here, we annotated the beginning of each line with whether the line represents `INPUT` from the user or `OUTPUT` to the user:

```console
 INPUT: hacker@dojo:~$ echo $MY_VARIABLE
OUTPUT:
 INPUT: hacker@dojo:~$ read MY_VARIABLE
 INPUT: Hello!
 INPUT: hacker@dojo:~$ echo "You entered: $MY_VARIABLE"
OUTPUT: You entered: Hello!
```

In this challenge, your job is to use `read` to set the `PWN` variable to the value `COLLEGE`.
Good luck!
