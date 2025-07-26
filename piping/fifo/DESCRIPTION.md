You've learned about pipes using `|`, and you've seen that process substitution creates temporary named pipes (like `/dev/fd/63`).
You can also create your own _persistent_ named pipes that stick around on the filesystem!
These are called **FIFOs**, which stands for First (byte) In, First (byte) Out.

You create a FIFO using the `mkfifo` command:

```console
hacker@dojo:~$ mkfifo my_pipe
hacker@dojo:~$ ls -l my_pipe
prw-r--r-- 1 hacker hacker 0 Jan 1 12:00 my_pipe
-rw-r--r-- 1 hacker hacker 0 Jan 1 12:00 some_file
hacker@dojo:~$
```

Notice the `p` at the beginning of the permissions - that indicates it's a pipe!
That's markedly different than the `-` that's at the beginning of normal files, such as `some_file` in the above example.

Unlike the automatic named pipes from process substitution:

- You control where FIFOs are created
- They persist until you delete them  
- Any process can write to them by path (e.g., `echo hi > my_pipe`)
- You can see them with `ls` and examine them like files

One problem with FIFOs is that they'll "block" any operations on them until both the read side of the pipe and the write side of the pipe are ready.
For example, consider this:

```console
hacker@dojo:~$ mkfifo myfifo
hacker@dojo:~$ echo pwn > myfifo
```

To service `echo pwn > myfifo`, bash will open the `myfifo` file in write mode.
However, this operation will hang until something _also_ opens the file in read mode (thus completing the pipe).
That can be in a different console:

```console
hacker@dojo:~$ cat myfifo
pwn
hacker@dojo:~$
```

What happened here?
When we ran `cat myfifo`, the pipe had both sides of the connection all set, and _unblocked_, allowing `echo pwn > myfifo` to run, which sent `pwn` into the pipe, where it was read by `cat`.

But why use a FIFO instead of a regular file? Here are key differences:

1. **No disk storage**: FIFOs pass data directly between processes in memory - nothing is saved to disk
2. **Data is consumed**: Once data is read from a FIFO, it's gone (unlike files where data persists)
3. **Blocking behavior**: Writers block when the pipe buffer is full (~64KB), readers block when it's empty. This is actually useful! It provides automatic flow control - fast writers wait for slow readers, preventing memory overflow
4. **Real-time communication**: Perfect for streaming data between processes. The blocking ensures processes stay synchronized without you having to write any synchronization code

FIFOs are useful for facilitating complex data flows, merging and splitting data in flexible ways, and so on.
For example, FIFOs support multiple readers and writers.
Let's assume that `cat myfifo` is running somewhere, handling the read side of the FIFO.
Then we can do:

```console
hacker@dojo:~$ echo pwn > myfifo
hacker@dojo:~$ echo college > myfifo
```

If we check on our `cat`, we'll see:

```console
hacker@dojo:~$ cat myfifo
pwn
college
hacker@dojo:~$
```

This effect is hard to achieve with piping, but easy with FIFOs.
Pretty neat!

This challenge will be a simple introduction to FIFOs.
You'll need to create a `/tmp/flag_fifo` file and redirect the stdout of `/challenge/run` to it.
If you're successful, `/challenge/run` will write the flag into the fifo!
Go do it!
