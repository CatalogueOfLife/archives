# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A frozen, read-only re-hosting of the legacy Catalogue of Life **Annual Checklist** web apps for 2005–2019, served at `archives.catalogueoflife.org/annual-checklist/<year>`. Each year is the original PHP application as shipped back then, kept alive on PHP 8.4 (official `php:8.4.27-apache` image) and MySQL 5.7 via Docker Compose. This is not where current CoL work happens (that's `backend` / `portal`); changes here are about keeping old code running safely, not adding features. There is no build tooling, linter or unit test suite; `scripts/smoke.sh` is the end-to-end check.

## Commands

```sh
# one-off: MySQL root password + password of the read-only app user col_ro
echo DATABASE_PASSWORD=... > .env; echo DATABASE_RO_PASSWORD=... >> .env

docker-compose up -d database             # MySQL 5.7, no host port, data persisted in ./var/lib/mysql
docker-compose run provision              # create the 15 DBs, import all dumps (takes hours; once), create col_ro
docker-compose run provision --users-only # only (re)create col_ro on an existing database
docker-compose up -d --build checklists   # Apache + PHP on port 80; rebuild after ANY change (code is copied into the image)
scripts/smoke.sh [base-url]               # every page must answer without 5xx; EXPECT=1 also checks known species pages
docker-compose logs checklists | grep -E 'PHP (Fatal|Warning)|Uncaught'

# lint with the production PHP
docker run --rm -v "$PWD/var/www/html":/src -w /src php:8.4.27-apache php -l annual-checklist/2019/application/models/Search.php
```

The SQL dumps are not in git: `<year>_mysql.sql.gz` from https://download.checklistbank.org/col/annual/ (public, behind a cookie challenge), except 2011, whose public dump has the wrong (pre-2011) schema; it needs `mysql_baseschema_2011_v19.sql.gz`/`.zst`, which is not published (export `col2011ac` from an existing installation's database). `provision.py` imports whichever candidate file it finds in `data/`, also accepting the earlier `mysql_col<year>ac.sql.gz`/`.zst` names. Without them the apps can only be tested against the partial schemas in `<year>/application/data/db/` (2005–2009 work with the 2011 `schema.sql`; the 2011+ Zend apps need `_search_*` tables that only the dumps have).

## Architecture

**Three compose services** (`docker-compose.yaml`):
- `database` — MySQL 5.7 with deliberately legacy settings (`utf8`, MyISAM default engine, empty `sql-mode`, `mysql_native_password`). The old apps depend on the lax SQL mode; don't "fix" these flags.
- `provision` — `scripts/provision.py`: applies `data/provision.sql` (creates `col2005ac` … `col2019ac`), pipes each dump into its DB, then creates `col_ro` (SELECT, EXECUTE). Adding a year means editing both files.
- `checklists` — `docker/httpd.Dockerfile`, pinned by tag and digest; bump both for each PHP security release. Copies `annual-checklist/` to `/var/www/annual-checklist`, the shared `lib/` to `/var/www/lib`, `etc/php/archives.ini` into conf.d and the single vhost `etc/apache2/sites-available/archives.conf`.

**DB credentials come from the environment at runtime** (`DATABASE_USER`, `DATABASE_PASSWORD`, passed through by `PassEnv` in the vhost): `getenv()` in 2005 `connect_to_database.php`, 2006–2008 `ac_config.php`, 2009 `includes/config.php`, and in each Zend app's `Bootstrap::_initDatabase` (which overrides the blank `database.params.*` in `config.ini`). DB host is always `database`, DB name `col<year>ac`. Never commit credentials.

**Shared code in `var/www/html/lib/`** (served from `/var/www/lib`, outside every alias):
- `Zend/` — zf1-future 1.25.2 (PHP 8 compatible ZF1), replacing the per-year vendored ZF 1.9.5/1.12. Each Zend app's `public/index.php` puts it on the include_path before its own `library/` (which now only holds `Eti/`).
- `compat.php` — auto-prepended to every request (`auto_prepend_file`). Defines `legacy_count()` (PHP 7 `count()` semantics; the apps' simple `count($x)` calls were rewritten to it) and, for 2005–2009 requests only, a **request filter** that fully url-decodes every GET/POST/REQUEST/COOKIE value, strips `\ " < >` and control chars, and turns `'` into `_`. That filter *is* the SQL-injection/XSS fix for the procedural apps, whose queries interpolate request values into quoted SQL strings. Don't remove it or narrow its scope without patching those queries individually. Superglobals must be named literally there (`$_REQUEST` is JIT-initialised).

**Two generations of PHP app** under `var/www/html/annual-checklist/<year>/`:

| Years | Style | DB config file | Web root |
|---|---|---|---|
| 2005 | flat procedural PHP, `ext/mysql` calls | `connect_to_database.php` | year dir |
| 2006–2008 | same, plus autocomplete | `ac_config.php` | year dir |
| 2009 | same, config moved | `includes/config.php` | year dir |
| 2010–2019 | Zend Framework 1 MVC "ACI" (`application/`, `library/Eti`) | `application/configs/config.ini` (`[production]`) + `application.xml` | `public/` (front controller `index.php` via `.htaccess` rewrite) |

The pre-2010 apps use `lib/mysql.php` (php7-mysql-shim, patched for PHP 8 and with `mysqli_report(MYSQLI_REPORT_OFF)` so `or die()` paths still work); all five copies are identical, so change one and copy it. 2006–2009 share near-identical files, so fixes port across with small rebases. The Zend apps fall into four generations (2010; 2011–12; 2013–14; 2015–19); one patch usually applies to every year via the same method names (`fetchTaxaByRank`, `wildcardHandling`, `_selectDistributionsByIds`, `Renderer::escape`).

**Apache routing** — one vhost for `archives.catalogueoflife.org` / `*.catalogueoflife.org` with an empty `DocumentRoot` and an `Alias /annual-checklist/<year>` per year pointing at `public/` for 2010+ and at the year root for 2005–2009. Each Zend app's `public/.htaccess` `RewriteBase` must match its alias. The vhost denies config/backup/text files and `2009/includes`, and sets CSP (`'unsafe-inline'`/`'unsafe-eval'` are needed by the old inline JS and Dojo 1.3).

## Gotchas

- Search security fixes must not rely on PHP alone: in 2005–2009 any new code that reads request values gets them already filtered (see `compat.php`); in the Zend apps bind values (`where('x = ?', $v)`) and whitelist anything used as a column name or sort direction.
- The 2005 search pages keep the generated SQL in the session (`2005/lib/query_store.php`) and only send a key to the browser; the classification autocomplete (2006–2009) builds its query server-side from form values. Never accept SQL from the client again.
- Modules `bhl` and `images_ajax` are off in every `config.ini`; their controllers return 404 while off. The Google Maps distribution maps (`map_*` modules, never enabled) were removed from 2013-2019, including region search by map and the polygon data.
- Files mix CRLF and LF line endings and ISO-8859-1/UTF-8 encodings; edit byte-preserving.
- The repo has ~14k files, mostly images. Scope searches to a specific year or to `etc/`, `docker/`, `scripts/` and `var/www/html/lib/compat.php`.
