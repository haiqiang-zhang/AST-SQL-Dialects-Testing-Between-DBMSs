CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 1), (2, 2), (3, 3), (4, 4);
DELETE FROM t1 WHERE a IN (1, 3);