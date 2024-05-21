You know how to redirect errors to a file, and you know how to pipe output to another program, such as grep.
But what if you wanted to grep through errors directly?

The `>` operator redirects a given file descriptor to a file, and you've used `2>` to redirect fd 2, which is standard error.
The `|` operator redirects _only standard output_ to another program, and there is no `2|` form of the operator!
It can _only_ redirect standard output (file descriptor 1).

Luckily, where there's a shell, there's a way!

The shell has a `>&` operator, which redirects a file descriptor _to another file descriptor_.
This means that we can have a two-step process to grep through errors: first, we redirect standard error to standard output (`2>& 1`) and then pipe the now-combined stderr and stdout as normal (`|`)!

Try it now!
Like the last level, this level will overwhelm you with output, but this time on standard error.
Grep through it to find the flag!
