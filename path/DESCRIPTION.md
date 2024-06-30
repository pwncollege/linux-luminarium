So far, you've invoked commands in several ways:

- Through an absolute path (e.g., `/challenge/run`).
- Through a relative path (e.g., `./run`).
- Through a bare command name (e.g., `ls`).

The first two cases—absolute and relative paths—are straightforward: the `run` file resides in the `/challenge` directory, and both paths correctly reference it (assuming the relative path is invoked from within `/challenge`).
But what about the last case?
Where exactly is the `ls` program located?
How does the shell know where to find it?

In this module, we will explore and demystify these questions!
Stay tuned.
