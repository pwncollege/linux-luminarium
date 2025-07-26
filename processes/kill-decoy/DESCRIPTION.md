Sometimes, misbehaving processes can interfere with your work.
These processes might need to be killed...

In this challenge, there's a decoy process that's hogging a critical resource - a named pipe (FIFO) at `/tmp/flag_fifo` into which (like in the [Practicing Piping](../piping) FIFO challenge) `/challenge/run` wants to write your flag.
You need to `kill` this process.

Your general workflow should be:

1. Check what processes are running.
2. Find `/challenge/decoy` in the list and figure out its process ID.
3. `kill` it.
4. Run `/challenge/run` to get the flag without being overwhelmed by decoys (you don't need to redirect its output; it'll write to the FIFO on its own).

Good luck!

----
**NOTE:**
You might see a few decoy flags show up even after killing the decoy process.
This happens because Linux pipes are _buffered_: conceptually, they have a sort of length through which data flows, and you might kill the decoy process while data is in the pipe.
That data, having already entered the pipe, will proceed to the other end (your `cat`).
If you wait a second, you'll see the decoys stop, and then you can `/challenge/run` and win!
