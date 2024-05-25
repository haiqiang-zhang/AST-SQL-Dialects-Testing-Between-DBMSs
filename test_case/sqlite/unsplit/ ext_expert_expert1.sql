CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
WITH s(i) AS ( VALUES(1) UNION ALL SELECT i+1 FROM s WHERE i<100)
  INSERT INTO t1 SELECT (i-1)/50, (i-1)/20 FROM s;
WITH s(i) AS ( VALUES(1) UNION ALL SELECT i+1 FROM s WHERE i<100)
  INSERT INTO t2 SELECT (i-1)/20, (i-1)/5 FROM s;
CREATE INDEX t1_idx_00000061 ON t1(a);
CREATE INDEX t1_idx_00000062 ON t1(b);
CREATE INDEX t1_idx_000123a7 ON t1(a, b);
CREATE INDEX t2_idx_00000063 ON t2(c);
CREATE INDEX t2_idx_00000064 ON t2(d);
CREATE INDEX t2_idx_0001295b ON t2(c, d);
ANALYZE;
SELECT * FROM sqlite_stat1 ORDER BY 1, 2;
