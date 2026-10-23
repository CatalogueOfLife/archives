import os
import subprocess
import sys

# Usage: provision.py              create databases, import the dumps found in the data dir, create the read-only user
#        provision.py --force      also re-import years whose database already has tables
#        provision.py --users-only only (re)create the read-only user on an existing database
#
# Dumps are https://download.checklistbank.org/col/annual/<year>_mysql.sql.zst; years without a dump are skipped.

DATABASE_PASSWORD = os.environ['DATABASE_PASSWORD']
DATABASE_RO_PASSWORD = os.environ.get('DATABASE_RO_PASSWORD')
DATA = '/home/col/data'

YEARS = range(2019, 2004, -1)

# password via the environment, not the command line
ENV = dict(os.environ, MYSQL_PWD=DATABASE_PASSWORD)


def mysql(*args, **kwargs):
    return subprocess.run(['mysql', '-hdatabase', '-uroot', *args], env=ENV, check=True, **kwargs)


def has_tables(db):
    out = mysql('-N', '-e', f"SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '{db}'",
                capture_output=True, text=True).stdout
    return int(out.strip()) > 0


def import_dump(year):
    db = f'col{year}ac'
    dump = f'{DATA}/{year}_mysql.sql.zst'
    if not os.path.exists(dump):
        print(f'SKIP {year}: no dump {os.path.basename(dump)}')
        return
    if has_tables(db) and '--force' not in sys.argv:
        print(f'SKIP {year}: {db} already imported (use --force to re-import)')
        return
    print(f'Importing {year} into {db}...', flush=True)
    zstd = subprocess.Popen(['zstdcat', dump], stdout=subprocess.PIPE)
    db_ok = subprocess.run(['mysql', '-hdatabase', '-uroot', db], stdin=zstd.stdout, env=ENV).returncode == 0
    zstd.stdout.close()
    if zstd.wait() != 0 or not db_ok:
        print(f'FAILED {year}')


def create_ro_user():
    if not DATABASE_RO_PASSWORD:
        sys.exit('DATABASE_RO_PASSWORD is not set')
    print('Creating read-only user col_ro...')
    pw = DATABASE_RO_PASSWORD.replace("'", "''")
    sql = f"CREATE USER IF NOT EXISTS 'col_ro'@'%' IDENTIFIED BY '{pw}';\n" \
          f"ALTER USER 'col_ro'@'%' IDENTIFIED BY '{pw}';\n"
    sql += ''.join(f"GRANT SELECT, EXECUTE ON `col{y}ac`.* TO 'col_ro'@'%';\n" for y in YEARS)
    mysql(input=sql.encode())


# Wait for database, showing why it isn't reachable yet
subprocess.run(['sh', '-c', 'until mysqladmin ping -hdatabase -uroot; do sleep 5; done'], env=ENV)

if '--users-only' not in sys.argv:
    print('Creating databases...')
    mysql(input=''.join(f'CREATE DATABASE IF NOT EXISTS col{y}ac DEFAULT CHAR SET utf8 COLLATE utf8_general_ci;\n'
                        for y in YEARS).encode())
    for y in YEARS:
        import_dump(y)

create_ro_user()
