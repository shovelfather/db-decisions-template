ARG tag="14"

ARG local_dumpfile="./dumpfile.sql"

FROM "postgres:${tag}"

COPY ${local_dumpfile} /docker-entrypoint-initdb.d/data.psql
