SET any_join_distinct_right_table_keys = 1;
SET joined_subquery_requires_alias = 0;
SELECT * FROM (SELECT 1 AS x) ALL LEFT JOIN (SELECT 1 AS x) USING x;
SELECT * FROM (SELECT 1 AS x) ALL LEFT JOIN (SELECT 2 AS x) USING x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL LEFT JOIN (SELECT 1 AS x) AS t2 USING x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL LEFT JOIN (SELECT 2 AS x) AS t2 USING x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL LEFT JOIN (SELECT 1 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL LEFT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT materialize(1) AS x) AS t1 ALL LEFT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL LEFT JOIN (SELECT materialize(2) AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ANY LEFT JOIN (SELECT 1 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ANY LEFT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT materialize(1) AS x) AS t1 ANY LEFT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ANY LEFT JOIN (SELECT materialize(2) AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL RIGHT JOIN (SELECT 1 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL RIGHT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT materialize(1) AS x) AS t1 ALL RIGHT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ALL RIGHT JOIN (SELECT materialize(2) AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ANY RIGHT JOIN (SELECT 1 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ANY RIGHT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT materialize(1) AS x) AS t1 ANY RIGHT JOIN (SELECT 2 AS x) AS t2 ON t1.x = t2.x;
SELECT * FROM (SELECT 1 AS x) AS t1 ANY RIGHT JOIN (SELECT materialize(2) AS x) AS t2 ON t1.x = t2.x;
