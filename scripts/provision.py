import os
import subprocess
import sys

# Usage: provision.py              create databases, import all dumps, create the read-only user
#        provision.py --users-only  only (re)create the read-only user on an existing database

DATABASE_PASSWORD = os.environ['DATABASE_PASSWORD']
DATABASE_RO_PASSWORD = os.environ.get('DATABASE_RO_PASSWORD')

# dump file per database, newest first
DUMPS = [(f'col{y}ac', f'mysql_col{y}ac.sql.zst') for y in range(2019, 2011, -1)] + [
    ('col2011ac', 'mysql_baseschema_2011_v19.sql.zst')] + [
    (f'col{y}ac', f'mysql_col{y}ac.sql.zst') for y in range(2010, 2004, -1)]

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
    with open('/home/col/data/provision.sql', 'rb') as f:
        mysql('col', f)
    for db, dump in DUMPS:
        print(f'Importing {db}...')
        zstd = subprocess.Popen(['zstdcat', f'/home/col/data/{dump}'], stdout=subprocess.PIPE)
        mysql(db, zstd.stdout)
        zstd.wait()

create_ro_user()
