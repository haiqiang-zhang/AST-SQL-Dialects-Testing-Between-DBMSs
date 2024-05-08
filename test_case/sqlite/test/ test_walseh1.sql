PRAGMA journal_mode = wal;
CREATE TABLE t1(x, y);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
SELECT * FROM sqlite_schema;
SELECT * FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(5, 6);
SELECT * FROM t1;
PRAGMA wal_checkpoint;
INSERT INTO t1 VALUES(7, 8);
SELECT * FROM t1;
PRAGMA cache_size = 5;
BEGIN;
WITH s(i) AS (
        SELECT 1 UNION ALL SELECT i+1 FROM s WHERE i<50
      )
      INSERT INTO t1 SELECT randomblob(500), randomblob(500) FROM s;
PRAGMA wal_checkpoint = TRUNCATE;
INSERT INTO t1 VALUES(7, 8);
SELECT * FROM t1;