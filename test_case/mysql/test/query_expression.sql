SELECT * FROM (SELECT * FROM t INTERSECT SELECT * FROM t) AS derived ORDER BY i LIMIT 2;
DROP TABLE t;
