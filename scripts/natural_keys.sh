#!/usr/bin/env bash
# Export the natural keys of an annual checklist (2015-2019), i.e. the hashed ids used in the public URLs
# such as /annual-checklist/2019/details/species/id/<hash>, together with the internal record id that the
# edition's ChecklistBank dataset uses as its usage id (COL19 = dataset 2354).
#
#   scripts/natural_keys.sh [year]           default 2019, writes data/col<year>_natural_keys.tsv.gz
#   DB_CONTAINER=name scripts/natural_keys.sh  use a running database container instead of this compose project
#
# Common names (status 6) are left out: they have their own id space and no ChecklistBank usage.
# Tabs and line breaks inside names are replaced by a space to keep the TSV valid.
set -euo pipefail
YEAR=${1:-2019}
OUT=data/col${YEAR}_natural_keys.tsv.gz
cd "$(dirname "$0")/.."

SQL="SELECT hash, id,
  ELT(status + 1, 'higher taxon', 'accepted', 'ambiguous synonym', 'misapplied', 'provisionally accepted', 'synonym'),
  REPLACE(REPLACE(REPLACE(name, '\t', ' '), '\r', ' '), '\n', ' '),
  IFNULL(REPLACE(REPLACE(REPLACE(author, '\t', ' '), '\r', ' '), '\n', ' '), '')
FROM _natural_keys WHERE status <> 6 ORDER BY id, hash"

# the root password is only known inside the database container
QUERY=(sh -c 'MYSQL_PWD="$MYSQL_ROOT_PASSWORD" exec mysql -uroot --default-character-set=utf8 --batch --raw --skip-column-names "$0" -e "$1"' "col${YEAR}ac" "$SQL")
if [[ -n ${DB_CONTAINER:-} ]]; then
  EXEC=(docker exec "$DB_CONTAINER")
else
  EXEC=(docker-compose exec -T database)
fi

{
  printf 'hash\tid\tstatus\tscientificName\tauthorship\n'
  "${EXEC[@]}" "${QUERY[@]}"
} | gzip > "$OUT.tmp"
mv "$OUT.tmp" "$OUT"
echo "$(($(gzip -dc "$OUT" | wc -l) - 1)) natural keys written to $OUT"
