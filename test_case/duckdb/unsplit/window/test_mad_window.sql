SET default_null_order='nulls_first';
PRAGMA enable_verification;
create table mads as select range r from range(20) union all values (NULL), (NULL), (NULL);
CREATE TABLE coverage AS SELECT * FROM (VALUES
	(1), (2), (3), (1)
	) tbl(r);
SELECT r % 2 as p, r, r/3.0, mad(r/3.0) over (partition by r % 2 order by r)
FROM mads ORDER BY 1, 2;
SELECT r, r/3.0, mad(r/3.0) over (order by r rows between 1 preceding and 1 following)
FROM mads ORDER BY 1, 2;
SELECT r, r/3.0, mad(r/3.0) over (order by r rows between 1 preceding and 3 following) FROM mads ORDER BY 1, 2;
SELECT r % 3 as p, r, n, mad(n) over (partition by r % 3 order by r)
FROM (SELECT r, CASE r % 2 WHEN 0 THEN r ELSE NULL END AS n FROM mads) nulls
ORDER BY 1, 2;
SELECT r, n, mad(n) over (order by r rows between 1 preceding and 1 following)
FROM (SELECT r, CASE r % 2 WHEN 0 THEN r ELSE NULL END AS n FROM mads) nulls
ORDER BY 1;
SELECT r, n, mad(n) over (order by r rows between 1 preceding and 3 following)
FROM (SELECT r, CASE r % 2 WHEN 0 THEN r ELSE NULL END AS n FROM mads) nulls
ORDER BY 1;
SELECT r, n, mad(n) over (order by r rows between unbounded preceding and unbounded following)
FROM (SELECT r, CASE r % 2 WHEN 0 THEN r ELSE NULL END AS n FROM mads) nulls
ORDER BY 1;
SELECT r, mad(r) OVER (ORDER BY r ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
FROM coverage
ORDER BY 1;
SELECT r % 2 as p, r, r/3.0, mad(r/3.0) over (partition by r % 2 order by r)
FROM mads ORDER BY 1, 2;
