CREATE TABLE t1 (i INT);
CREATE TABLE t0 (j INT);
CREATE TEMPORARY TABLE tt AS SELECT * FROM t1;
INSERT INTO tt VALUES (1), (2), (3);
DROP TEMPORARY TABLE tt;