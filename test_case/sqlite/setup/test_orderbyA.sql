CREATE TABLE t1(a, b, c);
INSERT INTO t1 VALUES('one',   1, 11);
INSERT INTO t1 VALUES('three', 7, 11);
INSERT INTO t1 VALUES('one',   2, 11);
INSERT INTO t1 VALUES('one',   3, 11);
INSERT INTO t1 VALUES('two',   4, 11);
INSERT INTO t1 VALUES('two',   6, 11);
INSERT INTO t1 VALUES('three', 8, 11);
INSERT INTO t1 VALUES('two',   5, 11);
INSERT INTO t1 VALUES('three', 9, 11);
DROP INDEX IF EXISTS i1;