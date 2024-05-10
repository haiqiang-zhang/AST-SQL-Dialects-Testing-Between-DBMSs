BEGIN;
CREATE TABLE t1(w int, x int, y int, z int);
CREATE UNIQUE INDEX i1w ON t1(w);
CREATE INDEX i1xy ON t1(x,y);
CREATE INDEX i1zyx ON t1(z,y,x);
SELECT * FROM t1 WHERE w=85 AND x=6 AND y=7396;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 WHERE w=85 AND x=6 AND y=7396;
SELECT * FROM t1 WHERE w=85 AND x=6 AND y=7396 AND rowid=85;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 WHERE w=85 AND x=6 AND y=7396 AND rowid=85;
SELECT * FROM t1 ORDER BY rowid LIMIT 2;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 ORDER BY rowid LIMIT 2;
SELECT * FROM t1 ORDER BY rowid DESC LIMIT 2;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 ORDER BY rowid DESC LIMIT 2;
SELECT * FROM t1 WHERE z IN (10207,10006) AND y IN (10000,10201)
                       AND x>0 AND x<10
      ORDER BY w;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE z IN (10207,10006) AND y IN (10000,10201)
                       AND x>0 AND x<10
      ORDER BY w;
SELECT * FROM t1 WHERE z IN (10207,10006) AND y=10000
                       AND x>0 AND x<10
      ORDER BY w;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE z IN (10207,10006) AND y=10000
                       AND x>0 AND x<10
      ORDER BY w;
SELECT * FROM t1 WHERE z=10006 AND y IN (10000,10201)
                       AND x>0 AND x<10
      ORDER BY w;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE z=10006 AND y IN (10000,10201)
                       AND x>0 AND x<10
      ORDER BY w;
SELECT * FROM t1 WHERE z IN (SELECT 10207 UNION SELECT 10006)
                         AND y IN (10000,10201)
                         AND x>0 AND x<10
        ORDER BY w;
EXPLAIN QUERY PLAN 
        SELECT * FROM t1 WHERE z IN (SELECT 10207 UNION SELECT 10006)
                         AND y IN (10000,10201)
                         AND x>0 AND x<10
        ORDER BY w;
SELECT * FROM t1 WHERE z IN (SELECT 10207 UNION SELECT 10006)
                         AND y IN (SELECT 10000 UNION SELECT 10201)
                         AND x>0 AND x<10
        ORDER BY w;
EXPLAIN QUERY PLAN 
        SELECT * FROM t1 WHERE z IN (SELECT 10207 UNION SELECT 10006)
                         AND y IN (SELECT 10000 UNION SELECT 10201)
                         AND x>0 AND x<10
        ORDER BY w;
SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x;
SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x DESC;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x DESC;
SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x, y;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x, y;
SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x, y DESC;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1
       WHERE x IN (1,2,3,4,5,6,7,8)
         AND y IN (10000,10001,10002,10003,10004,10005)
       ORDER BY x, y DESC;
SELECT * FROM t1 WHERE z IN (10207,10006,10006,10207)
      ORDER BY w;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE z IN (10207,10006,10006,10207)
      ORDER BY w;
SELECT * FROM t1 WHERE z IN (10207,10006,10006,10207)
      ORDER BY w DESC;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE z IN (10207,10006,10006,10207)
      ORDER BY w DESC;
SELECT * FROM t1 WHERE z IN (
           SELECT 10207 UNION ALL SELECT 10006
           UNION ALL SELECT 10006 UNION ALL SELECT 10207)
        ORDER BY w;
EXPLAIN QUERY PLAN 
        SELECT * FROM t1 WHERE z IN (
           SELECT 10207 UNION ALL SELECT 10006
           UNION ALL SELECT 10006 UNION ALL SELECT 10207)
        ORDER BY w;
SELECT * FROM t1 WHERE w=99 ORDER BY w;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 WHERE w=99 ORDER BY w;
SELECT * FROM t1 WHERE w IN (99) ORDER BY w;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE w IN (99) ORDER BY w;
SELECT * FROM t1 WHERE w IN (99) ORDER BY w DESC;
EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE w IN (99) ORDER BY w DESC;
SELECT * FROM t1 WHERE w=99 OR w=100 ORDER BY +w;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 WHERE w=99 OR w=100 ORDER BY +w;
SELECT * FROM t1 WHERE 99=w OR 100=w ORDER BY +w;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 WHERE 99=w OR 100=w ORDER BY +w;
SELECT * FROM t1 WHERE w=99 OR w=100 OR 6=w ORDER BY +w;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 WHERE w=99 OR w=100 OR 6=w ORDER BY +w;
SELECT * FROM t1 WHERE w=99 OR w=100 OR 6=+w ORDER BY +w;
EXPLAIN QUERY PLAN 
    SELECT * FROM t1 WHERE w=99 OR w=100 OR 6=+w ORDER BY +w;
SELECT *, '|' FROM t1 WHERE w=99 OR +w=100 OR 6=w ORDER BY +w;
EXPLAIN QUERY PLAN 
    SELECT *, '|' FROM t1 WHERE w=99 OR +w=100 OR 6=w ORDER BY +w;
SELECT *, '|' FROM t1 WHERE w=99 OR y=10201 OR 6=w ORDER BY +w;
EXPLAIN QUERY PLAN 
    SELECT *, '|' FROM t1 WHERE w=99 OR y=10201 OR 6=w ORDER BY +w;
SELECT b.* FROM t1 a, t1 b
     WHERE a.w=1 AND (a.y=b.z OR b.z=10)
     ORDER BY +b.w;
EXPLAIN QUERY PLAN 
    SELECT b.* FROM t1 a, t1 b
     WHERE a.w=1 AND (a.y=b.z OR b.z=10)
     ORDER BY +b.w;
SELECT b.* FROM t1 a, t1 b
     WHERE a.w=1 AND (b.z=10 OR a.y=b.z OR b.z=10)
     ORDER BY +b.w;
EXPLAIN QUERY PLAN 
    SELECT b.* FROM t1 a, t1 b
     WHERE a.w=1 AND (b.z=10 OR a.y=b.z OR b.z=10)
     ORDER BY +b.w;
CREATE TABLE t2249a(a TEXT UNIQUE, x CHAR(100));
CREATE TABLE t2249b(b INTEGER);
INSERT INTO t2249a(a) VALUES('0123');
INSERT INTO t2249b VALUES(123);
-- Because a is type TEXT and b is type INTEGER, both a and b
    -- will attempt to convert to NUMERIC before the comparison.
    -- They will thus compare equal.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=b;
EXPLAIN QUERY PLAN 
    -- Because a is type TEXT and b is type INTEGER, both a and b
    -- will attempt to convert to NUMERIC before the comparison.
    -- They will thus compare equal.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=b;
-- The + operator removes affinity from the rhs.  No conversions
    -- occur and the comparison is false.  The result is an empty set.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=+b;
EXPLAIN QUERY PLAN 
    -- The + operator removes affinity from the rhs.  No conversions
    -- occur and the comparison is false.  The result is an empty set.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=+b;
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE +b=a;
EXPLAIN QUERY PLAN 
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE +b=a;
-- Use + on both sides of the comparison to disable indices
    -- completely.  Make sure we get the same result.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE +a=+b;
EXPLAIN QUERY PLAN 
    -- Use + on both sides of the comparison to disable indices
    -- completely.  Make sure we get the same result.
    --
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE +a=+b;
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=b OR a='hello';
EXPLAIN QUERY PLAN 
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=b OR a='hello';
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE b=a OR a='hello';
EXPLAIN QUERY PLAN 
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE b=a OR a='hello';
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE 'hello'=a OR b=a;
EXPLAIN QUERY PLAN 
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE 'hello'=a OR b=a;
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a='hello' OR b=a;
EXPLAIN QUERY PLAN 
    SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a='hello' OR b=a;
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=+b OR a='hello';
EXPLAIN QUERY PLAN 
      SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=+b OR a='hello';
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a='hello' OR +b=a;
EXPLAIN QUERY PLAN 
      SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a='hello' OR +b=a;
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE +b=a OR a='hello';
EXPLAIN QUERY PLAN 
      SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE +b=a OR a='hello';
SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=+b OR +a='hello';
EXPLAIN QUERY PLAN 
      SELECT b,a FROM t2249b CROSS JOIN t2249a WHERE a=+b OR +a='hello';
SELECT x.a, y.a FROM t2249a x CROSS JOIN t2249a y WHERE x.a=y.a;
EXPLAIN QUERY PLAN 
    SELECT x.a, y.a FROM t2249a x CROSS JOIN t2249a y WHERE x.a=y.a;
SELECT x.a,y.a FROM t2249a x CROSS JOIN t2249a y
       WHERE x.a=y.a OR y.a='hello';
EXPLAIN QUERY PLAN 
      SELECT x.a,y.a FROM t2249a x CROSS JOIN t2249a y
       WHERE x.a=y.a OR y.a='hello';
SELECT x.a,y.a FROM t2249a x CROSS JOIN t2249a y
       WHERE y.a=x.a OR y.a='hello';
EXPLAIN QUERY PLAN 
      SELECT x.a,y.a FROM t2249a x CROSS JOIN t2249a y
       WHERE y.a=x.a OR y.a='hello';
SELECT x.a,y.a FROM t2249a x CROSS JOIN t2249a y
       WHERE y.a='hello' OR x.a=y.a;
EXPLAIN QUERY PLAN 
      SELECT x.a,y.a FROM t2249a x CROSS JOIN t2249a y
       WHERE y.a='hello' OR x.a=y.a;
create table t8(a unique, b, c);
insert into t8 values(1,2,3);
insert into t8 values(2,3,4);
create table t9(x,y);
insert into t9 values(2,4);
insert into t9 values(2,3);
select y from t8, t9 where a=1 order by a, y;
select * from t8 where a=1 order by b, c;
select * from t8, t9 where a=1 and y=3 order by b, x;
create unique index i9y on t9(y);
select * from t8, t9 where a=1 and y=3 order by b, x;
SELECT * FROM t1 WHERE x IN (20,21) AND y IN (1,2);
SELECT * FROM t1 WHERE x IN (1,2) AND y IN (-5,-6);
CREATE TABLE tx AS SELECT * FROM t1;
SELECT w FROM t1
       WHERE x IN (SELECT x FROM tx WHERE rowid<0)
         AND +y IN (SELECT y FROM tx WHERE rowid=1);
SELECT w FROM t1
       WHERE x IN (SELECT x FROM tx WHERE rowid=1)
         AND y IN (SELECT y FROM tx WHERE rowid<0);
CREATE INDEX tx_xyz ON tx(x, y, z, w);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 12 AND 14);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 12 AND 14)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 12 AND 14)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 2 AND 4);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 2 AND 4)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 2 AND 4)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN -4 AND -2);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN -4 AND -2)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN -4 AND -2)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 200 AND 300);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 200 AND 300)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE w BETWEEN 200 AND 300)
         AND y IN (SELECT y FROM t1 WHERE w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE +w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE +w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE +w BETWEEN 200 AND 300);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE +w BETWEEN 10 AND 20)
         AND y IN (SELECT y FROM t1 WHERE +w BETWEEN 200 AND 300)
         AND z IN (SELECT z FROM t1 WHERE +w BETWEEN 10 AND 20);
SELECT w FROM tx
       WHERE x IN (SELECT x FROM t1 WHERE +w BETWEEN 200 AND 300)
         AND y IN (SELECT y FROM t1 WHERE +w BETWEEN 10 AND 20)
         AND z IN (SELECT z FROM t1 WHERE +w BETWEEN 10 AND 20);
BEGIN;
CREATE TABLE t10(a,b,c);
INSERT INTO t10 VALUES(1,1,1);
INSERT INTO t10 VALUES(1,2,2);
INSERT INTO t10 VALUES(1,3,3);
CREATE INDEX i10 ON t10(a,b);
SELECT count(*) FROM t10;
SELECT * FROM t10 WHERE a=1 AND (b=2 OR b=3);
CREATE TABLE t11(a,b,c,d);
CREATE INDEX i11aba ON t11(a,b,a,c);
-- column A occurs twice.
    INSERT INTO t11 VALUES(1,2,3,4);
INSERT INTO t11 VALUES(5,6,7,8);
INSERT INTO t11 VALUES(1,2,9,10);
INSERT INTO t11 VALUES(5,11,12,13);
SELECT c FROM t11 WHERE a=1 AND b=2 ORDER BY c;
CREATE INDEX i11cccccccc ON t11(c,c,c,c,c,c,c,c);
-- repeated column
    SELECT d FROM t11 WHERE c=9;
SELECT d FROM t11 WHERE c IN (1,2,3,4,5);
SELECT d FROM t11 WHERE c=7 OR (a=1 AND b=2) ORDER BY d;
CREATE TABLE t12(x INTEGER PRIMARY KEY, y INT, z CHAR(100));
CREATE INDEX t12y ON t12(y);
CREATE TABLE t13(a,b);
CREATE INDEX t13a ON t13(a);
INSERT INTO t13 VALUES(4,5);
SELECT * FROM t13 WHERE (1=2 AND a=3) OR a=4;
CREATE TABLE t14a(x INTEGER PRIMARY KEY);
INSERT INTO t14a(x) VALUES(1),(2),(3),(4);
CREATE TABLE t14b(y INTEGER PRIMARY KEY);
INSERT INTO t14b(y) VALUES(1);
SELECT x FROM t14a WHERE x NOT IN (SELECT x FROM t14b);
