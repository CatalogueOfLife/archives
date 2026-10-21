# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A frozen, read-only re-hosting of the legacy Catalogue of Life **Annual Checklist** web apps for 2005–2019, served at `archives.catalogueoflife.org/annual-checklist/<year>`. Each year is the original PHP application as shipped back then, kept alive on a single Ubuntu 18.04 / PHP 7.2 / MySQL 5.7 stack via Docker Compose. This is not where current CoL work happens (that's `backend` / `portal`); changes here are about keeping old code running, not adding features. There is no build tooling, linter or test suite.

## Commands

```sh
# one-off: generate the DB root password (read by docker-compose and baked into the httpd image)
echo DATABASE_PASSWORD=$(< /dev/urandom tr -dc _A-Za-z0-9- | head -c20) > .env

docker-compose up -d database      # MySQL 5.7, host port 3399, data persisted in ./var/lib/mysql
docker-compose run provision       # create the 15 DBs and import all dumps (takes hours; once only)
docker-compose up checklists       # Apache + PHP on port 80
docker-compose build checklists    # required after ANY change under var/www/html or etc/ansible
```

The SQL dumps (`data/mysql_col<year>ac.sql.zst`, plus `mysql_baseschema_2011_v19.sql.zst` for 2011) are not in git; GBIF keeps a copy on NFS at `col/archives`. Prebuilt images exist as `docker.gbif.org/col/archives-provision` and `docker.gbif.org/col/archives-checklists` in case the build breaks (e.g. Ubuntu 18.04 apt mirrors or the ansible PPA disappearing).

## Architecture

**Three compose services** (`docker-compose.yaml`):
- `database` — MySQL 5.7 with deliberately legacy settings (`utf8`, MyISAM default engine, empty `sql-mode`, `mysql_native_password`, capped InnoDB temp file). The old apps depend on the lax SQL mode; don't "fix" these flags.
- `provision` — runs `scripts/provision.py`: applies `data/provision.sql` (creates `col2005ac` … `col2019ac`) then `zstdcat | mysql` each dump into its DB. Adding a year means editing both files.
- `checklists` — built from `docker/httpd.Dockerfile`. The PHP code is **copied into the image** at `/usr/lib/apache2/htdocs/annual-checklist` (the bind mount for `var/www/html` is commented out), so edits to app code need a rebuild. `etc/apache2` and `var/log` *are* bind-mounted, so Apache config changes only need a restart.

**DB credentials are injected at image build time by Ansible**, not read from the environment at runtime. `etc/ansible/roles/httpd/tasks/main.yml` runs inside the Dockerfile and uses `lineinfile` regexes to overwrite the password line in each year's config file, creates the `application/log` dirs for 2010+, and chowns everything to `daemon`. Password values committed in the per-year config files are therefore overwritten on build; if you change the structure of one of those config lines, update the matching regex in the Ansible task or the password will silently stop being set. DB host is always `database`, user `root`, DB name `col<year>ac`.

**Two generations of PHP app** under `var/www/html/annual-checklist/<year>/`:

| Years | Style | DB config file | Web root |
|---|---|---|---|
| 2005 | flat procedural PHP, `ext/mysql` calls | `connect_to_database.php` | year dir |
| 2006–2008 | same, plus autocomplete | `ac_config.php` | year dir |
| 2009 | same, config moved | `includes/config.php` | year dir |
| 2010–2019 | Zend Framework 1 MVC (`application/`, `library/Zend`, `library/Eti`) | `application/configs/config.ini` (`[production]`) | `public/` (front controller `index.php` via `.htaccess` rewrite) |

The pre-2010 apps were written for `ext/mysql`, which PHP 7 removed; each ships `lib/mysql.php` (the `php7-mysql-shim` mapping `mysql_*` onto `mysqli`), included from `connect_to_database.php`. Any new PHP-7 breakage in these apps should be shimmed rather than rewritten.

**Apache routing** — `etc/apache2/sites-available/19-col2019ac.conf` (the `sites-enabled` copy is a plain file, not a symlink: keep both identical). One vhost for `archives.catalogueoflife.org` / `*.catalogueoflife.org`, with an `Alias /annual-checklist/<year>` per year pointing at `public/` for 2010+ and at the year root for 2005–2009. Each ZF app's `public/.htaccess` has a `RewriteBase /annual-checklist/<year>` that must match its alias. `etc/apache2/apache2.conf` uses `ServerRoot /usr/lib/apache2` and loads `libphp7.2.so` directly.

## Gotchas

- The per-year config files in git (all 2009–2019 configs, plus 2006–2008 `ac_config.php`) still contain password strings, which the build replaces. Don't add new credentials anywhere in the repo; set them through `DATABASE_PASSWORD` and the Ansible task.
- `docker-compose.yaml` mounts `./ansible`, which doesn't exist; it's harmless.
- `httpd.Dockerfile` echoes the build-arg password and the Ansible task prints it via `debug`, so build logs contain the password.
- The repo is about 21k files, most of them images and vendored Zend/Eti libraries per year. Scope searches to a specific year or to `etc/`, `docker/` and `scripts/`.
