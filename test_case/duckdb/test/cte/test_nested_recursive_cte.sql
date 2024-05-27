WITH RECURSIVE t(x) AS
(
  SELECT 1
    UNION ALL
  SELECT x+1
  FROM   t
  WHERE  x < 4
),
u(x) AS
(
  SELECT *
  FROM   t
    UNION ALL
  SELECT u.x * 2 + t.x
  FROM   u, t
  WHERE  u.x < 32
)
SELECT *
FROM   u
ORDER BY x
LIMIT 5;
WITH RECURSIVE collatz(x, t, steps) AS
(
  SELECT x, x, 0
  FROM   (WITH RECURSIVE n(t) AS (SELECT 1 UNION ALL SELECT t+1 FROM n WHERE t < 10) SELECT * FROM n) AS _(x)
    UNION ALL
  (SELECT x, CASE WHEN t%2 = 1 THEN t * 3 + p ELSE t / 2 END, steps + p
   FROM   collatz, (WITH RECURSIVE n(t) AS (SELECT 1 UNION ALL SELECT t+1 FROM n WHERE t < 1) SELECT * FROM n) AS _(p)
   WHERE  t <> 1)
)
SELECT * FROM collatz WHERE t = 1
ORDER BY x;