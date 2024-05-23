We'll start with reading input from the user (you).
That's done using the aptly named `read` builtin, which *reads* input!

Here is an example using the `-p` argument, which lets you specify a prompt (otherwise, it would be hard for you, reading this now, to separate input from output in the example below):

```console
hacker@dojo:~$ read -p "INPUT: " MY_VARIABLE
INPUT: Hello!
hacker@dojo:~$ echo "You entered: $MY_VARIABLE"
You entered: Hello!
```

Now that you're familiar with the `read` command, here it is without that prompt:

```console
hacker@dojo:~$ read MY_VARIABLE
Hello!
hacker@dojo:~$ echo "You entered: $MY_VARIABLE"
You entered: Hello!
```

In this challenge, your job is to use `read` to set the `PWN` variable to the value `COLLEGE`.
Good luck!
