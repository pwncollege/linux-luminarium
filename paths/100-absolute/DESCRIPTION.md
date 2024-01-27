The Linux filesystem is a "tree".
That it, it has a root (written as `/`).
The root of the filesystem is a directory, and every directory can contain other directories and files.
You refer to files and directories by their \emph{path}.
A path from the root of the filesystem starts with `/` (that is, the root of the filesystem), and describes the set of directories that must be descended into to find the file.
Every piece of the path is demarcated with another `/`.

Challenges in pwn.college are in the `challenge` directory that is, in turn, right in the root directory (`/`).
The path to the challenge the directory is, thus, `/challenge`, and the path to the `run` challenge program is `/challenge/run`.
This style of path, one that starts with the root directory, is referred to as an "absolute path".
From the commandline, you can execute programs by refering to them by their absolute paths.

This challenge requires you to execute it by invoking its absolute path.
You'll want to execute the `run` file that is in the `challenge` directory that is, in turn, in the `/` directory.
If you invoke the challenge correctly, it will give you the flag.
Good luck!
