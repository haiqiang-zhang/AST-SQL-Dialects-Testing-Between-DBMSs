PRAGMA page_size = 1024;
PRAGMA journal_mode = wal;
CREATE TABLE t1(a, b);
SELECT * FROM sqlite_master;
PRAGMA journal_mode = wal;
INSERT INTO t1 VALUES(1, 2);
PRAGMA journal_mode = persist;
SELECT * FROM t1;
SELECT * FROM t1;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = wal;
SELECT * FROM t1;
PRAGMA journal_mode = delete;
PRAGMA main.journal_mode;
PRAGMA journal_mode = delete;
PRAGMA main.journal_mode;
BEGIN;
SELECT * FROM t1;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = wal;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = wal;
BEGIN;
INSERT INTO t1 VALUES(1, 2);
SELECT * FROM t1;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = wal;
INSERT INTO t1 VALUES(3, 4);
SELECT * FROM t1;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = wal;
BEGIN;
INSERT INTO t1 VALUES(1, 2);
SELECT * FROM t1;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = wal;
INSERT INTO t1 VALUES(3, 4);
SELECT * FROM t1;
PRAGMA main.journal_mode;
PRAGMA temp.journal_mode;
PRAGMA temp.journal_mode = wal;
BEGIN;
CREATE TEMP TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 2);
SELECT * FROM t1;
PRAGMA temp.journal_mode;
PRAGMA temp.journal_mode = wal;
INSERT INTO t1 VALUES(3, 4);
SELECT * FROM t1;
PRAGMA temp.journal_mode;
PRAGMA journal_mode = off;
PRAGMA journal_mode = wal;
PRAGMA journal_mode = memory;
PRAGMA journal_mode = wal;
PRAGMA journal_mode = persist;
PRAGMA journal_mode = wal;
PRAGMA journal_mode = delete;
PRAGMA journal_mode = wal;
PRAGMA journal_mode = truncate;
PRAGMA journal_mode = wal;
PRAGMA journal_mode = WAL;
PRAGMA journal_mode;
PRAGMA main.journal_mode;
PRAGMA journal_mode = delete;
PRAGMA journal_mode;
PRAGMA main.journal_mode;
PRAGMA journal_mode = wal;
PRAGMA journal_mode;
PRAGMA main.journal_mode;
PRAGMA journal_mode;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = delete;
PRAGMA journal_mode;
PRAGMA main.journal_mode;
PRAGMA main.journal_mode = wal;
PRAGMA journal_mode;
PRAGMA main.journal_mode;
PRAGMA journal_mode = WAL;
ATTACH 'test.db2' AS two;
PRAGMA main.journal_mode;
PRAGMA two.journal_mode;
PRAGMA two.journal_mode = DELETE;
PRAGMA main.journal_mode;
PRAGMA two.journal_mode;
INSERT INTO two.t2 DEFAULT VALUES;
PRAGMA two.journal_mode;
INSERT INTO t1 DEFAULT VALUES;
PRAGMA main.journal_mode;
PRAGMA journal_mode;
PRAGMA two.journal_mode=WAL;
PRAGMA two.journal_mode;
PRAGMA journal_mode = WAL;
PRAGMA main.journal_mode;
PRAGMA two.journal_mode;
INSERT INTO two.t2 DEFAULT VALUES;
PRAGMA two.journal_mode;
PRAGMA main.journal_mode;
PRAGMA journal_mode = DELETE;
PRAGMA main.journal_mode;
PRAGMA two.journal_mode;
PRAGMA journal_mode = WAL;
PRAGMA main.journal_mode;
PRAGMA two.journal_mode;