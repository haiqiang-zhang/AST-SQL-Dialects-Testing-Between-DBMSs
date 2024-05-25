CREATE TABLE t1(a,b);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t1 VALUES(3,4);
SELECT * FROM t1;
CREATE TABLE t2(x,y);
INSERT INTO t2 VALUES(1,'x');
INSERT INTO t2 VALUES(2,'y');
SELECT * FROM t2;
ATTACH DATABASE 'test2.db' AS two;
SELECT * FROM t2;
DETACH DATABASE two;
SELECT * FROM t1;
SELECT * FROM t2;
ATTACH DATABASE 'test3.db' AS three;
SELECT * FROM three.sqlite_master;
DETACH DATABASE [three];
ATTACH 'test.db' AS db2;
ATTACH 'test.db' AS db3;
ATTACH 'test.db' AS db4;
ATTACH 'test.db' AS db5;
ATTACH 'test.db' AS db6;
ATTACH 'test.db' AS db7;
ATTACH 'test.db' AS db8;
ATTACH 'test.db' AS db9;
PRAGMA database_list;
ATTACH 'test.db' as db10;
ATTACH 'test.db' as db11;
DETACH db5;
PRAGMA database_list;
PRAGMA integrity_check;
select * from temp.sqlite_master;
ATTACH 'test.db' as db12;
DETACH db12;
DETACH db11;
DETACH db10;
DETACH db9;
DETACH db8;
DETACH db7;
DETACH db6;
DETACH db4;
DETACH db3;
DETACH db2;
PRAGMA database_list;
CREATE TABLE tx(x1,x2,y1,y2);
SELECT * FROM tx;
UPDATE t2 SET x=x+10;
SELECT * FROM tx;
SELECT * FROM tx;
ATTACH 'test2.db' AS db2;
SELECT * FROM main.tx;
SELECT type, name, tbl_name FROM db2.sqlite_master;
PRAGMA database_list;
CREATE INDEX i2 ON t2(x);
SELECT * FROM t2 WHERE x>5;
SELECT type, name, tbl_name FROM sqlite_master;
PRAGMA database_list;
SELECT * FROM t2 WHERE x>5;
SELECT type, name, tbl_name FROM sqlite_master;
SELECT type, name, tbl_name FROM db2.sqlite_master;
SELECT type, name, tbl_name FROM db2.sqlite_master;
SELECT * FROM t1;
SELECT * FROM t2;
SELECT * FROM t2;
BEGIN;
SELECT * FROM t2;
SELECT * FROM t2;
SELECT * FROM t2;
UPDATE t2 SET x=x+1 WHERE x=50;
SELECT * FROM t2;
SELECT * FROM t2;
BEGIN;
BEGIN;
UPDATE t2 SET x=0 WHERE 0;
SELECT * FROM t2;
SELECT * FROM t2;
SELECT * FROM t1;
UPDATE t1 SET a=a+1;
SELECT * FROM t1;
UPDATE t2 SET x=x+1 WHERE x=50;
SELECT * FROM t1;
SELECT * FROM t1;
DETACH db2;
CREATE TABLE t3(x,y);
CREATE UNIQUE INDEX t3i1 ON t3(x);
INSERT INTO t3 VALUES(1,2);
SELECT * FROM t3;
INSERT INTO t3 VALUES(9,10);
SELECT * FROM t3;
ATTACH DATABASE 'test2.db' AS db2;
SELECT * FROM main.t3;
DETACH db2;
CREATE TABLE t4(x);
INSERT INTO t3 VALUES(6,7);
SELECT * FROM t4;
INSERT INTO main.t3 VALUES(11,12);
SELECT * FROM main.t4;
ATTACH DATABASE 'test2.db' AS db2;
INSERT INTO main.t3 VALUES(15,16);
DETACH DATABASE db2;
CREATE VIEW v3 AS SELECT x*100+y FROM t3;
SELECT * FROM v3;
SELECT * FROM v3;
ATTACH DATABASE 'test2.db' AS db2;
SELECT * FROM main.v3;
ATTACH DATABASE 'test.db' AS orig;
CREATE TABLE t5(x,y);
CREATE TEMP TABLE t6(p,q,r);
ATTACH DATABASE 'no-such-file' AS nosuch;
ATTACH DATABASE 'cannot-read' AS noread;
ATTACH 'test2.db' AS t2;
ATTACH 'test4.db' AS aux1;
CREATE TABLE aux1.t1(a, b);
INSERT INTO aux1.t1 VALUES(1, 2);
ATTACH 'test4.db' AS aux2;
SELECT * FROM aux2.t1;
BEGIN;
INSERT INTO aux1.t1 VALUES(3, 4);
INSERT INTO aux2.t1 VALUES(5, 6);
SELECT * FROM aux2.t1;
ATTACH '' AS noname;
ATTACH ':memory:' AS inmem;
BEGIN;
CREATE TABLE noname.noname(x);
CREATE TABLE inmem.inmem(y);
CREATE TABLE main.main(z);
SELECT name FROM noname.sqlite_master;
SELECT name FROM inmem.sqlite_master;
PRAGMA database_list;
SELECT * FROM aux1.t1;
CREATE TABLE Table1 (col TEXT NOT NULL PRIMARY KEY);
CREATE TABLE db2.Table2(col1 INTEGER, col2 INTEGER, col3 INTEGER, col4);
CREATE UNIQUE INDEX db2.idx_col1_unique ON Table2 (col1);
CREATE UNIQUE INDEX db2.idx_col23_unique ON Table2 (col2, col3);
CREATE INDEX db2.idx_col2 ON Table2 (col2);
INSERT INTO Table2 VALUES(1,2,3,4);
PRAGMA integrity_check;
