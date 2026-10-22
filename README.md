# CoL Annual Checklist Archives

## Installation

1. Download the MySQL dumps into the data directory.

The dumps for 2005-2019 are published as `<year>_mysql.sql.gz` at https://download.checklistbank.org/col/annual/
(the server needs cookies, so use a browser or `wget`/`curl` with a cookie jar):

```
cd data
for y in 2005 2006 2007 2008 2009 2010 2012 2013 2014 2015 2016 2017 2018 2019; do
  curl -fL -c .cookies -b .cookies -O https://download.checklistbank.org/col/annual/${y}_mysql.sql.gz
done
```

2011 is the exception: the public `2011_mysql.sql.gz` has the old pre-2011 schema without the `_search_*` tables the
2011 app needs. Copy `mysql_baseschema_2011_v19.sql.zst` from GBIF's NFS (`/mnt/auto/col/archives`) instead.
The older `mysql_col<year>ac.sql.zst` dumps from the same place also work in place of the `.gz` files.

2. Provisioning the database will take a few hours, but it only needs to be done once with the commands:

```
echo DATABASE_PASSWORD=$(< /dev/urandom tr -dc _A-Za-z0-9- | head -c20) > .env
echo DATABASE_RO_PASSWORD=$(< /dev/urandom tr -dc _A-Za-z0-9- | head -c20) >> .env
docker-compose up -d database
docker-compose run provision
```

`DATABASE_PASSWORD` is the MySQL root password; the web apps connect as the read-only user `col_ro` with `DATABASE_RO_PASSWORD`.
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

The annual checklist are then available at:

- http://archives.catalogueoflife.org/annual-checklist/2005
- http://archives.catalogueoflife.org/annual-checklist/2006
- http://archives.catalogueoflife.org/annual-checklist/2007
- http://archives.catalogueoflife.org/annual-checklist/2008
- http://archives.catalogueoflife.org/annual-checklist/2009
- http://archives.catalogueoflife.org/annual-checklist/2010
- http://archives.catalogueoflife.org/annual-checklist/2011
- http://archives.catalogueoflife.org/annual-checklist/2012
- http://archives.catalogueoflife.org/annual-checklist/2013
- http://archives.catalogueoflife.org/annual-checklist/2014
- http://archives.catalogueoflife.org/annual-checklist/2015
- http://archives.catalogueoflife.org/annual-checklist/2016
- http://archives.catalogueoflife.org/annual-checklist/2017
- http://archives.catalogueoflife.org/annual-checklist/2018
- http://archives.catalogueoflife.org/annual-checklist/2019

---

Older Docker images (Ubuntu 18.04, PHP 7.2) were tagged and stored in GBIF's Docker repository. They are not safe
to run anymore (CVE-2026-109618, CVE-2026-109619), but can be used to compare search results:

```
docker.gbif.org/col/archives-provision
docker.gbif.org/col/archives-checklists
```
