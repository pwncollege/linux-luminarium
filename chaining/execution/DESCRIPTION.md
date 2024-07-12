You have written your first shell script, but calling it via `bash script.sh` is a pain.
Why do you need that `bash`?

When you invoke `bash script.sh`, you are, of course launching the `bash` command with the `script.sh` argument.
This tells bash to read its commands from `script.sh` instead of standard input, and thus your shell script is executed.

It turns out that you can avoid the need to manually invoke `bash`.
If your shell script file is _executable_ (recall [File Permissions](../permissions)), you can simply invoke it via its relative or absolute path!
For example, if you create `script.sh` in your home directory _and make it executable_, you can invoke it via `/home/hacker/script.sh` or `~/script.sh` or (if your working directory is `/home/hacker`) `./script.sh`.

Try that here!
Make a shellscript that will invoke `/challenge/solve`, make it executable, and run it without explicitly invoking `bash`!
