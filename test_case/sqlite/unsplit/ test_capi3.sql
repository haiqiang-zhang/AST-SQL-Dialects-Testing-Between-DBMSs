CREATE TABLE tablename(x);
CREATE TABLE t1(a VARINT, b BLOB, c VARCHAR(16));
INSERT INTO t1 VALUES(1, 2, 3);
INSERT INTO t1 VALUES('one', 'two', NULL);
INSERT INTO t1 VALUES(1.2, 1.3, 1.4);
pragma encoding;
SELECT * FROM sqlite_master;
PRAGMA writable_schema=ON;
INSERT INTO sqlite_master VALUES(NULL,NULL,NULL,NULL,NULL);
SELECT * FROM sqlite_master;
PRAGMA writable_schema=ON;
INSERT INTO sqlite_master VALUES('table',NULL,NULL,NULL,NULL);
SELECT * FROM sqlite_master;
select * from sqlite_master;
select * from sqlite_master where rowid>5;
BEGIN;
SELECT * FROM t1;
CREATE TABLE t2(a);
INSERT INTO t2 VALUES(1);
INSERT INTO t2 VALUES(2);
BEGIN;
INSERT INTO t2 VALUES(3);
SELECT a FROM t2;
SELECT a FROM t2;
BEGIN;
BEGIN;
INSERT INTO t2 VALUES(4);
BEGIN;
SELECT a FROM t1;
DELETE FROM t1;
SELECT * FROM t1;
CREATE TABLE t4(x);
INSERT INTO t4 VALUES('abcdefghij');