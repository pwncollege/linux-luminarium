In the previous level, you abused Zardus's `~/.bashrc` to make him run commands for you.

This time, Zardus doesn't keep the flag lying around in a readable file after he logs in.
Instead he'll run a command named `flag_checker`, manually typing the flag into it for verification.

Your mission is to use your continued write access to Zardus's `.bashrc` to intercept this flag.
Remember how you hijacked commands in the [Pondering PATH](../path) module?
Can you use that capability to hijack the `flag_checker`?

----
**HINT:**
Is Zardus getting spooked by your hijack?
He's careful --- he checks for the `flag_checker` prompt of `Type your flag`.
Make sure your hijack also prints this prompt (e.g., `echo "Type your flag"`).
Other than printing that prompt, your fake `flag_checker` can either just a) `cat` Zardus's input to stdout (e.g., `cat with no arguments`) or b) `read` it into a variable and `echo` it out.
Up to you!

----
**HINT:**
Don't forget to make your fake `flag_checker` executable, like you learned in the [Perceiving Permissions](../permissions) module!
