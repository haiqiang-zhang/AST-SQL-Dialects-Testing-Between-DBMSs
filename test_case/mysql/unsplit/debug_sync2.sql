CREATE TABLE t1 (pk INT, PRIMARY KEY(pk));
INSERT INTO t1 VALUES(1);
DROP TABLE t1;
CREATE TABLE t1(a INT);
CREATE TABLE t2(a INT);
INSERT INTO t1 VALUES (0);
INSERT INTO t2 VALUES (0);
DELETE FROM t1;
DELETE FROM t2;
DROP TABLE t1,t2;
