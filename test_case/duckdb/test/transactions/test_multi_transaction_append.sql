PRAGMA enable_verification;
CREATE TABLE integers(i INTEGER, j INTEGER);
BEGIN TRANSACTION;
BEGIN TRANSACTION;
INSERT INTO integers VALUES (1, 3);
COMMIT;
COMMIT;
BEGIN TRANSACTION;
BEGIN TRANSACTION;
INSERT INTO integers VALUES (1, 3);
INSERT INTO integers VALUES (1, 3);
COMMIT;
COMMIT;
SELECT COUNT(*) FROM integers;
SELECT COUNT(*) FROM integers WHERE i=1;
SELECT COUNT(*) FROM integers;
SELECT COUNT(*) FROM integers WHERE i=1;
SELECT COUNT(*) FROM integers;
SELECT COUNT(*) FROM integers WHERE i=1;
SELECT COUNT(*) FROM integers;
SELECT COUNT(*) FROM integers;
SELECT COUNT(*) FROM integers;
SELECT COUNT(*) FROM integers;
SELECT * FROM integers;