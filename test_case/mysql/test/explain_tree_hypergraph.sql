CREATE TABLE num (n INT);
INSERT INTO num VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);
CREATE TABLE t1 (a INT PRIMARY KEY, b INT);
INSERT INTO t1 SELECT n,n FROM num;
DROP TABLE num,t1;
CREATE TABLE num10 (n INT);
INSERT INTO num10 VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);
CREATE TABLE t1(
  a INT,
  b INT,
  c INT,
  d INT,
  e INT,
  f INT,
  g INT,
  h INT,
  KEY(d)
);
INSERT INTO t1
  SELECT n%17, n% 19, n, n, n, n, n, n
  FROM (SELECT d1.n+d2.n*10+d3.n*100 n FROM num10 d1, num10 d2, num10 d3) num1000;
SELECT * FROM t1 WHERE a=0 AND b=0 AND c=0 AND e=0 AND f=0 AND g=0 AND h=0;
DROP TABLE num10,t1;
CREATE TABLE t(
  x INT,
  y INT DEFAULT (x),
  z VARCHAR(128) DEFAULT (REPEAT('z', 128)), KEY (x));
INSERT INTO t(x) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);
INSERT INTO t SELECT * FROM t;
INSERT INTO t SELECT * FROM t;
INSERT INTO t SELECT * FROM t;
INSERT INTO t SELECT * FROM t;
DROP TABLE t;
CREATE TABLE t (i INT);
INSERT INTO t VALUES (1), (2), (3);
DROP TABLE t;
CREATE TABLE t(x INT, y INT);
SELECT x IN (SELECT x FROM t) FROM t GROUP BY x ORDER BY MAX(y);
DROP TABLE t;
