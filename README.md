# CoL Annual Checklist Archives

## Installation

1. Download the database dumps into the data directory.

(GBIF has a copy on NFS at `col/archives`.)

2. Provisioning the database will take a few hours, but it only needs to be done once with the commands:

```
echo DATABASE_PASSWORD=$(< /dev/urandom tr -dc _A-Za-z0-9- | head -c${1:-20}) > .env
docker-compose up database
docker-compose run provision
```

3. To run the CoL annual checklist archives run:

```
docker-compose up checklists
```

Tentatively the annual checklist will run at:

- http://localhost/annual-checklist/2005
- http://localhost/annual-checklist/2006
- http://localhost/annual-checklist/2007
- http://localhost/annual-checklist/2008
- http://localhost/annual-checklist/2009
- http://localhost/annual-checklist/2010
- http://localhost/annual-checklist/2011
- http://localhost/annual-checklist/2012
- http://localhost/annual-checklist/2013
- http://localhost/annual-checklist/2014
- http://localhost/annual-checklist/2015
- http://localhost/annual-checklist/2016
- http://localhost/annual-checklist/2017
- http://localhost/annual-checklist/2018
- http://localhost/annual-checklist/2019

With the current DNS, they are available at:

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
