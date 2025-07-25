Let's try the same thing with `tmux`!

`tmux` (terminal multiplexer) is screen's younger, more modern cousin.
It does all the same things but with some different key bindings.
The biggest difference?
Instead of `Ctrl-A`, tmux uses `Ctrl-B` as its command prefix.

So to detach from tmux, you press `Ctrl-B` followed by `d`.

```console
hacker@dojo:~$ tmux
[doing some work...]
[Press Ctrl-B, then d]
[detached (from session 0)]
hacker@dojo:~$ 
```

The commands also differ:
- `tmux ls` - List sessions
- `tmux attach` or `tmux a` - Reattach to session

For this challenge:
1. Launch tmux
2. Detach from it.
3. Run `/challenge/run` (this will send the flag to your detached session!)
4. Reattach to see your prize
