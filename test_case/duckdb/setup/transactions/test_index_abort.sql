CREATE TABLE integers(i INTEGER PRIMARY KEY, j INTEGER);
INSERT INTO integers VALUES (1, 1), (2, 2), (3, 3);
BEGIN TRANSACTION;
COMMIT;