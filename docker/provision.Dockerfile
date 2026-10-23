FROM python:3.12-slim

ENV HOME /home/col
WORKDIR /home/col

# mysql client (MariaDB's, talks to MySQL 5.7) and zstd for the dumps.
# MariaDB 11.4+ clients verify the server certificate by default, and MySQL 5.7's is self-signed.
RUN apt-get update -y \
 && apt-get install -y --no-install-recommends default-mysql-client zstd \
 && rm -rf /var/lib/apt/lists/* \
 && printf '[client]\nssl-verify-server-cert = 0\n' > /etc/mysql/conf.d/archives.cnf

# provision.py creates the databases itself; the dumps are mounted into /home/col/data
COPY scripts/provision.py /home/col/scripts/provision.py
ENTRYPOINT ["python", "/home/col/scripts/provision.py"]
