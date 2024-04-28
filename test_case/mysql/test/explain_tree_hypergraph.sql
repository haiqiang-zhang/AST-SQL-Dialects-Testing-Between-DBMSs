
CREATE TABLE num (n INT);
INSERT INTO num VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

CREATE TABLE t1 (a INT PRIMARY KEY, b INT);
INSERT INTO t1 SELECT n,n FROM num;

-- Dependent subquery.
EXPLAIN FORMAT=TREE SELECT * FROM t1 x1
WHERE x1.b = (SELECT MAX(b) FROM t1 x2 WHERE x2.a>x1.a);

-- Independent subquery.
EXPLAIN FORMAT=TREE SELECT * FROM t1 x1
WHERE x1.b = (SELECT MAX(b) FROM t1 x2 WHERE x2.a>5);

-- Independent subquery with random function. The subquery should be
-- reevaluated for each x1 row.
EXPLAIN FORMAT=TREE SELECT * FROM t1 x1
WHERE x1.b = (SELECT MAX(b) FROM t1 x2 WHERE x2.a>10*rand(0));

-- Single-row subquery in HAVING condition.
EXPLAIN FORMAT=TREE SELECT SUM(x1.a) s FROM t1 x1
GROUP BY x1.b HAVING s>(SELECT MAX(x2.a) FROM t1 x2);

-- Single-row subquery with random function in HAVING condition.
-- The subquery must be reevaluated for each aggregated row.
EXPLAIN FORMAT=TREE SELECT SUM(x1.a) s FROM t1 x1
GROUP BY x1.b HAVING s>(SELECT MAX(x2.a+RAND(0)) FROM t1 x2);

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

-- A row estimate of 0.001 is the lowest number to be formatted as a decimal
-- number.
--replace_regex $elide_costs
EXPLAIN FORMAT=TREE SELECT * FROM t1 WHERE e=0 AND c=0;

-- Here we switch to engineering format for the row estimate, as it is less
-- than 0.001.
--replace_regex $elide_costs
EXPLAIN FORMAT=TREE SELECT * FROM t1 WHERE e=0 AND c=0 AND f<999;

-- Row estimate before 'Limit' should be in engineerig format, as it has more
-- than six digits. Row estimate after 'Limit' should be a decimal number.
--replace_regex $elide_costs
EXPLAIN FORMAT=TREE SELECT * FROM t1 x1, t1 x2 LIMIT 999999;


-- The row estimate is equal to the lower limit of 1e-12, and therefore printed
-- in engineering format rather than as "0".
--replace_regex $elide_costs
EXPLAIN FORMAT=TREE SELECT * FROM t1 WHERE d=0 AND c=0 AND e=0 AND f=0 AND g=0;

-- The row estimate is less than 1e-12, therefore we print it as "0".
--replace_regex $elide_costs
EXPLAIN FORMAT=TREE
SELECT * FROM t1 WHERE a=0 AND b=0 AND c=0 AND e=0 AND f=0 AND g=0 AND h=0;

-- The row estimate should be rounded to 1e+9
--replace_regex $elide_costs
EXPLAIN FORMAT=TREE SELECT * FROM t1 x1, t1 x2, t1 x3 LIMIT 999500000;

-- The row estimate should be rounded to 999e+6
--replace_regex $elide_costs
EXPLAIN FORMAT=TREE SELECT * FROM t1 x1, t1 x2, t1 x3 LIMIT 999499999;

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