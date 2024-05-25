PRAGMA enable_verification;
CREATE TABLE v(x INT);
INSERT INTO v
VALUES
(1),(2),(3);
WITH RECURSIVE t(x) AS
(
  SELECT 1
    UNION ALL
  SELECT x + 1
  FROM   (SELECT t.x+1 FROM v AS _(p) FULL OUTER JOIN t ON t.x = p) AS _(x)
  WHERE  x < 10
) SELECT * FROM v AS _(p) RIGHT OUTER JOIN t ON t.x = p ORDER BY p, t NULLS LAST;
