PRAGMA enable_verification;
CREATE TABLE integers AS SELECT 42 i, 84 j UNION ALL SELECT 13, 14;
SELECT * FROM integers WHERE COLUMNS(*) IS NULL ORDER BY ALL;
SELECT * FROM integers ORDER BY *, *;
