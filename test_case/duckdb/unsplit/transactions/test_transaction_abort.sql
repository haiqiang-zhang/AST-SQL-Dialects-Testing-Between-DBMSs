PRAGMA enable_verification;
CREATE TABLE integers(i INTEGER PRIMARY KEY);
INSERT INTO integers VALUES (1), (2);
BEGIN TRANSACTION;
ROLLBACK;
SELECT 42;
SELECT 42;
SELECT * FROM integers ORDER BY 1;
