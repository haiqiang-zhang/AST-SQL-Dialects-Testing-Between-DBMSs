PRAGMA enable_verification;
ATTACH DATABASE ':memory:' AS new_database;
CREATE TABLE new_database.integers(i INTEGER);
INSERT INTO new_database.integers VALUES (42);
INSERT INTO new_database.main.integers VALUES (84);
SELECT * FROM new_database.integers ORDER BY i;
SELECT * FROM new_database.main.integers ORDER BY i;
SELECT * FROM new_database.integers ORDER BY new_database.integers.i;
SELECT * FROM new_database.main.integers ORDER BY new_database.main.integers.i;
