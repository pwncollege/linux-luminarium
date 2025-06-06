In the previous level, you abused the victim’s `~/.bashrc` to make them run commands for you.

This time the victim doesn't keep the flag lying around in a readable file after they log-in.
Instead they'll run a command named `flag_checker`, manually typing the flag into it for verification.

Your mission is to use your continued write access to the victim's `.bashrc` to intercept this flag.
Remember how you hijacked commands in the [Pondering PATH](../path) module?
Can you use that capability to hijack the `flag_checker`?
