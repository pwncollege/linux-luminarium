Consider the following situation:

```console
hacker@dojo:~$ ls
flag  flamingo  flowers
hacker@dojo:~$ cat f<TAB>
```

There are multiple options!
What happens?

What happens varies based on the specific shell and its options.
By default `bash` will auto-expand until the first point when there are multiple options (in this case, `fl`).
When you hit tab a _second_ time, it'll print out those options.
Other shells and configurations, instead, will cycle through the options.

This challenge has a `/challenge/files` directory with a bunch of files starting with `pwncollege`.
Tab-complete from `/challenge/p` or so, and make your way to the flag!

