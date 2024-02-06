Additionally, you can also change the groups and users ownership of the file by using `chown` and `chgrp` (assuming that you have enough permissions)

Modifying user ownership:

```
chown [username] [file]
```

`chown` will give the ownership of that file to the specified user

Additionally, you can edit the group ownership by using chgrp:

```
chgrp [groupname] [file]
```

In this chall, you will need to chown or chgrp the `/flag` so that you (or your group) owns it and then you can read the file.


