# CoL Annual Checklist Archives

## Installation

1. Download the database dumps into the data directory.

2. Provisioning the database will take a few hours, but it only needs to be done once with the command:

```
DATABASE_PASSWORD={password} docker-compose up provision
```

3. To run the CoL annual checklist archives run:

```
DATABASE_PASSWORD={password} docker-compose up checklists
```

Tentatively the annual checklist will run at:

- http://localhost:2500/annual-checklist/2005
- http://localhost:2500/annual-checklist/2006
- http://localhost:2500/annual-checklist/2007
- http://localhost:2500/annual-checklist/2008
- http://localhost:2500/annual-checklist/2009
- http://localhost:2500/annual-checklist/2010
- http://localhost:2500/annual-checklist/2011
- http://localhost:2500/annual-checklist/2012
- http://localhost:2500/annual-checklist/2013
- http://localhost:2500/annual-checklist/2014
- http://localhost:2500/annual-checklist/2015
- http://localhost:2500/annual-checklist/2016
- http://localhost:2500/annual-checklist/2017
- http://localhost:2500/annual-checklist/2018
- http://localhost:2500/annual-checklist/2019
