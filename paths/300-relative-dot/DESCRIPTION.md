Now you're familiar with the concept of refering to absolute paths and changing directories.
If you put in absolute paths everywhere, then it really doesn't matter what directory you are in, as you likely found out in the previous three challenges.

However, the current working directory matters for *relative* paths.
If a path does not start with a `/`, it is not an absolute, but a relative path.
Relative paths are interpreted *relative* to the current working directory, rather than starting from `/`.
When used by programs, relative paths will be *resolved* into absolute paths.
For example, if you are in the `/var` directory, and your relative path is `asdf`, the full resolved path is `/var/asdf`.
If your relative path is `asdf/fdsa`, the full resolved path will be `/var/asdf/fdsa`.

Let's try it here!
You'll need to run `/challenge/run` using a relative path while having a current working directory of `/`.
For this level, I'll give you a hint.
Your relative path should start with the letter `c` 😊
