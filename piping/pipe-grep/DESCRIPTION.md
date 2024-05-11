It turns out that you can "cut out the middleman" and avoid the need to store results to a file, like you did in the last level.
You can use this using the `|` (pipe) operator.
Standard output from the command to the left of the pipe will be connected to (_piped into_) the standard input of the command to the right of the pipe.
For example:

```
hacker@dojo:~$ echo no-no | grep yes
hacker@dojo:~$ echo yes-yes | grep yes
yes-yes
hacker@dojo:~$ echo yes-yes | grep no
hacker@dojo:~$ echo no-no | grep no
no-no
```

Now try it for yourself! `/challenge/run` will output a hundred thousand lines of text, including the flag.
Grep for the flag!
