This level introduces the `man` command.
`man` is short for `manual`, and will display (if available) the manual of the command you pass as an argument.
For example, let's say we wanted to learn about the `yes` command (_yes_, this is a real command):

```console
hacker@dojo:~$ man yes
```

This will display the manual page for `yes`, which will look something like this:

```man
YES(1)                           User Commands                          YES(1)

NAME
       yes - output a string repeatedly until killed

SYNOPSIS
       yes [STRING]...
       yes OPTION

DESCRIPTION
       Repeatedly output a line with all specified STRING(s), or 'y'.

       --help display this help and exit

       --version
              output version information and exit

AUTHOR
       Written by David MacKenzie.

REPORTING BUGS
       GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
       Report any translation bugs to <https://translationproject.org/team/>

COPYRIGHT
       Copyright  ©  2020  Free Software Foundation, Inc.  License GPLv3+: GNU
       GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
       This is free software: you are free  to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full documentation <https://www.gnu.org/software/coreutils/yes>
       or available locally via: info '(coreutils) yes invocation'

GNU coreutils 8.32               February 2022                          YES(1)
```

The important sections are:

```
NAME
	This gives the name (and short description) of the command or
	concept discussed by the page.

SYNOPSIS
	This gives a short usage synopsis. These synopses have a stanard
	format. Typically, each line is a different valid invocation of the
	command, and the lines can be read as:

	COMMAND [OPTIONAL_ARGUMENT] SINGLE_MANDATORY_ARGUMENT
	COMMAND [OPTIONAL_ARGUMENT] MULTIPLE_ARGUMENTS...

DESCRIPTION
	Details of the command or concept, with detailed descriptions
	of the various options.

SEE ALSO
	Other man pages or online resources that might be useful.
```

You can scroll the man page with the arrow keys (and PgUp/PgDn) and search with `/`.
When you're done reading the manpage, you can hit `q` to quit.

The challenge in this level has a secret option that, when you use it, will cause the challenge to print the flag.
You must learn this option through the man page for `challenge`!
