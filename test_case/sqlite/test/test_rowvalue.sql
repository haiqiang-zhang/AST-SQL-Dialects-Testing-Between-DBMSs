SELECT (1, 2, 3) == (1, 2, 3);
SELECT (1, 2, 3) != (1, 2, 3);
SELECT (1, 2, 3) IS (1, 2, 3);
SELECT (1, 2, 3) IS NOT (1, 2, 3);
SELECT (SELECT 1, 2, 3) == (SELECT 1, 2, 3);
SELECT (SELECT 1, 2, 3) != (SELECT 1, 2, 3);
SELECT (1, 0, 3) == (1, 2, 3);
SELECT (1, 0, 3) != (1, 2, 3);
SELECT (1, 0, 3) IS (1, 2, 3);
SELECT (1, 0, 3) IS NOT (1, 2, 3);
SELECT (SELECT 1, 0, 3) == (SELECT 1, 2, 3);
SELECT (SELECT 1, 0, 3) != (SELECT 1, 2, 3);
SELECT (1, 2, NULL) == (1, 2, 3);
SELECT (1, 2, NULL) != (1, 2, 3);
SELECT (1, 2, NULL) IS (1, 2, 3);
SELECT (1, 2, NULL) IS NOT (1, 2, 3);
SELECT (SELECT 1, 2, NULL) == (SELECT 1, 2, 3);
SELECT (SELECT 1, 2, NULL) != (SELECT 1, 2, 3);
SELECT (1, 2, NULL) == (1, 2, NULL);
SELECT (1, 2, NULL) != (1, 2, NULL);
SELECT (1, 2, NULL) IS (1, 2, NULL);
SELECT (1, 2, NULL) IS NOT (1, 2, NULL);
SELECT (SELECT 1, 2, NULL) == (SELECT 1, 2, NULL);
SELECT (SELECT 1, 2, NULL) != (SELECT 1, 2, NULL);
SELECT (NULL, NULL, NULL) == (NULL, NULL, NULL);
SELECT (NULL, NULL, NULL) != (NULL, NULL, NULL);
SELECT (NULL, NULL, NULL) IS (NULL, NULL, NULL);
SELECT (NULL, NULL, NULL) IS NOT (NULL, NULL, NULL);
SELECT (SELECT NULL, NULL, NULL) == (SELECT NULL, NULL, NULL);
SELECT (SELECT NULL, NULL, NULL) != (SELECT NULL, NULL, NULL);
SELECT (1, NULL, 1) == (1, 1, 1);
SELECT (1, NULL, 1) != (1, 1, 1);
SELECT (1, NULL, 1) IS (1, 1, 1);
SELECT (1, NULL, 1) IS NOT (1, 1, 1);
SELECT (SELECT 1, NULL, 1) == (SELECT 1, 1, 1);
SELECT (SELECT 1, NULL, 1) != (SELECT 1, 1, 1);
SELECT (1, NULL, 1) == (1, 1, 2);
SELECT (1, NULL, 1) != (1, 1, 2);
SELECT (1, NULL, 1) IS (1, 1, 2);
SELECT (1, NULL, 1) IS NOT (1, 1, 2);
SELECT (SELECT 1, NULL, 1) == (SELECT 1, 1, 2);
SELECT (SELECT 1, NULL, 1) != (SELECT 1, 1, 2);
SELECT (1, 1, 3) < (1, 2, 3);
SELECT * FROM one WHERE (1, 1, 3) < (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 1, 3) < (1, 2, 3);
SELECT (1, 1, 3) > (1, 2, 3);
SELECT * FROM one WHERE (1, 1, 3) > (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 1, 3) > (1, 2, 3);
SELECT (1, 1, 3) <= (1, 2, 3);
SELECT * FROM one WHERE (1, 1, 3) <= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 1, 3) <= (1, 2, 3);
SELECT (1, 1, 3) >= (1, 2, 3);
SELECT * FROM one WHERE (1, 1, 3) >= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 1, 3) >= (1, 2, 3);
SELECT (1, 2, 3) < (1, 2, 3);
SELECT * FROM one WHERE (1, 2, 3) < (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 2, 3) < (1, 2, 3);
SELECT (1, 2, 3) > (1, 2, 3);
SELECT * FROM one WHERE (1, 2, 3) > (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 2, 3) > (1, 2, 3);
SELECT (1, 2, 3) <= (1, 2, 3);
SELECT * FROM one WHERE (1, 2, 3) <= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 2, 3) <= (1, 2, 3);
SELECT (1, 2, 3) >= (1, 2, 3);
SELECT * FROM one WHERE (1, 2, 3) >= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 2, 3) >= (1, 2, 3);
SELECT (1, 3, 3) < (1, 2, 3);
SELECT * FROM one WHERE (1, 3, 3) < (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) < (1, 2, 3);
SELECT (1, 3, 3) > (1, 2, 3);
SELECT * FROM one WHERE (1, 3, 3) > (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) > (1, 2, 3);
SELECT (1, 3, 3) <= (1, 2, 3);
SELECT * FROM one WHERE (1, 3, 3) <= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) <= (1, 2, 3);
SELECT (1, 3, 3) >= (1, 2, 3);
SELECT * FROM one WHERE (1, 3, 3) >= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) >= (1, 2, 3);
SELECT (1, NULL, 3) < (1, 2, 3);
SELECT * FROM one WHERE (1, NULL, 3) < (1, 2, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) < (1, 2, 3);
SELECT (1, NULL, 3) > (1, 2, 3);
SELECT * FROM one WHERE (1, NULL, 3) > (1, 2, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) > (1, 2, 3);
SELECT (1, NULL, 3) <= (1, 2, 3);
SELECT * FROM one WHERE (1, NULL, 3) <= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) <= (1, 2, 3);
SELECT (1, NULL, 3) >= (1, 2, 3);
SELECT * FROM one WHERE (1, NULL, 3) >= (1, 2, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) >= (1, 2, 3);
SELECT (1, 3, 3) < (1, NULL, 3);
SELECT * FROM one WHERE (1, 3, 3) < (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) < (1, NULL, 3);
SELECT (1, 3, 3) > (1, NULL, 3);
SELECT * FROM one WHERE (1, 3, 3) > (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) > (1, NULL, 3);
SELECT (1, 3, 3) <= (1, NULL, 3);
SELECT * FROM one WHERE (1, 3, 3) <= (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) <= (1, NULL, 3);
SELECT (1, 3, 3) >= (1, NULL, 3);
SELECT * FROM one WHERE (1, 3, 3) >= (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, 3, 3) >= (1, NULL, 3);
SELECT (1, NULL, 3) < (1, NULL, 3);
SELECT * FROM one WHERE (1, NULL, 3) < (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) < (1, NULL, 3);
SELECT (1, NULL, 3) > (1, NULL, 3);
SELECT * FROM one WHERE (1, NULL, 3) > (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) > (1, NULL, 3);
SELECT (1, NULL, 3) <= (1, NULL, 3);
SELECT * FROM one WHERE (1, NULL, 3) <= (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) <= (1, NULL, 3);
SELECT (1, NULL, 3) >= (1, NULL, 3);
SELECT * FROM one WHERE (1, NULL, 3) >= (1, NULL, 3);
SELECT * FROM one WHERE NOT (1, NULL, 3) >= (1, NULL, 3);
CREATE TABLE t1(x, y);
INSERT INTO t1 VALUES(1, 1);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(2, 3);
INSERT INTO t1 VALUES(2, 4);
INSERT INTO t1 VALUES(3, 5);
INSERT INTO t1 VALUES(3, 6);
SELECT (1, 1) == (SELECT x,y FROM t1 ORDER BY y);
SELECT (1, 1) == (SELECT * FROM t1 ORDER BY y);
SELECT (SELECT * FROM t1 ORDER BY y) == (SELECT * FROM t1 ORDER BY y);
SELECT (SELECT 0, 0) == (SELECT * FROM t1 ORDER BY y);
SELECT (1, 1) == (SELECT x,y FROM t1 ORDER BY x, y);
SELECT (1, 1) == (SELECT * FROM t1 ORDER BY x, y);
SELECT (SELECT * FROM t1 ORDER BY x, y) == (SELECT * FROM t1 ORDER BY x, y);
SELECT (SELECT 0, 0) == (SELECT * FROM t1 ORDER BY x, y);
SELECT (1, 2) == (SELECT x,y FROM t1 ORDER BY x, y DESC);
SELECT (1, 2) == (SELECT * FROM t1 ORDER BY x, y DESC);
SELECT (SELECT * FROM t1 ORDER BY x, y DESC) == (SELECT * FROM t1 ORDER BY x, y DESC);
SELECT (SELECT 0, 0) == (SELECT * FROM t1 ORDER BY x, y DESC);
SELECT (3, 6) == (SELECT x,y FROM t1 ORDER BY x DESC, y DESC);
SELECT (3, 6) == (SELECT * FROM t1 ORDER BY x DESC, y DESC);
SELECT (SELECT * FROM t1 ORDER BY x DESC, y DESC) == (SELECT * FROM t1 ORDER BY x DESC, y DESC);
SELECT (SELECT 0, 0) == (SELECT * FROM t1 ORDER BY x DESC, y DESC);
SELECT ((3, 5)) == (SELECT x,y FROM t1 ORDER BY x DESC, y);
SELECT ((3, 5)) == (SELECT * FROM t1 ORDER BY x DESC, y);
SELECT (SELECT * FROM t1 ORDER BY x DESC, y) == (SELECT * FROM t1 ORDER BY x DESC, y);
SELECT (SELECT 0, 0) == (SELECT * FROM t1 ORDER BY x DESC, y);
SELECT (SELECT 3, 5) == (SELECT x,y FROM t1 ORDER BY x DESC, y);
SELECT (SELECT 3, 5) == (SELECT * FROM t1 ORDER BY x DESC, y);
SELECT (SELECT * FROM t1 ORDER BY x DESC, y) == (SELECT * FROM t1 ORDER BY x DESC, y);
SELECT (SELECT 0, 0) == (SELECT * FROM t1 ORDER BY x DESC, y);
SELECT (2, 2) BETWEEN (2, 2) AND (3, 3);
SELECT (2, 2) BETWEEN (2, NULL) AND (3, 3);
SELECT (2, 2) BETWEEN (3, NULL) AND (3, 3);
SELECT (2, 4) IN (SELECT * FROM t1);
SELECT (3, 4) IN (SELECT * FROM t1);
SELECT (NULL, 4) IN (SELECT * FROM t1);
SELECT (NULL, 0) IN (SELECT * FROM t1);
SELECT (NULL, 4) NOT IN (SELECT * FROM t1);
SELECT (NULL, 0) NOT IN (SELECT * FROM t1);
CREATE TABLE hh(a, b, c);
INSERT INTO hh VALUES('abc', 1, 'i');
INSERT INTO hh VALUES('ABC', 1, 'ii');
INSERT INTO hh VALUES('def', 2, 'iii');
INSERT INTO hh VALUES('DEF', 2, 'iv');
INSERT INTO hh VALUES('GHI', 3, 'v');
INSERT INTO hh VALUES('ghi', 3, 'vi');
CREATE INDEX hh_ab ON hh(a, b);
SELECT c FROM hh WHERE (a, b) = (SELECT 'abc', 1);
SELECT c FROM hh WHERE (a, b) = (SELECT 'abc' COLLATE nocase, 1);
SELECT c FROM hh WHERE a = (SELECT 'abc' COLLATE nocase) AND b = (SELECT 1);
SELECT c FROM hh WHERE +a = (SELECT 'abc' COLLATE nocase) AND b = (SELECT 1);
SELECT c FROM hh WHERE a = (SELECT 'abc') COLLATE nocase AND b = (SELECT 1);
SELECT c FROM hh WHERE (a COLLATE nocase, b) = (SELECT 'def', 2);
SELECT c FROM hh WHERE (a COLLATE nocase, b) IS NOT (SELECT 'def', 2);
SELECT c FROM hh WHERE (b, a) = (SELECT 2, 'def');
CREATE TABLE xy(i INTEGER PRIMARY KEY, j, k);
INSERT INTO xy VALUES(1, 1, 1);
INSERT INTO xy VALUES(2, 2, 2);
INSERT INTO xy VALUES(3, 3, 3);
INSERT INTO xy VALUES(4, 4, 4);
EXPLAIN QUERY PLAN SELECT * FROM xy WHERE (i, j) IS (2, 2);
SELECT * FROM xy WHERE (i, j) IS (2, 2);
EXPLAIN QUERY PLAN SELECT * FROM xy WHERE (k, j) < (2, 3);
SELECT * FROM xy WHERE (k, j) < (2, 3);
EXPLAIN QUERY PLAN SELECT * FROM xy WHERE (i, j) < (2, 3);
SELECT * FROM xy WHERE (i, j) < (2, 3);
EXPLAIN QUERY PLAN SELECT * FROM xy WHERE (i, j) > (2, 1);
SELECT * FROM xy WHERE (i, j) > (2, 1);
EXPLAIN QUERY PLAN SELECT * FROM xy WHERE (i, j) > ('2', 1);
SELECT * FROM xy WHERE (i, j) > ('2', 1);
CREATE TABLE j1(a);
CREATE TABLE t2(a INTEGER PRIMARY KEY, b, c);
INSERT INTO t2 VALUES(1, 1, 1);
INSERT INTO t2 VALUES(2, 2, 2);
INSERT INTO t2 VALUES(3, 3, 3);
INSERT INTO t2 VALUES(4, 4, 4);
INSERT INTO t2 VALUES(5, 5, 5);
SELECT c FROM t2 WHERE (a, b) > (2, 1);
SELECT c FROM t2 WHERE (a, b) > (2, 2);
SELECT c FROM t2 WHERE (a, b) < (4, 5);
SELECT c FROM t2 WHERE (a, b) < (4, 3);
CREATE TABLE dual(dummy);
INSERT INTO dual(dummy) VALUES('X');
CREATE TABLE t3(a TEXT,b TEXT,c TEXT,d TEXT,e TEXT,f TEXT);
CREATE INDEX t3x ON t3(b,c,d,e,f);
SELECT a FROM t3
    WHERE (c,d) IN (SELECT 'c','d' FROM dual)
    AND (a,b,e) IN (SELECT 'a','b','d' FROM dual);
CREATE TABLE t11(a);
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(a INT,b INT);
INSERT INTO t1 VALUES(1,2);
DROP TABLE IF EXISTS t2;
CREATE TABLE t2(x INT,y INT);
INSERT INTO t2 VALUES(3,4);
SELECT *,'x' FROM t1 LEFT JOIN t2 ON (a,b)=(x,y);
SELECT t1.*, t2.* FROM t2 RIGHT JOIN t1 ON (a,b)=(x,y);
SELECT t1.*, t2.* FROM t1 FULL JOIN t2 ON (a,b)=(x,y)
   ORDER BY coalesce(a,x);
CREATE TABLE t12(x);
INSERT INTO t12 VALUES(2), (4);
SELECT 1 WHERE (2,2) BETWEEN (1,1) AND (3,3);
SELECT CASE (2,2) WHEN (1, 1) THEN 2 ELSE 1 END;
SELECT CASE (SELECT 2,2) WHEN (1, 1) THEN 2 ELSE 1 END;
SELECT 1 WHERE (SELECT 2,2) BETWEEN (1,1) AND (3,3);
SELECT 1 FROM t12 WHERE (x,1) BETWEEN (1,1) AND (3,3);
SELECT 1 FROM t12 WHERE (1,x) BETWEEN (1,1) AND (3,3);
CREATE TABLE x1(a PRIMARY KEY, b);
CREATE TABLE x2(a INTEGER PRIMARY KEY, b);
CREATE TABLE t16a(a,b,c);
INSERT INTO t16a VALUES(1,2,3);
CREATE TABLE t16b(x);
INSERT INTO t16b(x) VALUES(1);
UPDATE t16b SET x=7;
SELECT * FROM t16a;
UPDATE t16b SET x=97;
SELECT * FROM t16a;
CREATE TABLE t16c(a, b, c, d, e);
INSERT INTO t16c VALUES(1, 'a', 'b', 'c', 'd');
SELECT * FROM t16c;
INSERT INTO t16c VALUES(2, 'w', 'x', 'y', 'z');
SELECT * FROM t16c;
PRAGMA recursive_triggers = 1;
INSERT INTO t16c VALUES(3, 'i', 'ii', 'iii', 'iv');
UPDATE t16c SET a=a WHERE a=3;
SELECT * FROM t16c;
CREATE TABLE b1(a, b);
CREATE TABLE b2(x);
SELECT * FROM b2 CROSS JOIN b1 
  WHERE b2.x=b1.a AND (b1.a, 2) 
  IN (VALUES(1, 2));
CREATE TABLE b3 ( a, b, PRIMARY KEY (a, b) );
CREATE TABLE b4 ( a );
CREATE TABLE b5 ( a, b );
INSERT INTO b3 VALUES (1, 1), (1, 2);
INSERT INTO b4 VALUES (1);
INSERT INTO b5 VALUES (1, 1), (1, 2);
SELECT * FROM b3 WHERE (SELECT b3.a, b3.b) IN ( SELECT a, b FROM b5 );
SELECT * FROM b3 WHERE (VALUES(b3.a, b3.b)) IN ( SELECT a, b FROM b5 );
SELECT * FROM b3 WHERE (b3.a, b3.b) IN ( SELECT a, b FROM b5 );
SELECT * FROM b3 JOIN b4 ON b4.a = b3.a
  WHERE (SELECT b3.a, b3.b) IN ( SELECT a, b FROM b5 );
SELECT * FROM b3 JOIN b4 ON b4.a = b3.a
  WHERE (VALUES(b3.a, b3.b)) IN ( SELECT a, b FROM b5 );
SELECT * FROM b3 JOIN b4 ON b4.a = b3.a
  WHERE (b3.a, b3.b) IN ( SELECT a, b FROM b5 );
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(a INTEGER PRIMARY KEY,b);
INSERT INTO t1(a,b) VALUES(1,11),(2,22),(3,33),(4,44);
SELECT * FROM t1 WHERE (a,b)>(0,0) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)>=(0,0) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)<(5,0) ORDER BY a DESC;
SELECT * FROM t1 WHERE (a,b)<=(5,0) ORDER BY a DESC;
SELECT * FROM t1 WHERE (a,b)>(3,0) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)>=(3,0) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)<(3,0) ORDER BY a DESC;
SELECT * FROM t1 WHERE (a,b)<=(3,0) ORDER BY a DESC;
SELECT * FROM t1 WHERE (a,b)>(3,32) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)>(3,33) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)>=(3,33) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)>=(3,34) ORDER BY a;
SELECT * FROM t1 WHERE (a,b)<(3,34) ORDER BY a DESC;
SELECT * FROM t1 WHERE (a,b)<(3,33) ORDER BY a DESC;
SELECT * FROM t1 WHERE (a,b)<=(3,33) ORDER BY a DESC;
SELECT * FROM t1 WHERE (a,b)<=(3,32) ORDER BY a DESC;
SELECT * FROM t1 WHERE (0,0)<(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (0,0)<=(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (5,0)>(a,b) ORDER BY a DESC;
SELECT * FROM t1 WHERE (5,0)>=(a,b) ORDER BY a DESC;
SELECT * FROM t1 WHERE (3,0)<(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (3,0)<=(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (3,0)>(a,b) ORDER BY a DESC;
SELECT * FROM t1 WHERE (3,0)>=(a,b) ORDER BY a DESC;
SELECT * FROM t1 WHERE (3,32)<(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (3,33)<(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (3,33)<=(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (3,34)<=(a,b) ORDER BY a;
SELECT * FROM t1 WHERE (3,34)>(a,b) ORDER BY a DESC;
SELECT * FROM t1 WHERE (3,33)>(a,b) ORDER BY a DESC;
SELECT * FROM t1 WHERE (3,33)>=(a,b) ORDER BY a DESC;
SELECT * FROM t1 WHERE (3,32)>=(a,b) ORDER BY a DESC;
SELECT 1 WHERE (2,(2,0)) IS (2,(2,0));
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(a,b,PRIMARY KEY(b,b));
INSERT INTO t1 VALUES(1,2),(3,4),(5,6);
SELECT * FROM t1 WHERE (a,b) IN (VALUES(1,2));
SELECT (SELECT 3,4 UNION SELECT 5,6 ORDER BY 1) IN (SELECT 3,4);
SELECT (SELECT 3,4 UNION SELECT 5,6 ORDER BY 1) IN (SELECT 5,6);
SELECT (SELECT 5,6 UNION SELECT 3,4 ORDER BY 1) IN (SELECT 3,4);
SELECT (SELECT 5,6 UNION SELECT 3,4 ORDER BY 1) IN (SELECT 5,6);
SELECT (SELECT 3,4 UNION SELECT 5,6 ORDER BY 1 DESC) IN (SELECT 3,4);
SELECT (SELECT 3,4 UNION SELECT 5,6 ORDER BY 1 DESC) IN (SELECT 5,6);
SELECT (SELECT 5,6 UNION SELECT 3,4 ORDER BY 1 DESC) IN (SELECT 3,4);
SELECT (SELECT 5,6 UNION SELECT 3,4 ORDER BY 1 DESC) IN (SELECT 5,6);
DROP TABLE IF EXISTS t0;
CREATE TABLE t0(aa COLLATE NOCASE, bb);
INSERT INTO t0 VALUES('a', 'A');
SELECT (+bb,1) >= (aa, 1), (aa,1)<=(+bb,1) FROM t0;
SELECT 2 FROM t0 WHERE (+bb,1) >= (aa,1);
SELECT 3 FROM t0 WHERE (aa,1) <= (+bb,1);
SELECT (SELECT +bb,1) >= (aa, 1), (aa,1)<=(SELECT +bb,1) FROM t0;
SELECT 2 FROM t0 WHERE (SELECT +bb,1) >= (aa,1);
SELECT 3 FROM t0 WHERE (aa,1) <= (SELECT +bb,1);
DROP TABLE t0;
CREATE TABLE t0(c0 TEXT PRIMARY KEY);
INSERT INTO t0(c0) VALUES ('');
SELECT (t0.c0, TRUE) > (CAST(0 AS REAL), FALSE) FROM t0;
SELECT 2 FROM t0 WHERE (t0.c0, TRUE) > (CAST('' AS REAL), FALSE);
DROP TABLE t0;
CREATE TABLE t0(c0 UNIQUE);
INSERT INTO t0(c0) VALUES('a');
SELECT (t0.c0, 0) < ('B' COLLATE NOCASE, 0) FROM t0;
SELECT 2 FROM t0 WHERE (t0.c0, 0) < ('B' COLLATE NOCASE, 0);
SELECT ('B' COLLATE NOCASE, 0)> (t0.c0, 0) FROM t0;
SELECT 2 FROM t0 WHERE ('B' COLLATE NOCASE, 0)> (t0.c0, 0);
SELECT ('B', 0)> (t0.c0 COLLATE nocase, 0) FROM t0;
SELECT 2 FROM t0 WHERE ('B', 0)> (t0.c0 COLLATE nocase, 0);
SELECT (t0.c0 COLLATE nocase, 0) < ('B', 0) FROM t0;
SELECT 2 FROM t0 WHERE (t0.c0 COLLATE nocase, 0) < ('B', 0);
SELECT (c0, x'') != (NULL, 0) FROM t1 LEFT JOIN t0;
SELECT 2 FROM t1 LEFT JOIN t0 ON (c0, x'') != (NULL, 0);
SELECT 21 FROM t0 RIGHT JOIN t1 ON (c0, x'') != (NULL, 0);
SELECT 3 FROM t1 LEFT JOIN t0 WHERE (c0, x'') != (NULL, 0);
SELECT 31 FROM t0 RIGHT JOIN t1 WHERE (c0, x'') != (NULL, 0);
INSERT INTO t0(c0) VALUES(0) ON CONFLICT(c0) DO UPDATE SET c0 = 3;
DELETE FROM t0;
INSERT INTO t2 VALUES(NULL, NULL);
SELECT * FROM t2;
CREATE TABLE a(a1 PRIMARY KEY,a2);
INSERT INTO a VALUES(1,5);
CREATE TABLE b(b1 UNIQUE,b2);
SELECT * FROM a LEFT JOIN b ON b2=NULL AND b2=5 WHERE (b1,substr(b.b1,1,1))==(SELECT 1024,'b');
SELECT * FROM b RIGHT JOIN a ON b2=NULL AND b2=5 WHERE (b1,substr(b.b1,1,1))==(SELECT 1024,'b');
INSERT INTO t1(a, b) VALUES (0, 1),(15,-7),(3,100);
ANALYZE;
SELECT * FROM t1 WHERE (b,a) BETWEEN (0,5) AND (99,-2);
SELECT * FROM t1 WHERE (b,a) BETWEEN (-8,5) AND (0,-2);
SELECT * FROM t1 WHERE (b,a) BETWEEN (3,5) AND (100,4);
SELECT * FROM t1 WHERE (b,a) BETWEEN (3,5) AND (100,2);
SELECT * FROM t1 WHERE (a,b) BETWEEN (-2,99) AND (1,0);
SELECT * FROM t1 WHERE (a,b) BETWEEN (14,99) AND (16,0);
SELECT * FROM t1 WHERE (a,b) BETWEEN (2,99) AND (4,0);