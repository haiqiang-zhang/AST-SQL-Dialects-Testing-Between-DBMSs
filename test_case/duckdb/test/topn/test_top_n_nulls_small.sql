PRAGMA enable_verification;
CREATE TABLE integers AS SELECT i, i j FROM range(1000) tbl(i) UNION ALL SELECT NULL i, range j FROM range(1000);
DROP TABLE integers;
CREATE TABLE integers AS SELECT NULL i, i j FROM range(1000) tbl(i) UNION ALL SELECT range i, range j FROM range(1000);
SELECT i FROM integers ORDER BY i ASC NULLS FIRST LIMIT 5;;
SELECT i FROM integers ORDER BY i ASC NULLS LAST LIMIT 5;;
SELECT i FROM integers ORDER BY i DESC NULLS FIRST LIMIT 5;;
SELECT i FROM integers ORDER BY i DESC NULLS LAST LIMIT 5;;
SELECT i FROM integers ORDER BY i NULLS FIRST LIMIT 5 OFFSET 1000;;
SELECT i FROM integers ORDER BY i DESC NULLS FIRST LIMIT 5 OFFSET 1000;;
SELECT i FROM integers ORDER BY i NULLS LAST LIMIT 5 OFFSET 1000;;
SELECT j, i FROM integers ORDER BY j, i NULLS FIRST LIMIT 5;;
SELECT j, i FROM integers ORDER BY j, i NULLS LAST LIMIT 5;;
SELECT j, i FROM integers ORDER BY j DESC, i DESC NULLS FIRST LIMIT 5;;
SELECT j, i FROM integers ORDER BY j DESC, i DESC NULLS LAST LIMIT 5;;
SELECT i, j FROM integers ORDER BY i DESC NULLS FIRST, j DESC LIMIT 5;;
SELECT i, j FROM integers ORDER BY i DESC NULLS LAST, j ASC LIMIT 5;;