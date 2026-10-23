# CoL Annual Checklist archives (2005–2019), run locally

This runs the old Catalogue of Life Annual Checklists on your own computer with Docker, using the images published
by [CatalogueOfLife/archives](https://github.com/CatalogueOfLife/archives). They are for local use only.

You need Docker with Compose 2.20 or newer (Docker Desktop, OrbStack or Docker Engine), and enough disk space for
the years you want: an imported year takes roughly its uncompressed size, about 8× the dump (all years together
about 50 GB).

## 1. Get this folder

Download `col-archives-<version>.zip` from the
[latest release](https://github.com/CatalogueOfLife/archives/releases/latest) and unzip it:

```
col-archives/
├── docker-compose.yml
├── README.md
└── data/            # the MySQL dumps go here
```

## 2. Download the MySQL dumps

Each year is one file, `https://download.checklistbank.org/col/annual/<year>_mysql.sql.zst` (64 MB for 2005 up to
615 MB for 2018). Put the ones you want into `data/` and leave them compressed. The server sets a cookie before it
serves files, so `curl` needs a cookie jar:

```sh
cd data
u=https://download.checklistbank.org/col/annual
for y in 2005 2019; do               # pick any years from 2005 to 2019
  curl -fL -c .cookies -b .cookies -O $u/${y}_mysql.sql.zst
done
curl -fsL -c .cookies -b .cookies $u/mysql.md5 | md5sum -c --ignore-missing   # macOS: brew install coreutils
cd ..
```

## 3. Import the dumps (once)

```sh
docker compose run --rm provision
```

This starts MySQL and imports every dump in `data/`. It prints `Importing <year>`, `SKIP <year>` or `FAILED <year>`
for each year. Small years take minutes; all 15 years take several hours.

## 4. Start the web apps

```sh
docker compose up -d
```

Then open http://localhost:8080/annual-checklist/2019, or any other year you imported. Years you didn't import show
an error page.

## Everyday use

```sh
docker compose up -d                # start
docker compose stop                 # stop, the imported data is kept
docker compose logs -f checklists   # Apache/PHP log
```

To add years later, download more dumps into `data/` and run `docker compose run --rm provision` again. Years that
are already imported are skipped; `docker compose run --rm provision --force` re-imports them.

To start over, `docker compose down -v` deletes the MySQL volume with all imported data. Afterwards you can delete
the dumps in `data/`, too.

## Settings

Nothing needs configuring. The database passwords are local defaults, because MySQL is only reachable from the other
containers and the web apps only from your own computer. To change the web port or the passwords, create a `.env`
file next to `docker-compose.yml` before the first import:

```
PORT=8081
DATABASE_PASSWORD=...      # MySQL root
DATABASE_RO_PASSWORD=...   # read-only user of the web apps
```

## Notes

- `mysql:5.7` exists only for amd64. On Apple Silicon it runs under Rosetta (OrbStack, Docker Desktop), which makes
  the import slower. The web apps image is native on both.
- These are legacy PHP applications, kept running on a current PHP 8.4. They are meant for looking things up
  locally; don't expose them to the internet.
- Problems: https://github.com/CatalogueOfLife/archives/issues
