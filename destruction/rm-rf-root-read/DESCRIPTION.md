Let's dig into the effects of blowing away your whole filesystem.
You're now an experienced `rm`er, but previously, `/challenge/check` printed the flag out for you when you cleared away the clutter of the filesystem.
What if it hadn't?
Without `cat`, how would you read that `/flag`?

Recall, from the [Digesting Documentation](../man) module, that some shell commands are _builtins_.
While `ls`, `cat`, and such aren't, `read` (which, if you recall from the [Shell Variables](../variables) module, can read files!) _is_.
That means that, even if you blow away your whole filesystem, as long as you have an already-running instance of bash, you can read files!

This challenge will force you to try it.
It's almost the same as the previous one, but you must read the flag yourself after you destroy the system.
