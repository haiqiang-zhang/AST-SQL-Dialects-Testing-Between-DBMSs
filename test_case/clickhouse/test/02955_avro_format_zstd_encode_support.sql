DROP TABLE IF EXISTS t;
INSERT INTO t SELECT *
FROM numbers(10);
SELECT sum(n1) 
FROM t;
DROP TABLE t;