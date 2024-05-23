In addition to adding and removing permissions, as in the previous level, `chmod` can also simply set permissions altogether, overwriting the old ones.
This is done by using `=` instead of `-` or `+`.
For example:

- `u=rw` sets read and write permissions for the user, and wipes the execute permission
- `o=x` sets only executable permissions for the world, wiping read and write
- `a=rwx` sets read, write, and executable permissions for the user, group, and world!

But what if you want to change user permissions in a different way as group permissions?
Say, you want to set `rw` for the owning user, but only `r` for the owning group?
You can achieve this by chaining multiple modes to chmod with `,`!

- `chmod u=rw,g=r /challenge/pwn` will set the user permissions to read and write, and the group permissions to read-only
- `chmod a=r,u=rw /challenge/pwn` will set the user permissions to read and write, and the group and world permissions to read-only

Additionally, you can zero out permissions with `-`:

- `chmod u=rw,g=r,o=- /challenge/pwn` will set the user permissions to read and write, the group permissions to read-only, and the world permissions to nothing at all

Keep in mind, that `-`, appearing after `=` is in a different context than if it appeared directly after the `u`, `g`, or `o` (in which case, it would cause specific bits to be removed, not everything).

This level extends the previous level by requesting more radical permission changes, which you will need `=` and `,`-chaining to achieve.
Good luck!
