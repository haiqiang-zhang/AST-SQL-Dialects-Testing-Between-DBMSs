SELECT length(d) FROM t1;
INSERT INTO t1 VALUES(3,4,zeroblob(10000),5);
SELECT length(c), length(d) FROM t1;
INSERT INTO t1 VALUES(4,5,zeroblob(10000),zeroblob(10000));
SELECT length(c), length(d) FROM t1;
INSERT INTO t1 VALUES(5,zeroblob(10000),NULL,zeroblob(10000));
SELECT length(b), length(d) FROM t1 WHERE a=5;
SELECT a FROM t1 WHERE b=zeroblob(10000);
CREATE INDEX i1_1 ON t1(b);
SELECT a FROM t1 WHERE b=zeroblob(10000);
SELECT count(DISTINCT a) FROM (
        SELECT x'00000000000000000000' AS a
        UNION ALL
        SELECT zeroblob(10) AS a
      );
SELECT hex(zeroblob(2) || x'61');
SELECT CAST (zeroblob(100) AS REAL);
SELECT CAST (zeroblob(100) AS INTEGER);
SELECT CAST (zeroblob(100) AS TEXT);
SELECT zeroblob(100);
SELECT CAST(zeroblob(100) AS BLOB);
select zeroblob(-1);
select zeroblob(-10);
select zeroblob(-100);
select length(zeroblob(-1));
select zeroblob(-1)|1;
select hex(zeroblob(-1));
select typeof(zeroblob(-1));
SELECT 'hello' AS a, zeroblob(10) as b from t1 ORDER BY a, b;
SELECT length(zeroblob(-1444444444444444));
SELECT quote(zeroblob(-1444444444444444));
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(a,b,c);
CREATE INDEX t1bbc ON t1(b, b+c);
INSERT INTO t1(a,b,c) VALUES(1,zeroblob(8),3);
SELECT a, quote(b), length(b), c FROM t1;
