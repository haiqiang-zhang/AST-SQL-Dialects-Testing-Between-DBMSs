SET default_null_order='nulls_first';
PRAGMA enable_verification;
CREATE TABLE t1 (x INT, y INT);
INSERT INTO t1 VALUES (3, 3), (1, 1);
CREATE TABLE t2 (y INT, z INT);
INSERT INTO t2 VALUES (2, 2), (4, 4);
CREATE TABLE new_table AS (SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2);
SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2;
SELECT t1.x FROM t1 UNION ALL BY NAME SELECT x FROM t1 ORDER BY t1.x;
SELECT x FROM t1 UNION ALL BY NAME SELECT x FROM t1 ORDER BY t1.x;
(SELECT x FROM t1 UNION ALL SELECT x FROM t1) UNION ALL BY NAME SELECT 5 ORDER BY t1.x;
(SELECT x FROM t1 UNION ALL SELECT y FROM t1) UNION ALL BY NAME SELECT 5 ORDER BY y;
(SELECT x FROM t1 UNION ALL SELECT y FROM t1) UNION ALL BY NAME (SELECT z FROM t2 UNION ALL SELECT y FROM t2) ORDER BY y, z;
(SELECT x FROM t1 UNION ALL SELECT y FROM t1) UNION ALL BY NAME (SELECT z FROM t2 UNION ALL SELECT y FROM t2) ORDER BY t1.y;
SELECT 1 UNION ALL BY NAME SELECT * FROM range(2, 100) UNION ALL BY NAME SELECT 999 LIMIT 5;
SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2 ORDER BY z DESC;
SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2 ORDER BY y;
SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2 ORDER BY 3;
(SELECT x FROM t1 ORDER BY y) UNION ALL BY NAME (SELECT y FROM t2 ORDER BY z) ORDER BY x DESC;
SELECT 1 UNION ALL BY NAME SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2;
SELECT 1, 2 FROM t1 UNION SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2;
SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2 INTERSECT SELECT 2, 2 FROM t1;
(SELECT x, y FROM t1 UNION ALL BY NAME SELECT y, z FROM t2) EXCEPT SELECT NULL, 2, 2 FROM t1;
SELECT x, x as a FROM t1 UNION ALL BY NAME SELECT y FROM t2;
SELECT x as a FROM t1 UNION ALL BY NAME SELECT x FROM t1;
SELECT DISTINCT ON(x) x FROM (SELECT 1 as x UNION ALL BY NAME SELECT '1' as x);
SELECT DISTINCT ON(x) x FROM (SELECT 1 as x UNION ALL BY NAME SELECT 1.1 as x);
SELECT * FROM new_table;