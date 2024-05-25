PRAGMA enable_verification;
CREATE TABLE wide AS (
	SELECT
		i,
		10 * (i + 0) AS c0,
		10 * (i + 1) AS c1,
		10 * (i + 2) AS c2,
		10 * (i + 3) AS c3,
		10 * (i + 4) AS c4,
		10 * (i + 5) AS c5,
		10 * (i + 6) AS c6,
		10 * (i + 7) AS c7,
		10 * (i + 8) AS c8,
		10 * (i + 9) AS c9
	FROM range(1, 10) tbl(i)
);
CREATE TABLE limits AS (
	SELECT 100 + (i * 17 % 100) AS z
	FROM range(1, 10) tbl(i)
);
CREATE TABLE wide_nulls AS (
	SELECT i, c0, c1, c2,
		CASE WHEN i % 7 = 0 THEN NULL ELSE c3 END AS c3,
		c4, c5, c6, c7,
		CASE WHEN i % 5 = 0 THEN NULL ELSE c8 END AS c8,
		c9
	FROM wide
);
CREATE TABLE limits_nulls AS (
	SELECT CASE WHEN z % 9 = 0 THEN NULL ELSE z END AS z
	FROM limits
);
CREATE TABLE many_bounds AS (
	SELECT * FROM (VALUES (2000, 4000)) tbl(lo, hi)
);
CREATE TABLE many_values AS (
	SELECT * from range(10 * 1024) tbl(val)
);
WITH lhs(i, j, k) AS (VALUES
	(100, 10, 1),
	(200, 20, 2)
),
rhs(p, q, r) AS (VALUES
	(100, 10, 1),
	(200, 20, 2)
)
SELECT lhs.*, rhs.*
FROM lhs, rhs
WHERE i <= p AND j <> q AND k IS DISTINCT FROM r;
WITH lhs(i, j, k) AS (VALUES
	(100, 10, 1),
	(200, 20, 2)
),
rhs(p, q, r) AS (VALUES
	(100, 10, 1),
	(200, 20, 2)
)
SELECT lhs.*, rhs.*
FROM lhs, rhs
WHERE i <= p AND k >= r AND j <= q
ORDER BY i;
SELECT * FROM wide;
SELECT z FROM limits;
SELECT i, z
FROM wide, limits
WHERE c0 < z
  AND c1 < z
  AND c2 < z
  AND c3 < z
  AND c4 < z
  AND c5 < z
  AND c6 < z
  AND c7 < z
  AND c8 < z
  AND c9 < z
ORDER BY 1, 2;
SELECT * FROM wide_nulls;
SELECT * FROM limits_nulls;
SELECT i, z
FROM wide_nulls, limits_nulls
WHERE c0 < z
  AND c1 < z
  AND c2 < z
  AND c3 < z
  AND c4 < z
  AND c5 < z
  AND c6 < z
  AND c7 < z
  AND c8 < z
  AND c9 < z
ORDER BY 1, 2;
SELECT i, z
FROM wide, limits
WHERE z BETWEEN c8 AND c9
ORDER BY 1, 2;
SELECT i, z
FROM wide_nulls, limits_nulls
WHERE z BETWEEN c8 AND c9
ORDER BY 1, 2;
SELECT i, z
FROM wide, limits
WHERE z NOT BETWEEN c8 AND c9
ORDER BY 1, 2;
SELECT i, z
FROM wide_nulls, limits_nulls
WHERE z NOT BETWEEN c8 AND c9
ORDER BY 1, 2;
SELECT lhs.i, rhs.i
FROM wide_nulls lhs, wide_nulls rhs
WHERE lhs.c3 < rhs.c0
  AND lhs.c8 IS DISTINCT FROM rhs.c3
ORDER BY 1, 2;
EXPLAIN
SELECT lhs.i, rhs.i
FROM wide_nulls lhs, wide_nulls rhs
WHERE lhs.c3 < rhs.c0
  AND lhs.c8 IS DISTINCT FROM rhs.c3
ORDER BY 1, 2;
SELECT COUNT(*)
FROM many_values, many_bounds
WHERE val BETWEEN lo AND hi;
