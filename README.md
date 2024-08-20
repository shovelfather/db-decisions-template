# Using this buildfile

You'll need a valid plaintext-style dump from `pg_dump` in order to run this
build. To get that, run

```bash
pg_dump -U <DB_USERNAME> -h <HOSTNAME> <DB_NAME> > dumpfile.sql
```

If you're taking this dump from inside e.g a running `postgres` container
hosting an existing Decisions DB, then you'd end up with:

```bash
pg_dump -U postgres -h localhost decisions > dumpfile.sql
```

> [!NOTE]
> If you've changed the DB name or DB user you'll need to update those
> accordingly, values above only represent defaults.

Once you have the dump, the easiest way to get it out of the container would be
via a volume mount. If this is an instance of `postgres` hosting a Decisions DB,
you probably already have `/var/lib/postgresql/data` mounted for persistence (if
not then you really should lol).

With the dumpfile in hand just move / copy it to the root directory of this
repository and run the below:

```bash
docker build -t myrepo/mypostgresimage:mytag --buildarg tag="14" --buildarg \
local_dumpfile="./dumpfile.sql"
```
