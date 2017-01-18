# ipeds-db
Build a Postgres DB from IPEDS Access files

Right now it uses the 2014-15 Provisional data from https://nces.ed.gov/ipeds/Section/accessdatabase/

## Requirements
* posix operating system (linux or mac os, that sort of thing)
* mdbtools
* python
* csvkit
* postgres
* wget
* make

### On Ubuntu, install requirements like
```bash
sudo apt-get install mdbtools postgres
pip install csvkit
```

### On Mac OS X, install requirements like
```bash
brew install mdbtools postgres wget python
pip install csvkit
```

## To use

```bash
make
make clean
```
