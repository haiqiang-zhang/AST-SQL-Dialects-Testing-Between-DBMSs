PRAGMA auto_vacuum = 0;
PRAGMA journal_mode = wal;
PRAGMA synchronous = normal;
CREATE TABLE t1(a, b, c);
INSERT INTO t1 VALUES(1, 2, 3);
INSERT INTO t1 VALUES(4, 5, 6);
INSERT INTO t1 VALUES(7, 8, 9);
PRAGMA wal_checkpoint;
INSERT INTO t1 VALUES(10, 11, 12);
PRAGMA synchronous = normal;
INSERT INTO t1 VALUES(13, 14, 15);
INSERT INTO t1 VALUES(16, 17, 18);
PRAGMA wal_checkpoint;
INSERT INTO t1 VALUES(10, 11, 12);
PRAGMA journal_size_limit = 10000;
PRAGMA journal_mode = wal;
PRAGMA wal_checkpoint;
PRAGMA journal_size_limit = 8000;
PRAGMA wal_checkpoint;
PRAGMA journal_mode = wal;
PRAGMA wal_checkpoint;
PRAGMA wal_checkpoint;
SELECT hex(randomblob(4000));
PRAGMA journal_mode = wal;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA auto_vacuum = 0;
PRAGMA page_size = 1024;
PRAGMA journal_mode = wal;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA auto_vacuum = 0;
PRAGMA page_size = 1024;
PRAGMA journal_mode = wal;
PRAGMA wal_checkpoint;
PRAGMA auto_vacuum = 0;
PRAGMA page_size = 1024;
PRAGMA journal_mode = wal;
PRAGMA wal_checkpoint;
PRAGMA auto_vacuum = 0;
PRAGMA page_size = 1024;
PRAGMA journal_mode = wal;
SELECT count(*) FROM t1;
PRAGMA wal_checkpoint;
SELECT count(*) FROM t1;
PRAGMA auto_vacuum = 0;
PRAGMA page_size = 1024;
PRAGMA journal_mode = wal;
SELECT count(*) FROM t1;