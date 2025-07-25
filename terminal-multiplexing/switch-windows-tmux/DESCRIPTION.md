Let's learn to navigate windows in tmux!

Just like screen, tmux has windows.
The key combos are different, but the concept is the same:

- `Ctrl-B c` - Create a new window
- `Ctrl-B n` - Next window  
- `Ctrl-B p` - Previous window
- `Ctrl-B 0` through `Ctrl-B 9` - Jump to window 0-9
- `Ctrl-B w` - See a nice window picker

Tmux shows your windows at the bottom in a status bar that looks like:
```
[0] 0:bash* 1:bash
```

The `*` shows your current window, and each entry also shows the process that the window was created to run.

We've created a tmux session with two windows:
- Window 1 has the flag!
- Window 0 has your warm welcome.

Go get that flag!
