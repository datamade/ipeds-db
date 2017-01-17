PG_DB=ipeds

2014_2015_TABLES=ADM2014.table C2014_A.table C2014_B.table		\
	C2014_C.table C2014DEP CUSTOMCGIDS2014.table DRVAL2014.table	\
	DRVC2014.table DRVEF122014.table DRVEF2014.table DRVF2014	\
	DRVHR2014.table DRVIC2014.table EAP2014.table EF2014.table	\
	EF2014A.table EF2014A_DIST.table EF2014B EF2014C.table		\
	EF2014CP.table EF2014D.table EFFY2014.table EFIA2014.table	\
	F1314_F1A.table F1314_F2 F1314_F3.table filenames14.table	\
	FLAGS2014.table GR200_14.table GR2014.table GR2014_L2.table	\
	HD2014 IC2014.table IC2014_AY.table IC2014_PY.table		\
	IC2014MISSION.table S2014_IS.table S2014_NH.table S2014_OC	\
	S2014_SIS.table SAL2014_IS.table SAL2014_NIS.table		\
	sectiontable14.table SFA1314_P2.table SFAV1314 Tables14.table	\
	valuesets14.table vartable14.table AL2014.table			\
	DRVADM2014.table DRVGR2014 SFA1314_P1

.PHONY : all
all : $(2014_2015_TABLES)

$(PG_DB) :
	createdb $@
	touch $@

IPEDS_2014-15_Provisional.zip :
	wget "http://nces.ed.gov/ipeds/tablefiles/zipfiles/$@"
	touch $@

IPEDS201415.accdb : IPEDS_2014-15_Provisional.zip
	unzip $<
	touch $@

%.csv : IPEDS201415.accdb
	 mdb-export $< $* | sed 's/ *",/",/g' | csvcut > $@

%.table : %.csv
	head -200000 $< | \
            csvsql --db postgresql:///$(PG_DB) --table $*
	cat $< | \
            psql -d $(PG_DB) -c "COPY \"$*\" FROM STDIN WITH CSV HEADER"
	touch $@


.PHONY : clean
clean :
	- rm $(PG_DB) tables IPEDS_2014-15_Provisional.zip IPEDS201415.accdb $(2014_2015_TABLES)


