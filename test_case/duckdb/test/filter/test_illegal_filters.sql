PRAGMA enable_verification;
CREATE TABLE integers(a INTEGER, b INTEGER);
INSERT INTO integers VALUES (2, 12);
SELECT * FROM integers WHERE SUM(a)>10;