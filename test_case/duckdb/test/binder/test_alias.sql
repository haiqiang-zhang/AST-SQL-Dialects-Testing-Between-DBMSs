SELECT i % 2 AS p, SUM(i) AS sum_i FROM integers GROUP BY p ORDER BY 1;
SELECT alias(i % 2) AS p, alias(SUM(i)) AS sum_i FROM integers GROUP BY p ORDER BY 1;
SELECT i + 1 + 1 + 1 AS k, abs(i) AS l FROM integers WHERE i=1 ORDER BY 1;
SELECT alias(i + 1 + 1 + 1) AS k, alias(abs(i)) AS l FROM integers WHERE i=1 ORDER BY 1;
SELECT alias(i) AS k, alias(i IN (1)) AS l, alias(i >= 10) AS m, alias(1=0) AS n FROM integers WHERE i=1 ORDER BY 1;
SELECT alias(CASE WHEN i=1 THEN 19 ELSE 0 END) AS k, alias(i::VARCHAR) AS l FROM integers WHERE i=1 ORDER BY 1;
SELECT a, b, a * 2 AS c, b * (a * 2) AS d FROM test ORDER BY a;
SELECT alias(a), alias(b), alias(a * 2) AS c, alias(b * (a * 2)) AS d FROM test ORDER BY a;
select i as b, b as c, c as d, d as e from integers where e = 3;