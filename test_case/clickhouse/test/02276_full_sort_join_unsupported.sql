DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1 (key UInt32, val UInt32) ENGINE = Memory;
INSERT INTO t1 VALUES (1, 1);
CREATE TABLE t2 (key UInt32, val UInt32) ENGINE = Memory;
INSERT INTO t2 VALUES (1, 2);
SET join_algorithm = 'full_sorting_merge';
SELECT * FROM t1 JOIN t2 ON t1.key = t2.key OR t1.val = t2.key;
SELECT * FROM t1 ANTI JOIN t2 ON t1.key = t2.key;
SELECT * FROM t1 SEMI JOIN t2 ON t1.key = t2.key;
SELECT * FROM t1 ASOF JOIN t2 ON t1.key = t2.key AND t1.val > t2.val;
SELECT * FROM t1 ANY JOIN t2 ON t1.key = t2.key SETTINGS any_join_distinct_right_table_keys = 1;
SELECT * FROM t1 JOIN t2 USING (key) SETTINGS join_use_nulls = 1;
SELECT * FROM ( SELECT key, sum(val) AS val FROM t1 GROUP BY key WITH TOTALS ) as t1
JOIN ( SELECT key, sum(val) AS val FROM t2 GROUP BY key WITH TOTALS ) as t2 ON t1.key = t2.key;
SELECT * FROM t1 JOIN ( SELECT key, sum(val) AS val FROM t2 GROUP BY key WITH TOTALS ) as t2 ON t1.key = t2.key;
SELECT * FROM ( SELECT key, sum(val) AS val FROM t1 GROUP BY key WITH TOTALS ) as t1 JOIN t2 ON t1.key = t2.key;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
