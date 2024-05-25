SET default_null_order='nulls_first';
PRAGMA enable_verification;
CREATE TABLE integers(g integer, i integer);
INSERT INTO integers values (0, 1), (0, 2), (1, 3), (1, NULL);
SELECT * FROM integers ORDER BY ALL;
SELECT * FROM integers ORDER BY * DESC;
SELECT * FROM integers ORDER BY * DESC NULLS LAST;
SELECT * FROM integers UNION ALL SELECT * FROM integers ORDER BY ALL;
SELECT * FROM integers UNION SELECT * FROM integers ORDER BY ALL;
