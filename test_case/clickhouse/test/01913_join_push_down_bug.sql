set query_plan_filter_push_down = true;
SELECT id, flag FROM test t1
INNER JOIN  (SELECT DISTINCT id FROM test) AS t2 ON t1.id = t2.id
WHERE flag = 0 and t = 1 AND id NOT IN (SELECT 1 WHERE 0)
ORDER BY id;
DROP TABLE IF EXISTS test;
