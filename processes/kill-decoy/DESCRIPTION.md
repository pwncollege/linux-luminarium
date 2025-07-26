Sometimes, misbehaving processes can interfere with your work.
These processes might need to be killed...

In this challenge, there's a decoy process that's hogging a critical resource - a named pipe (FIFO) at `/tmp/flag_fifo` into which (like in the [Practicing Piping](../piping) FIFO challenge) `/challenge/run` wants to write your flag.
You need to `kill` this process.

Your general workflow should be:

1. Check what processes are running.
2. Find `/challenge/decoy` in the list and figure out its process ID.
3. `kill` it.
4. Run `/challenge/run` to get the flag without being overwhelmed by decoys.

Good luck!
