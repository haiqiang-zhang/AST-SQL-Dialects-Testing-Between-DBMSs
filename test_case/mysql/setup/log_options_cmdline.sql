CREATE TABLE t1(a int);
INSERT INTO t1 SELECT FOUND_ROWS();
INSERT INTO t1 SELECT FOUND_ROWS();
INSERT INTO t1 SELECT FOUND_ROWS();
DROP TABLE t1;