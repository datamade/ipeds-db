# ipeds-db
Use the Makefile to build a Postgres DB from IPEDS Access files.

Currently, it uses the 2014-15 Provisional data from https://nces.ed.gov/ipeds/Section/accessdatabase/

## Requirements
* posix operating system (linux or mac os, that sort of thing)
* mdbtools
* csvkit
* postgres
* wget
* make

## To use

```bash
make
make clean
```

Running the MakeFile generates a PSQL database called `ipeds`. You can query this database however you like, or you can use the [ipeds-csv](https://github.com/datamade/ipeds-csv) repository to create a spreadsheet of college data, importable to the [College Matching site](https://github.com/datamade/college-matching-django).

## Copyright

Copyright (c) 2017 DataMade. Released under the [MIT License](https://github.com/datamade/ipeds-csv/blob/master/LICENSE).