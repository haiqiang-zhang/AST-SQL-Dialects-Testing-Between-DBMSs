PRAGMA journal_mode = delete;
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 2);
PRAGMA wal_checkpoint;
PRAGMA journal_mode = wal;
INSERT INTO t1 VALUES(1, 2);
PRAGMA wal_checkpoint;