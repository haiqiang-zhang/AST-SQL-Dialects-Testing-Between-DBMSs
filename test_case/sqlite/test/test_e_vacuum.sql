VACUUM;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = none;
PRAGMA freelist_count;
VACUUM;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = full;
PRAGMA freelist_count;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = incremental;
PRAGMA freelist_count;
VACUUM;
PRAGMA page_size = 1024;
VACUUM;
PRAGMA page_size = 1024;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = FULL;
PRAGMA page_size;
PRAGMA auto_vacuum;
PRAGMA page_size = 2048;
PRAGMA auto_vacuum = NONE;
PRAGMA page_size;
PRAGMA auto_vacuum;
PRAGMA journal_mode = delete;
PRAGMA page_size = 2048;
PRAGMA auto_vacuum = NONE;
VACUUM;
PRAGMA page_size;
PRAGMA auto_vacuum;
PRAGMA journal_mode = wal;
PRAGMA page_size;
PRAGMA auto_vacuum;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = FULL;
VACUUM;
PRAGMA page_size;
PRAGMA auto_vacuum;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = NONE;
ATTACH 'test.db2' AS aux;
PRAGMA aux.page_size = 1024;
DELETE FROM t3;
VACUUM;
VACUUM aux;
CREATE TABLE t4(x);
INSERT INTO t4(x) VALUES('x');
INSERT INTO t4(x) VALUES('y');
INSERT INTO t4(x) VALUES('z');
DELETE FROM t4 WHERE x = 'y';
SELECT rowid, x FROM t4;
VACUUM;
SELECT rowid, x FROM t4;
CREATE TABLE t5(x, y INTEGER PRIMARY KEY);
INSERT INTO t5(x) VALUES('x');
INSERT INTO t5(x) VALUES('y');
INSERT INTO t5(x) VALUES('z');
DELETE FROM t5 WHERE x = 'y';
SELECT rowid, x FROM t5;
VACUUM;
SELECT rowid, x FROM t5;
DROP TABLE t5;
CREATE TABLE t5(x);
INSERT INTO t5(x) VALUES('x');
INSERT INTO t5(x) VALUES('y');
INSERT INTO t5(x) VALUES('z');
DELETE FROM t5 WHERE x = 'y';
SELECT rowid, x FROM t5;
ATTACH 'test2.db' AS aux1;
DETACH aux1;
VACUUM;
SELECT rowid, x FROM t5;
BEGIN;
VACUUM;
VACUUM;
VACUUM;
VACUUM;
PRAGMA page_size = 1024;
VACUUM;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = FULL;
PRAGMA auto_vacuum;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = FULL;
DELETE FROM t1;
DELETE FROM t2;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = INCREMENTAL;
DELETE FROM t1;
DELETE FROM t2;
PRAGMA incremental_vacuum;
