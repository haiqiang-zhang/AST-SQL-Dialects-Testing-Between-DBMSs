CREATE TABLE t (c VARCHAR(8));
INSERT INTO t VALUES ('aabbccdd');
SELECT DISTINCT * FROM t;
DROP TABLE t;