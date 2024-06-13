Thus far, you have invoked commands in several ways:

- Through an absolute path (e.g., `/challenge/run`).
- Through a relative path (e.g., `./run`).
- Through a bare command name (e.g., `ls`).

The first two cases, the absolute and the relative path case, are straightforward: the `run` file lives in the `/challenge` directory, and both cases refer to it (provided, of course, that the relative path is invoked with a current working directory of `/challenge`).
But what about the last one?
Where is the `ls` program located?
How does the shell know to search for it there?

In this module, we will pull back the veil and answer this question!
Stay with us.
