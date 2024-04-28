DROP TABLE IF EXISTS t1;

CREATE TABLE t1 (a INT, INDEX (a));
INSERT INTO t1 VALUES (),(),(),(),(),(),(),(),(),();
SELECT a FROM t1 ORDER BY a LIMIT 1;
SELECT a FROM t1 ORDER BY a DESC LIMIT 1;
SELECT a FROM t1 ORDER BY a LIMIT 3;
SELECT a FROM t1 ORDER BY a DESC LIMIT 3;

DROP TABLE t1;