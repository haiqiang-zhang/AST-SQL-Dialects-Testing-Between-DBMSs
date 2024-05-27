CREATE TABLE fruits(
     name TEXT COLLATE NOCASE,
     color TEXT COLLATE NOCASE
  );
INSERT INTO fruits (name, color) VALUES ('apple', 'RED');
INSERT INTO fruits (name, color) VALUES ('APPLE', 'yellow');
INSERT INTO fruits (name, color) VALUES ('pear', 'YELLOW');
INSERT INTO fruits (name, color) VALUES ('PEAR', 'green');
SELECT name, color, dense_rank() OVER (ORDER BY name) FROM fruits;
CREATE TABLE t1(a BLOB, b INTEGER, c COLLATE nocase);
INSERT INTO t1 VALUES(1, 2, 'abc');
INSERT INTO t1 VALUES(3, 4, 'ABC');
SELECT c=='Abc' FROM t1;
SELECT c=='Abc', rank() OVER (ORDER BY b) FROM t1;
SELECT b=='2' FROM t1;
CREATE TABLE t2(a,b,c);
SELECT EXISTS(SELECT 1 FROM t1 ORDER BY sum(a) OVER ()) FROM t1;
SELECT sum(a) OVER () FROM t2
   ORDER BY EXISTS(SELECT 1 FROM t2 ORDER BY sum(a) OVER ());
SELECT b, b=count(*), '1,2'                   FROM t1 GROUP BY b;
SELECT b, b=count(*), group_concat(b) OVER () FROM t1 GROUP BY b;
CREATE TABLE t0(c0);
INSERT INTO t0(c0) VALUES (0);
SELECT * FROM t0 WHERE 
  EXISTS (
    SELECT MIN(c0) OVER (), CUME_DIST() OVER () FROM t0
  ) >=1 AND 
  EXISTS (
    SELECT MIN(c0) OVER (), CUME_DIST() OVER () FROM t0
  ) <=1;
SELECT * FROM t0 WHERE EXISTS (
    SELECT MIN(c0) OVER (), CUME_DIST() OVER () FROM t0
  ) 
  BETWEEN 1 AND 1;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(x, y);
INSERT INTO t1 VALUES(10, 1);
INSERT INTO t1 VALUES(20, 2);
INSERT INTO t1 VALUES(3, 3);
INSERT INTO t1 VALUES(2, 4);
INSERT INTO t1 VALUES(1, 5);
SELECT avg(x) OVER (ORDER BY y) AS z FROM t1 ORDER BY z;
SELECT avg(x) OVER (ORDER BY y) z FROM t1 ORDER BY (z IS y);
SELECT avg(x) OVER (ORDER BY y) z FROM t1 ORDER BY (y IS z);
SELECT avg(x) OVER (ORDER BY y) z FROM t1 ORDER BY z + 0.0;
INSERT INTO t1 VALUES(1, 2), (3, 4);
CREATE VIEW v1 AS 
    SELECT 0 AS x
      UNION 
    SELECT count() OVER() FROM (SELECT 0) 
    ORDER BY 1;
SELECT min( max((SELECT x FROM v1)) ) OVER();
SELECT(
      SELECT x UNION 
      SELECT sum( avg((SELECT x FROM v1)) ) OVER()
  )
  FROM v1;