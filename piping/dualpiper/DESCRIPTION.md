Now, let's put your knowledge together.
You must master the ultimate piping task: redirect stdout to one program and stderr to another.

The challenge here, of course, is that the `|` operator links the _stdout_ of the left command with the _stderr_ of the right command.
Of course, you've used `2>&1` to redirect stderr into stdout and, thus, pipe stderr over, but this then mixes stderr and stdout.
How to keep it unmixed?

You will need to combine your knowledge of `>()`, `2>`, and `|`.
How to do it is a task I'll leave to you.

In this challenge, you have:

- `/challenge/hack`: this produces data on stdout and stdin
- `/challenge/the`: you must redirect `hack`'s stdout to this program
- `/challenge/planet`: you must redirect `hack`'s stderr to this program

Go get the flag!
