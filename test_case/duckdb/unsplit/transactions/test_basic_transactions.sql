BEGIN TRANSACTION;
ROLLBACK;
BEGIN TRANSACTION;
CREATE TABLE integers(i INTEGER);
COMMIT;
SELECT * FROM integers;
BEGIN TRANSACTION;