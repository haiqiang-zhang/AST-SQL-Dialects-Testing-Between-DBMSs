PRAGMA cache_size = 1;
PRAGMA auto_vacuum = 2;
CREATE TABLE t1(x);
CREATE TABLE t2(x UNIQUE);
INSERT INTO t2 VALUES(1), (2), (3);
DROP TABLE t1;
PRAGMA integrity_check;