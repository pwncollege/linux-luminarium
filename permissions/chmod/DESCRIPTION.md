Like most things in life, file permissions can be changed.
Most of the time, this is done with the `chmod` command.

The basic usage for chmod is:

```
chmod [OPTIONS] MODE FILE
```

`mode` is where you want to set the permissions of the target file.
You can specify this in two ways: as a modification of the existing permissions mode, or as a completely new mode to overwrite the old one.

In this level, we will cover former: modifying an existing mode.
As a reminder, permissions tracked for the _user_, _group_, and _world_.
`chmod` allows you to tweak each one with the mode format of `WHO`+/-`WHAT`.
For example, to add _read_ access to the _user_, you would specify a mode of `u+r`.
`w`rite and e`x`exute access for the `g`roup and the w`o`rld (or `a`ll the modes) are specified the same way.
For example:

- `u+r`, as above, adds read access to the user's permissions
- `g+wx` adds write and execute access to the group's permissions
- `o-w` _removes_ write access to the world permissions
- `a-rwx` removes all permissions for the user, group, and world

This challenge will ask you to change the permissions of the `/challenge/pwn` file in specific ways a few times in a row.
If you get the permissions wrong, the game will reset and you can try again.
If you get the permissions right five times in a row, the challenge will let you `chmod` `/flag` to make it readable for yourself :-)
Just launch a terminal to get started!
