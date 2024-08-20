ARG tag="14" # can change to any Decisions compatibile version of postgres

ARG local_dumpfile="./dumpfile.sql" # should be a .sql dump NOT archive type

FROM "postgres:${tag}"

COPY ${local_dumpfile} /docker-entrypoint-initdb.d/data.psql
