PRAGMA enable_verification;
CREATE TABLE test (a INTEGER, b INTEGER);;
INSERT INTO test VALUES (-1099511627776, 3);
INSERT INTO test VALUES (11, 22), (12, 21), (14, 22);
SELECT cast(200 AS TINYINT);
SELECT cast(-129 AS TINYINT);
SELECT cast(100 AS TINYINT) + cast(100 AS TINYINT);
CREATE TABLE test2 (a INTEGER, b TINYINT);;
INSERT INTO test2 VALUES (200, 60), (12, 60), (14, 60);
SELECT cast(a AS TINYINT) FROM test2;
SELECT 100::TINYINT - -50::TINYINT;
SELECT 100::TINYINT * 2::TINYINT;
SELECT 100::TINYINT + b::TINYINT FROM test2;
SELECT 100::TINYINT - -b::TINYINT FROM test2;
SELECT 100::TINYINT * b::TINYINT FROM test2;
SELECT a + b FROM (SELECT cast(100 AS TINYINT) AS a, cast(100 AS TINYINT) AS b) tbl1;
SELECT ALL CAST ( - SUM ( DISTINCT - CAST ( NULL AS INTEGER ) ) AS INTEGER ) FROM test;
SELECT b, AVG(a) FROM test GROUP BY b ORDER BY b;;
SELECT SUM(b) FROM test2;