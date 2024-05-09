CREATE TABLE t1(a);
CREATE TABLE t2(a);
CREATE TABLE t3(a,b);
INSERT INTO t1 VALUES(1);
INSERT INTO t3 VALUES(1,2);
SELECT * FROM t1 LEFT JOIN t2 USING(a) LEFT JOIN t3 USING(a);
SELECT t1.a, t3.b 
      FROM t1 LEFT JOIN t2 ON t1.a=t2.a LEFT JOIN t3 ON t2.a=t3.a;
SELECT t1.a, t3.b
      FROM t1 LEFT JOIN t2 ON t1.a=t2.a LEFT JOIN t3 ON t1.a=t3.a;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
CREATE TABLE t1(x,y);
CREATE TABLE t2(y,z);
CREATE TABLE t3(x,z);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t1 VALUES(3,4);
INSERT INTO t2 VALUES(2,3);
INSERT INTO t2 VALUES(4,5);
INSERT INTO t3 VALUES(1,3);
INSERT INTO t3 VALUES(3,5);
SELECT * FROM t1 JOIN t2 USING (y) JOIN t3 USING(x);
SELECT * FROM t1 NATURAL JOIN t2 NATURAL JOIN t3;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
CREATE TABLE t1(a,x,y);
INSERT INTO t1 VALUES(1,91,92);
INSERT INTO t1 VALUES(2,93,94);
CREATE TABLE t2(b,y,z);
INSERT INTO t2 VALUES(3,92,93);
INSERT INTO t2 VALUES(4,94,95);
CREATE TABLE t3(c,x,z);
INSERT INTO t3 VALUES(5,91,93);
INSERT INTO t3 VALUES(6,99,95);
SELECT * FROM t1 NATURAL JOIN t2 NATURAL JOIN t3;
SELECT * FROM t1 JOIN t2 NATURAL JOIN t3;
SELECT * FROM t1 JOIN t2 USING(y) NATURAL JOIN t3;
SELECT * FROM t1 NATURAL JOIN t2 JOIN t3 USING(x,z);
SELECT * FROM t1 NATURAL JOIN t2 JOIN t3 USING(x);
SELECT * FROM t1 NATURAL JOIN t2 JOIN t3 USING(z);
SELECT * FROM
         (SELECT 1 AS a, 91 AS x, 92 AS y UNION SELECT 2, 93, 94)
         NATURAL JOIN t2 NATURAL JOIN t3;
SELECT * FROM t1 NATURAL JOIN
         (SELECT 3 AS b, 92 AS y, 93 AS z UNION SELECT 4, 94, 95)
         NATURAL JOIN t3;
SELECT * FROM t1 NATURAL JOIN t2 NATURAL JOIN
         (SELECT 5 AS c, 91 AS x, 93 AS z UNION SELECT 6, 99, 95);
CREATE TABLE tx(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o PRIMARY KEY) 
  WITHOUT ROWID;
INSERT INTO tx VALUES(
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
  );
SELECT o FROM tx NATURAL JOIN tx;
CREATE TABLE ty(a,ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ,x6,x7,x8,Q,I,v,x1,L,E,x2,x3,x4,x5,s,g PRIMARY KEY,b,c)
  WITHOUT ROWID;
SELECT a FROM ty NATURAL JOIN ty;
