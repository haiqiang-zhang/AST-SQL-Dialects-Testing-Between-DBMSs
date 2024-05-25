CREATE TABLE r(a INT);
INSERT INTO r VALUES (1), (2), (-1), (-2);
CREATE TABLE s(a INT);
INSERT INTO s VALUES (1), (10), (20), (-10), (-20);
CREATE TABLE t(a INT);
INSERT INTO t VALUES (10), (100), (200), (-100), (-200);
PREPARE p FROM '(SELECT * FROM t LIMIT 3) LIMIT ?';
PREPARE p FROM '(SELECT * FROM t LIMIT ?) LIMIT 3';
DROP PREPARE p;
CREATE TABLE t1(a INT);
INSERT INTO t1 VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11);
DROP TABLE t1;
DROP TABLE r, s, t;
CREATE TABLE t(a INT);
INSERT INTO t VALUES (1), (2);
DROP TABLE t;
CREATE TABLE t1 (a INT NOT NULL, b CHAR (10) NOT NULL);
INSERT INTO t1 VALUES (1,'a'), (2,'b'), (3,'c'), (3,'c');
CREATE TABLE t2 (a INT NOT NULL, b CHAR (10) NOT NULL);
INSERT INTO t2 VALUES (3,'c'), (4,'d'), (5,'f'), (6,'e');
SELECT * FROM t1 WHERE a IN
        ( SELECT a FROM t1 UNION DISTINCT
          SELECT a FROM t1 ORDER BY (SELECT a) ) UNION DISTINCT
    SELECT * FROM t1
    ORDER BY (SELECT a);
CREATE TABLE t4 AS SELECT * from t1;
DELETE FROM t4;
INSERT INTO t4 SELECT a,b FROM t1 UNION DISTINCT SELECT a,b FROM t2;
SELECT * FROM t4;
SELECT FOUND_ROWS();
DROP TABLE t1, t2, t4;
CREATE TABLE t1 (f1 INT);
CREATE TABLE t2 (f1 INT, f2 INT ,f3 DATE);
CREATE TABLE t3 (f1 INT, f2 CHAR(10));
CREATE TABLE t4
( SELECT t2.f3 AS sdate
  FROM t1
  LEFT OUTER JOIN t2 ON (t1.f1 = t2.f1)
  INNER JOIN t3 ON (t2.f2 = t3.f1)
  ORDER BY t1.f1, t3.f1, t2.f3 )
UNION DISTINCT
( SELECT CAST('2004-12-31' AS DATE) AS sdate
  FROM t1
  LEFT OUTER JOIN t2 ON (t1.f1 = t2.f1)
  INNER JOIN t3 ON (t2.f2 = t3.f1)
  GROUP BY t1.f1
  ORDER BY t1.f1, t3.f1, t2.f3 )
ORDER BY sdate;
DROP TABLE t1, t2, t3, t4;
