You've learned how to use a single `if` statement to check a condition.
But what if you need to check multiple conditions?
You can use `elif` (short for `else if`):

```bash
if [ "$1" == "one" ]
then
    echo "1"
elif [ "$1" == "two" ]
then
    echo "2"
elif [ "$1" == "three" ]
then
    echo "3"
else
    echo "unknown"
fi
```

Note that you _do_ need a `then` after the elif, just like the `if`.
As before the `else` at the end catches everything that didn't match.

For this challenge, write a script at `/home/hacker/solve.sh` that:

- Takes one argument
- If the argument is "hack", output "the planet"
- If the argument is "pwn", output "college"  
- If the argument is "learn", output "linux"
- For any other input, output "unknown"

Example:

```console
hacker@dojo:~$ bash /home/hacker/solve.sh hack
the planet
hacker@dojo:~$ bash /home/hacker/solve.sh pwn
college
hacker@dojo:~$ bash /home/hacker/solve.sh learn
linux
hacker@dojo:~$ bash /home/hacker/solve.sh foo
unknown
hacker@dojo:~$
```

Once your script works correctly, run `/challenge/run` to get your flag!

----
**NOTE:**
As you're creating your script, make sure to follow the spacing closely in the examples.
Unlike many other languages, bash requires the `[` and the `]` to be separated from other characters by spaces, otherwise it cannot parse the condition.
