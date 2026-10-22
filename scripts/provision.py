import os
import subprocess
import sys

# Usage: provision.py              create databases, import all dumps, create the read-only user
#        provision.py --users-only  only (re)create the read-only user on an existing database

DATABASE_PASSWORD = os.environ['DATABASE_PASSWORD']
DATABASE_RO_PASSWORD = os.environ.get('DATABASE_RO_PASSWORD')

# candidate dump files per database, newest first; the first one present in data/ is imported.
# <year>_mysql.sql.gz are the public dumps from https://download.checklistbank.org/col/annual/.
# The public 2011 dump has the pre-2011 schema, the 2011 app needs the base schema dump kept by GBIF.
DUMPS = [(f'col{y}ac', [f'{y}_mysql.sql.gz', f'mysql_col{y}ac.sql.zst']) for y in range(2019, 2011, -1)] + [
    ('col2011ac', ['mysql_baseschema_2011_v19.sql.zst', 'mysql_baseschema_2011_v19.sql.gz'])] + [
    (f'col{y}ac', [f'{y}_mysql.sql.gz', f'mysql_col{y}ac.sql.zst']) for y in range(2010, 2004, -1)]
DATA = '/home/col/data'

# password via the environment, not the command line
ENV = dict(os.environ, MYSQL_PWD=DATABASE_PASSWORD)


def mysql(db, stdin):
    subprocess.run(['mysql', '-hdatabase', '-uroot', db], stdin=stdin, env=ENV, check=True)


def create_ro_user():
    if not DATABASE_RO_PASSWORD:
        sys.exit('DATABASE_RO_PASSWORD is not set')
    print('Creating read-only user col_ro...')
    pw = DATABASE_RO_PASSWORD.replace("'", "''")
    sql = f"CREATE USER IF NOT EXISTS 'col_ro'@'%' IDENTIFIED BY '{pw}';\n" \
          f"ALTER USER 'col_ro'@'%' IDENTIFIED BY '{pw}';\n"
    sql += ''.join(f"GRANT SELECT, EXECUTE ON `{db}`.* TO 'col_ro'@'%';\n" for db, _ in DUMPS)
    subprocess.run(['mysql', '-hdatabase', '-uroot'], input=sql.encode(), env=ENV, check=True)


# Wait for database
subprocess.run(['sh', '-c', 'until mysqladmin ping -hdatabase -uroot --silent; do sleep 2; done'], env=ENV)

if '--users-only' not in sys.argv:
    print('Creating databases...')
    with open(f'{DATA}/provision.sql', 'rb') as f:
        mysql('col', f)
    missing = [names[0] for _, names in DUMPS if not any(os.path.exists(f'{DATA}/{n}') for n in names)]
    if missing:
        sys.exit('Missing dumps in data/: ' + ', '.join(missing))
    for db, names in DUMPS:
        dump = next(f'{DATA}/{n}' for n in names if os.path.exists(f'{DATA}/{n}'))
        print(f'Importing {dump} into {db}...')
        unpack = subprocess.Popen(['zstdcat' if dump.endswith('.zst') else 'zcat', dump], stdout=subprocess.PIPE)
        mysql(db, unpack.stdout)
        if unpack.wait():
            sys.exit(f'Could not unpack {dump}')

create_ro_user()
