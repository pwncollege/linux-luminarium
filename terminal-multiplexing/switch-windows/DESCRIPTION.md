Okay, so far, `screen` is just a weird sort of terminal-with-a-terminal.
But it can be much more!

Inside a single screen session, you can have multiple windows, like your browser has multiple tabs.
This can be super handy for organizing different tasks!

These windows are handled with different keyboard shortcuts, all starting with `Ctrl-A`:

- `Ctrl-A c` - Create a new window
- `Ctrl-A n` - Next window  
- `Ctrl-A p` - Previous window
- `Ctrl-A 0` through `Ctrl-A 9` - Jump directly to window 0-9
- `Ctrl-A "` - bring up a selection menu of all of the windows

For this challenge, we've set up a screen session with two windows:

- Window 0 has a welcome message
- Window 1 has... well, you'll have to switch there to find out!

Attach to the session with `screen -r`, then use one of the key combinations above to switch to Window 1.
Go get that flag!
