CREATE TABLE t (c INT);
INSERT INTO t VALUES (1);
SELECT * FROM (SELECT COUNT(*) FROM t GROUP BY c) as dt;
DROP TABLE t;
