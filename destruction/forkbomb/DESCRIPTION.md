As you learned in the [../../processes](Processes and Jobs) module, whenever you start a program the Linux operating system creates a new process.
If you create processes faster than the kernel can handle, the process table fills up and *everything* grinds to a halt.

You have the tools to do this:

- write a small script (like in the [../../chaining](Chaining Commands) module)
- make it executable (like in the [../../permissions](Perceiving Permissions) module)
- make it launch a copy of itself in the background (like in the [../../processes](Processes and Jobs) module)
- and then launch _another_ copy of itself in the background!

Each copy will launch two more, and each of those will launch two more, and you will flood the system with so many processes that new ones will not be able to start!

This challenge contains a `/challenge/check` that'll try to determine if your fork bomb is working (e.g., if it can't launch new processes) and give you the flag if so.
Make sure to launch it (in a different terminal) _before_ launching your attack; otherwise you won't be able to launch it!

----
**NOTE:**
Needless to say, this will render your environment unusable.
Just restart the challenge (or start a different one) to get things back to a usable state!
