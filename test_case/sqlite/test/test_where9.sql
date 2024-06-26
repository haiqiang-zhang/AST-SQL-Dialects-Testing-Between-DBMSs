ANALYZE t5;
SELECT a FROM t6 WHERE x='y' AND (b=913 OR c=27027) ORDER BY a;
SELECT a FROM t6 WHERE x='n' AND (b=913 OR c=27027) ORDER BY a;
SELECT a FROM t6 WHERE (x='y' OR y='y') AND b=913 ORDER BY a;
SELECT a FROM t6 WHERE (x='y' OR y='y') AND c=27027 ORDER BY a;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b TEXT);
CREATE TABLE t2_a(k INTEGER PRIMARY KEY, v TEXT);
CREATE TABLE t2_b(k INTEGER PRIMARY KEY, v TEXT);
CREATE VIEW t2 AS SELECT * FROM t2_a UNION ALL SELECT * FROM t2_b;
SELECT 1 FROM t1 JOIN t1 USING(a)
   WHERE (a=1)
      OR (a=2 AND (SELECT 4 FROM t2,(SELECT 5 FROM t1 ORDER BY a) WHERE a));
