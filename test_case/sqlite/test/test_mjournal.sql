SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t1;
ATTACH 'test.db2' AS dbfile;
ATTACH ''         AS dbtemp;
ATTACH ':memory:'  AS dbmem;
CREATE TABLE dbtemp.t3(x);
CREATE TABLE dbmem.t4(x);
BEGIN;
BEGIN;
INSERT INTO t3 VALUES(1);
BEGIN;
INSERT INTO t4 VALUES(1);
