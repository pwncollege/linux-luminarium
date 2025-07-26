Your `if` statements so far have handled specific cases, but what about everything else?
That's where `else` comes in!

The `else` clause executes when the `if` condition is false:

```bash
if [ "$1" == "hello" ]
then
    echo "Hi there!"
else
    echo "I don't understand"
fi
```

Note that the `else` doesn't have a condition --- it catches everything that didn't match previously.
It also doesn't have a `then` statement.
Finally, the `fi` goes after the `else` block to denote the end of the whole complex statement!
It is also optional: you didn't have it in the previous level, and you only need it if the logic you're trying to achieve demands it.

Here's a practical example:

```bash
if [ "$1" == "start" ]
then
    echo "Starting the service..."
else
    echo "Unknown command. Use 'start' to begin."
fi
```

For this challenge, write a script at `/home/hacker/solve.sh` that:

- Takes one argument
- If the argument is "pwn", output "college"
- For any other input, output "nope"

Example:

```console
hacker@dojo:~$ bash /home/hacker/solve.sh pwn
college
hacker@dojo:~$ bash /home/hacker/solve.sh hack
nope
hacker@dojo:~$ bash /home/hacker/solve.sh anything
nope
hacker@dojo:~$
```

Once your script works correctly, run `/challenge/run` to get your flag!
