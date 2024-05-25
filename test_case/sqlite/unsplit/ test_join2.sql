CREATE TABLE t1(a,b);
INSERT INTO t1 VALUES(1,11);
INSERT INTO t1 VALUES(2,22);
INSERT INTO t1 VALUES(3,33);
SELECT * FROM t1;
CREATE TABLE t2(b,c);
INSERT INTO t2 VALUES(11,111);
INSERT INTO t2 VALUES(33,333);
INSERT INTO t2 VALUES(44,444);
SELECT * FROM t2;
CREATE TABLE t3(c,d);
INSERT INTO t3 VALUES(111,1111);
INSERT INTO t3 VALUES(444,4444);
INSERT INTO t3 VALUES(555,5555);
SELECT * FROM t3;
SELECT * FROM
      t1 NATURAL JOIN t2 NATURAL JOIN t3;
SELECT * FROM
      t1 NATURAL JOIN t2 NATURAL LEFT OUTER JOIN t3;
SELECT * FROM
      t1 NATURAL LEFT OUTER JOIN t2 NATURAL JOIN t3;
SELECT * FROM
      t2 NATURAL RIGHT OUTER JOIN t1 NATURAL JOIN t3;
SELECT * FROM
        t1 NATURAL LEFT OUTER JOIN (t2 NATURAL JOIN t3);
SELECT a, b, c, d FROM
        t2 NATURAL JOIN t3 NATURAL RIGHT JOIN t1;
CREATE TABLE aa(a);
CREATE TABLE bb(b);
CREATE TABLE cc(c);
INSERT INTO aa VALUES('one');
INSERT INTO bb VALUES('one');
INSERT INTO cc VALUES('one');
SELECT * FROM aa JOIN cc ON (a=b) JOIN bb ON (b=c);

  -- not.
  CREATE TABLE t3_1(k3 PRIMARY KEY, v3) WITHOUT ROWID;
CREATE TABLE t3_2(v3, k3 PRIMARY KEY) WITHOUT ROWID;
CREATE TABLE c1(k INTEGER PRIMARY KEY, v1);
CREATE TABLE c2(k INTEGER PRIMARY KEY, v2);
CREATE TABLE c3(k INTEGER PRIMARY KEY, v3);
INSERT INTO c1 VALUES(1, 2);
INSERT INTO c2 VALUES(2, 3);
INSERT INTO c3 VALUES(3, 'v3');
INSERT INTO c1 VALUES(111, 1112);
INSERT INTO c2 VALUES(112, 1113);
INSERT INTO c3 VALUES(113, 'v1113');
SELECT v1, v3 FROM c1 LEFT JOIN c2 ON (c2.k=v1) LEFT JOIN c3 ON (c3.k=v2);
SELECT v1, v3 FROM c1 LEFT JOIN c2 ON (c2.k=v1) LEFT JOIN c3 ON (c3.k=v1+1);
SELECT DISTINCT v1, v3 FROM c1 LEFT JOIN c2 LEFT JOIN c3 ON (c3.k=v1+1);
SELECT v1, v3 FROM c1 LEFT JOIN c2 LEFT JOIN c3 ON (c3.k=v1+1);
DROP TABLE c1;
DROP TABLE c2;
DROP TABLE c3;
CREATE TABLE c1(k UNIQUE, v1);
CREATE TABLE c2(k UNIQUE, v2);
CREATE TABLE c3(k UNIQUE, v3);
INSERT INTO c1 VALUES(1, 2);
INSERT INTO c2 VALUES(2, 3);
INSERT INTO c3 VALUES(3, 'v3');
INSERT INTO c1 VALUES(111, 1112);
INSERT INTO c2 VALUES(112, 1113);
INSERT INTO c3 VALUES(113, 'v1113');
SELECT v1, v3 FROM c1 LEFT JOIN c2 ON (c2.k=v1) LEFT JOIN c3 ON (c3.k=v2);
SELECT v1, v3 FROM c1 LEFT JOIN c2 ON (c2.k=v1) LEFT JOIN c3 ON (c3.k=v1+1);
SELECT DISTINCT v1, v3 FROM c1 LEFT JOIN c2 LEFT JOIN c3 ON (c3.k=v1+1);
SELECT v1, v3 FROM c1 LEFT JOIN c2 LEFT JOIN c3 ON (c3.k=v1+1);
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(x PRIMARY KEY) WITHOUT ROWID;
CREATE TABLE t2(x);
SELECT a.x
    FROM t1 AS a
    LEFT JOIN t1 AS b ON (a.x=b.x)
    LEFT JOIN t2 AS c ON (a.x=c.x);
WITH RECURSIVE c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<10)
    INSERT INTO t1(x) SELECT x FROM c;
INSERT INTO t2(x) SELECT x+9 FROM t1;
SELECT a.x, c.x
    FROM t1 AS a
    LEFT JOIN t1 AS b ON (a.x=b.x)
    LEFT JOIN t2 AS c ON (a.x=c.x);
CREATE TABLE s1 (a INTEGER PRIMARY KEY);
CREATE TABLE s2 (a INTEGER PRIMARY KEY);
CREATE TABLE s3 (a INTEGER);
CREATE UNIQUE INDEX ndx on s3(a);
EXPLAIN QUERY PLAN 
  SELECT s1.a FROM s1 left join s2 using (a);
EXPLAIN QUERY PLAN 
  SELECT s1.a FROM s1 left join s3 using (a);
CREATE TABLE u1(a INTEGER PRIMARY KEY, b, c);
CREATE TABLE u2(a INTEGER PRIMARY KEY, b, c);
CREATE INDEX u1ab ON u1(b, c);
EXPLAIN QUERY PLAN 
  SELECT u2.* FROM u2 LEFT JOIN u1 ON( u1.a=u2.a AND u1.b=u2.b AND u1.c=u2.c );
CREATE VIEW test AS
    SELECT *, 'x'
      FROM t1 LEFT JOIN (SELECT * FROM t2, t3) ON (c=b AND x=9)
      WHERE c IS NULL;
CREATE TABLE t0(c0);
CREATE VIEW v0(c0) AS SELECT CAST(t0.c0 AS INTEGER) FROM t0;
INSERT INTO t0(c0) VALUES (0);
SELECT typeof(c0), c0 FROM v0 WHERE c0>='0';
SELECT * FROM t0, v0 WHERE v0.c0 >= '0';
SELECT * FROM t0 LEFT JOIN v0 WHERE v0.c0 >= '0';
SELECT * FROM t0 LEFT JOIN v0 ON v0.c0 >= '0';
SELECT * FROM t0 LEFT JOIN v0 ON v0.c0 >= '0' WHERE TRUE 
  UNION SELECT 0,0 WHERE 0;
INSERT INTO t1 VALUES(23456);
CREATE VIEW v2(ccc) AS SELECT bbb IS 1234 FROM t2;
INSERT INTO t2 VALUES('some value');
SELECT (
    SELECT 1 FROM t2 LEFT JOIN (SELECT x AS v FROM t3) ON 500=v WHERE (v OR FALSE)
  ) FROM t1;
SELECT (
    SELECT 1 FROM t2 LEFT JOIN (SELECT x AS v FROM t3) ON 500=v WHERE (v)
  ) FROM t1;
SELECT (
    SELECT 1 FROM t2 LEFT JOIN (SELECT x AS v FROM t3) ON 500=v WHERE (v OR FALSE)
  ) FROM t1;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
CREATE TABLE t1(x TEXT, y INTEGER);
INSERT INTO t1(x,y) VALUES(NULL,-2),(NULL,1),('0',2);
CREATE TABLE t2(z INTEGER);
INSERT INTO t2(z) VALUES(2),(-2);
CREATE VIEW t3 AS SELECT z, (SELECT count(*) FROM t1) AS w FROM t2;
SELECT * FROM t1 LEFT JOIN t3 ON y=z;
DROP TABLE t1;
DROP TABLE t2;
DROP VIEW t3;
CREATE TABLE t1(a INTEGER PRIMARY KEY);
WITH RECURSIVE c(n) AS (VALUES(1) UNION ALL SELECT n+1 FROM c WHERE n<100)
    INSERT INTO t1(a) SELECT n FROM c;
CREATE VIEW t2(b) AS SELECT a FROM t1;
SELECT * FROM t1 LEFT JOIN t2 ON a=b LIMIT 10 OFFSET 98;
