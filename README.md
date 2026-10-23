# CoL Annual Checklist Archives

The legacy Catalogue of Life Annual Checklist web apps 2005–2019, kept running on a current PHP so that the old
editions can still be browsed. They are for local use only; don't expose them to the internet.

**Just want to browse the old checklists locally?** Download `col-archives-<version>.zip` from the
[latest release](https://github.com/CatalogueOfLife/archives/releases/latest) and follow its README
([col-archives/README.md](col-archives/README.md)): no checkout, no passwords, prebuilt images from
`ghcr.io/catalogueoflife/archives-checklists` and `ghcr.io/catalogueoflife/archives-provision`.
Publishing a GitHub release builds both images and the zip (`.github/workflows/release.yml`).

The rest of this page is for running and developing the apps from this repository.

## Installation

1. Download the MySQL dumps into the data directory.

The original dumps are published as `https://download.checklistbank.org/col/annual/<year>_mysql.sql.zst` (the server
needs cookies, so use a browser or `curl` with a cookie jar). Years without a dump are skipped by the import:

```
cd data
u=https://download.checklistbank.org/col/annual
for y in $(seq 2005 2019); do
  curl -fL -c .cookies -b .cookies -O $u/${y}_mysql.sql.zst
done
curl -fsL -c .cookies -b .cookies $u/mysql.md5 | md5sum -c --ignore-missing
```

2. Provisioning the database will take a few hours, but it only needs to be done once with the commands:

```
echo DATABASE_PASSWORD=$(< /dev/urandom tr -dc _A-Za-z0-9- | head -c20) > .env
echo DATABASE_RO_PASSWORD=$(< /dev/urandom tr -dc _A-Za-z0-9- | head -c20) >> .env
docker-compose up -d database
docker-compose run provision
```

The import creates the `col<year>ac` databases and skips years that are already imported, so it can be rerun after
adding dumps (`--force` re-imports them). `DATABASE_PASSWORD` is the MySQL root password; the web apps connect as the read-only user `col_ro` with `DATABASE_RO_PASSWORD`.
On a database that was provisioned before `col_ro` existed, create the user without re-importing:

```
docker-compose run provision --users-only
```

3. To run the CoL annual checklist archives run:

```
docker-compose up -d --build checklists
scripts/smoke.sh            # every page must answer without a 5xx; EXPECT=1 also checks known species pages
```

The web image is the official `php:8.4.27-apache` (Debian). Rebuild it whenever a new PHP 8.4 security release is
published by bumping the tag and digest in `docker/httpd.Dockerfile`.

The annual checklists are then available at http://localhost/annual-checklist/2005 to
http://localhost/annual-checklist/2019.

---

Older Docker images (Ubuntu 18.04, PHP 7.2) were tagged and stored in GBIF's Docker repository. They are not safe
to run anymore (CVE-2026-109618, CVE-2026-109619), but can be used to compare search results:

```
docker.gbif.org/col/archives-provision
docker.gbif.org/col/archives-checklists
```
