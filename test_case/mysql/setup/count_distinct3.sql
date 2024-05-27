DROP TABLE IF EXISTS t1, t2;
CREATE TABLE t1 (id INTEGER, grp TINYINT, id_rev INTEGER);
INSERT INTO t1 (id, grp, id_rev) VALUES (@id, @grp, @id_rev);
INSERT INTO t1
SELECT A.id, A.grp, A.id_rev
FROM 
  t1 A,
  (SELECT * FROM t1 B LIMIT 100) B,
  (SELECT * FROM t1 Z LIMIT 42) Z;