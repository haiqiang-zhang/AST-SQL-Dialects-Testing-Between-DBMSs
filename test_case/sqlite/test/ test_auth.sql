CREATE TABLE t1(a,b,c);
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
CREATE TEMP TABLE t1(a,b,c);
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_temp_master;
CREATE TABLE t2(a,b,c);
SELECT name FROM sqlite_master;
DROP TABLE t2;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
DROP TABLE t1;
SELECT name FROM sqlite_temp_master;
DROP TABLE t1;
SELECT name FROM sqlite_temp_master;
ATTACH DATABASE 'test.db' AS two;
DETACH DATABASE two;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
CREATE VIEW v1 AS SELECT a+1,b+1 FROM t2;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
CREATE TEMPORARY VIEW v1 AS SELECT a+1,b+1 FROM t2;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_temp_master;
CREATE VIEW v2 AS SELECT a+1,b+1 FROM t2;
DROP VIEW v2;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
DROP VIEW v1;
SELECT name FROM temp.sqlite_master;
DROP VIEW v1;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
CREATE TABLE tx(id);
SELECT name FROM sqlite_master WHERE type='trigger';
SELECT * FROM tx;
SELECT name FROM sqlite_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
DROP TABLE tx;
SELECT name FROM sqlite_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM sqlite_temp_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM temp.sqlite_master;
SELECT name FROM temp.sqlite_master;
PRAGMA full_column_names=on;
PRAGMA full_column_names=on;
PRAGMA full_column_names=on;
PRAGMA full_column_names=OFF;
BEGIN;
BEGIN;
ATTACH DATABASE ':memory:' AS test1;
DETACH DATABASE test1;
ATTACH DATABASE ':memory:' AS test1;
PRAGMA database_list;
DETACH DATABASE test1;
ATTACH DATABASE ':memory:' AS test1;
PRAGMA database_list;
DETACH DATABASE test1;
PRAGMA database_list;
ATTACH DATABASE ':memory:' AS test1;
DETACH DATABASE test1;
PRAGMA database_list;
PRAGMA database_list;
SELECT name FROM sqlite_temp_master WHERE type='table';
SELECT name FROM temp.sqlite_master WHERE type='table';
SELECT name FROM sqlite_temp_master WHERE type='table';
SELECT name FROM sqlite_master WHERE type='table';
SELECT name FROM sqlite_master WHERE type='table';
SELECT name FROM sqlite_master WHERE type='table';
CREATE TABLE t3(a PRIMARY KEY, b, c);
CREATE INDEX t3_idx1 ON t3(c COLLATE BINARY);
CREATE INDEX t3_idx2 ON t3(b COLLATE NOCASE);
REINDEX t3_idx1;
REINDEX BINARY;
REINDEX NOCASE;
REINDEX t3;
DROP TABLE t3;
CREATE TEMP TABLE t3(a PRIMARY KEY, b, c);
CREATE INDEX t3_idx1 ON t3(c COLLATE BINARY);
CREATE INDEX t3_idx2 ON t3(b COLLATE NOCASE);
REINDEX temp.t3_idx1;
REINDEX BINARY;
REINDEX NOCASE;
REINDEX temp.t3;
REINDEX temp.t3;
DROP TABLE t3;
CREATE TABLE t4(a,b,c);
CREATE INDEX t4i1 ON t4(a);
CREATE INDEX t4i2 ON t4(b,a,c);
INSERT INTO t4 VALUES(1,2,3);
ANALYZE;
SELECT count(*) FROM sqlite_stat1;
ANALYZE;
SELECT count(*) FROM sqlite_stat1;
CREATE TABLE t5(x);
ALTER TABLE t5 ADD COLUMN new_col_1;
SELECT sql FROM sqlite_master WHERE name='t5';
ALTER TABLE t5 DROP COLUMN new_col_1;
ALTER TABLE t5 ADD COLUMN new_col_2;
SELECT sql FROM sqlite_master WHERE name='t5';
SELECT 1 FROM sqlite_schema WHERE name='t5' AND sql LIKE '%new_col_1%';
ALTER TABLE t5 ADD COLUMN new_col_3;
SELECT sql FROM temp.sqlite_master WHERE type='t5';
SELECT 1 FROM sqlite_schema WHERE name='t5' AND sql LIKE '%new_col_1%';
DROP TABLE t5;
SELECT name FROM pragma_table_info('t1') ORDER BY cid;
SELECT name FROM pragma_table_info('t1') ORDER BY cid;
SELECT name FROM pragma_table_info('t1') ORDER BY cid;
SELECT * FROM pragma_table_list WHERE name='xyzzy';
CREATE TABLE t3(x INTEGER PRIMARY KEY, y, z);
SELECT * FROM t3;
SELECT y,z FROM t3;
SELECT ROWID,y,z FROM t3;
SELECT OID,y,z FROM t3;
INSERT INTO t3 VALUES(44,55,66);
SELECT * FROM t3;
SELECT rowid,y,z FROM t3;
SELECT * FROM t3;
SELECT ROWID,y,z FROM t3;
CREATE TABLE tx(a1,a2,b1,b2,c1,c2);
SELECT * FROM tx;
DELETE FROM tx;
SELECT * FROM tx;
CREATE VIEW v1 AS SELECT a+b AS x FROM t2;
CREATE TABLE v1chng(x1,x2);
SELECT count(a) AS cnt FROM t4 ORDER BY cnt;
DROP TABLE tx;
DROP TABLE v1chng;
SELECT name FROM (
        SELECT * FROM sqlite_master UNION ALL SELECT * FROM temp.sqlite_master)
      WHERE type='table'
      ORDER BY name;
CREATE TABLE t5 ( x );
INSERT INTO t5 (x) values(0);
SELECT * FROM t5;
CREATE TABLE t6(a,b,c,d,e,f,g,h);
INSERT INTO t6 VALUES(1,2,3,4,5,6,7,8);
UPDATE t6 SET rowID=rowID+100;
SELECT rowid, * FROM t6;
CREATE TABLE t7(a, b, c);
CREATE VIEW v7 AS SELECT * FROM t7;
SELECT a, c FROM v7;
SELECT a, c FROM t7;
SELECT a, c FROM t7 AS v7;
SELECT count(*) FROM t7;
SELECT t6.a FROM t6, t7;
SELECT count(*) FROM t7;